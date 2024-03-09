package servlet;
import uilts.sqlConnect;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;
//import static java.lang.System.out;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("key",0);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserName = request.getParameter("username");
        String Passwd = request.getParameter("passwd");
        sqlConnect sql =new sqlConnect();//连接数据库，查询所有用户信息
        String message;
        String node =null;
        response.setContentType("application/json;charset=UTF-8");//定义servlet返回信息的格式
        if(UserName.isEmpty()){
            message= "{\"notice\":\"0\",\"message_register\":\"账号为空\"}";//无实质应用
            response.getWriter().write(message);
        }else if(Passwd.isEmpty()){
                message = "{\"notice\":\"0\",\"message_register\":\"密码为空\"}";//无实质应用
                response.getWriter().write(message);
        }else {
            try {
                ResultSet data =  sql.getSelect();//调用sqlConnect的getSelect方法
                while (data.next()){
                    if (Objects.equals(UserName, data.getString("username"))) {
                        if (Objects.equals(Passwd, data.getString("password"))) {
                            // 设置session中的值
                            message= "{\"notice\":\"1\",\"message_login\":\"登录成功\"}";
                            response.getWriter().write(message);//写入信息进入响应报文
                            node =String.valueOf('1');
                            break;
                        }else{
                            node = String.valueOf('2');
                        }
                    }else{
                        node = String.valueOf('0');
                    }
                }
                data.close();
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
         }
        if(Objects.equals(node, "2")){
            message= "{\"notice\":\"2\",\"message_login\":\"密码错误\"}";
            response.getWriter().write(message);
        } else if (Objects.equals(node, "0")) {
            message= "{\"notice\":\"2\",\"message_login\":\"账号错误\"}";
            response.getWriter().write(message);
        }
    }
}

