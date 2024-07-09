package servlet;

import Utils.sqlConnect;

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
        sqlConnect sql =new sqlConnect();
        try {
            sql.getCon();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
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
                        try {
                            sql.getCreate(UserName_register,Passwd);
                            String data= "{\"notice\":\"1\",\"message_register\":\"注册成功\"}";
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().write(data);
                        } catch (ClassNotFoundException e) {
                            throw new RuntimeException(e);
                        }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
