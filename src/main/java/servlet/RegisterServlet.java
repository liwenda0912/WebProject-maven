package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserName_register = request.getParameter("username");
        String Passwd = request.getParameter("passwd");
        if(UserName_register.isEmpty()){
            String data= "{\"notice\":\"0\",\"message\":\"账号为空\"}";
            response.setContentType("application/json");
            response.getWriter().write(data);
        }else {
            if (Objects.equals(UserName_register, "1")) {
                if (!Objects.equals(Passwd, "12345678")) {
                    String data= "{\"notice\":\"2\",\"name\":12}";
                    response.setContentType("application/json");
                    response.getWriter().write(data);
                } else {
                    // 设置session中的值
                    String data= "{\"notice\":\"1\",\"name\":12}";
                    response.setContentType("application/json");
                    response.getWriter().write(data);

                }
            } else {
                String data= "{\"notice\":\"2\"}";
                response.setContentType("application/json");
                response.getWriter().write(data);
            }
        }
    }
}
