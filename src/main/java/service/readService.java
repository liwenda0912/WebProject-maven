package service;

import Dao.To_read;
import Utils.jsonTransform;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class readService implements To_read {
    @Override
    public String UploadFileUtils(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message;
        sqlService sqlService =new sqlService();
        request.setCharacterEncoding("utf-8");
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    String filename = new File(item.getName()).getName();
                    String[] name=filename.split("\\.");
                    // 在控制台输出文件的上传路径
                    Workbook workbook;
                    if (!item.isFormField()) {
                        InputStream fileContent = item.getInputStream();
                        if (name[1].equals("xls")){
                            workbook = new HSSFWorkbook(fileContent);
                        }else if(name[1].equals("xlsx")){
                            workbook = new XSSFWorkbook(fileContent);
                        }else {
                            message= "上传文件不是excel文件";
                            return message;
                        }
                        // 获取excel表的表头
                        Sheet sheet = workbook.getSheetAt(0);
                        // 进行导入数据操作
                        int SQL_CODE=sqlService.readUpdata(readSheet(sheet));
                        workbook.close();
                        if (SQL_CODE!=0){
                            message="文件导入失败";
                            return message;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "";
                return message;
            }
            message = "文件上传成功";
        } else {
            System.out.println("Sorry, this Servlet only handles file upload request");
            message = "Error:表单必须包含 enctype=multipart/form-data";
        }
       return message;
    }
    @Override
    public JSONArray readSheet(Sheet sheet){
        JSONObject set = null;
        JSONArray array = new JSONArray();
        jsonTransform jsonTransform = new jsonTransform();
        List<String> array_text = new ArrayList<String>();
        // 读取Excel内容的代码
        int sheet_rows =sheet.getLastRowNum();
        for (int j =1 ; j<sheet_rows;j++){
            //获取某行的数据
            Row column = sheet.getRow(j);
            //获取某行的列数
            int columns = column.getLastCellNum();
            for (int i =1;i<columns; i++) {
                // 给数组array_text插入数据
                array_text.add(String.valueOf(column.getCell(i)));
            }
            //将数组和表的第一列数据变成json格式
            JSONObject data = jsonTransform.putJson(array_text, sheet.getRow(0));
            array_text.clear();
            // 将json对象的data添加到json列表
            array.put(data);
        }
        return array;
    }
}
