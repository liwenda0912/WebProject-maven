package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.readService;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID =1L;
    // 上传文件存储目录
    private  static final String  UPLOAD_DIRECTORY="UPLOAD";
    // 上传配置
    private  static final int MEMORY_THRESHOLD = 1024*1024*3;
    private  static final  int MAX_FILE_SIZE = 1024*1024*40;
    private  static final  int MAX_REQUEST_SIZE =1024*1024*50;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //判断上传的文件为多媒体类型的文件
        response.setContentType("application/json;charset=UTF-8");//定义servlet返回信息的格式
        // 定义读取excel服务的类
        readService readService = new readService();
        //调用读取服务并读取请求的excel文档并保存
        String Result = readService.UploadFileUtils(request,response);
        if ("Error:表单必须包含 enctype=multipart/form-data".equals(Result)){
            //响应请求上传格式错误
            PrintWriter writer = response.getWriter();
            writer.println("Error:表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }else if("文件上传成功".equals(Result)){
            //响应请求文件上传成功
            String message = "{\"state\":\"true\",\"code\":\"200\",\"message\":\"上传成功\"}";
            response.getWriter().write(message);
        }else if("文件导入失败".equals(Result)){
            //响应请求文件导入失败
            String message = "{\"state\":\"true\",\"code\":\"501\",\"message\":\"文件导入失败,请确定导入的格式正确！\"}";
            response.getWriter().write(message);
        }else {
            //上传文件不是excel文件
            String message = "{\"state\":\"true\",\"code\":\"404\",\"message\":\"上传文件不是excel文件\"}";
            response.getWriter().write(message);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
