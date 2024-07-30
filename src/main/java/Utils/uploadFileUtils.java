package Utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class uploadFileUtils {
    public String UploadFileUtils(HttpServletRequest request, HttpServletResponse response, ServletContext getServletContext) throws IOException {
        final long serialVersionUID =1L;
        // 上传文件存储目录
        final String  UPLOAD_DIRECTORY="UPLOAD";
        // 上传配置
        final int MEMORY_THRESHOLD = 1024*1024*3;
        final  int MAX_FILE_SIZE = 1024*1024*40;
        final  int MAX_REQUEST_SIZE =1024*1024*50;
        //判断上传的文件为多媒体类型的文件

        if(!ServletFileUpload.isMultipartContent(request)){
            // 如果不是则停止
            return "Error:表单必须包含 enctype=multipart/form-data";
        }
        // 配置上传参数
        DiskFileItemFactory diskFileItemFactory =new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        diskFileItemFactory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        diskFileItemFactory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        // 中文处理
        upload.setHeaderEncoding("utf-8");
        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String upLoadPath =getServletContext+File.separator+UPLOAD_DIRECTORY;
        File uploadDir = new File(upLoadPath);
        // 如果目录不存在则创建
        if (!uploadDir.exists()){
            uploadDir.mkdir();
        }
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unChecked")
            List<FileItem> formItems =upload.parseRequest(request);
            // 迭代表单数
            if(formItems != null && formItems.size()>0){
                for (FileItem item: formItems){
                    // 处理不在表单中的字段
                    if (!item.isFormField()){
                        String username = new File(item.getName()).getName();
                        String filename = upLoadPath+File.separator+username;
                        // 在控制台输出文件的上传路径
                        File storeFile = new File(filename);
                        // 保存文件到硬盘
                        item.write(storeFile);
                    }
                }
            }
        }catch (Exception e){
            return e.getMessage();
        }
        return "文件上传成功";
    }

}