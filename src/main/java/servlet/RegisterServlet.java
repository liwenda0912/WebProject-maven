package servlet;

import Utils.sqlConnect;
import service.sqlService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserName_register = request.getParameter("username");
        String Passwd = request.getParameter("passwd");
        sqlService sql =new sqlService();
        try {
            if(UserName_register.isEmpty()){
                String data= "{\"notice\":\"0\",\"message_register\":\"注册账号为空\"}";
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(data);
            }else {
                    if (Passwd.isEmpty()) {
                        String data= "{\"notice\":\"3\",\"message_register\":\"注册账号密码为空！\"}";
                        response.setContentType("application/json;charset=UTF-8");
                        response.getWriter().write(data);
                    } else {
                        // 设置session中的值
                        int code = sql.addTbp(UserName_register,Passwd);
                        if (code==0){
                            String data= "{\"notice\":\"1\",\"message_register\":\"注册成功\"}";
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().write(data);
                        }else{
                            String data= "{\"notice\":\"3\",\"message_register\":\"服务异常\"}";
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().write(data);
                        }

                    }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
