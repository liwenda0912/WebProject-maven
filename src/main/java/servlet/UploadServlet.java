package servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID =1L;
    private  static final String  UPLOAD_DIRECTORY="UPLOAD";
    private  static final int MEMORY_THRESHOLD = 1024*1024*3;
    private  static final  int MAX_FILE_SIZE = 1024*1024*40;
    private  static final  int MAX_REQUEST_SIZE =1024*1024*50;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //判断上传的文件为多媒体类型的文件

        if(!ServletFileUpload.isMultipartContent(request)){
        PrintWriter writer = response.getWriter();
        writer.println("Error:表单必须包含 enctype=multipart/form-data");
        writer.flush();
        return;
    }
        DiskFileItemFactory diskFileItemFactory =new DiskFileItemFactory();
        diskFileItemFactory.setSizeThreshold(MEMORY_THRESHOLD);
        diskFileItemFactory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);

        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        upload.setHeaderEncoding("utf-8");

        String upLoadPath =getServletContext()+File.separator+UPLOAD_DIRECTORY;
        File uploadDir = new File(upLoadPath);
        if (!uploadDir.exists()){
            uploadDir.mkdir();
        }
        try {
            @SuppressWarnings("unChecked")
            List<FileItem> formItems =upload.parseRequest(request);
            if(formItems != null && formItems.size()>0){
                for (FileItem item: formItems){
                    if (!item.isFormField()){
                        String username = new File(item.getName()).getName();
                        String filename = upLoadPath+File.separator+username;
                        File storeFile = new File(filename);
                        System.out.println(filename);
                        item.write(storeFile);
                        request.setAttribute("message","文件上传成功！");

                    }
                }
            }
        }catch (Exception e){
            request.setAttribute("message",
                    "错误信息: " + e.getMessage());
        }
//        getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
