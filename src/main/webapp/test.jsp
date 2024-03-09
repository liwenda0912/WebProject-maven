package servlet;
import uilts.sqlConnect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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
sqlConnect sql =new sqlConnect();
if(UserName.isEmpty()){
String data= "{\"notice\":\"0\",\"message_register\":\"账号为空\"}";
response.setContentType("application/json;charset=UTF-8");
response.getWriter().write(data);
}else {
try {
ResultSet data =  sql.getSelect();
System.out.print(data);
while (data.next()){
if (Objects.equals(UserName, data.getString("username"))) {
if (!Objects.equals(Passwd, data.getString("password"))) {
String message= "{\"notice\":\"2\",\"message_login\":\"登录成功！\"}";
response.setContentType("application/json;charset=UTF-8");
response.getWriter().write(message);
} else {
// 设置session中的值
String message= "{\"notice\":\"1\",\"message_login\":\"密码为空！\"}";
response.setContentType("application/json;charset=UTF-8");
response.getWriter().write(message);
}
} else {
String message= "{\"notice\":\"2\",\"message_login\":\"账号不存在！\"}";
response.setContentType("application/json;charset=UTF-8");
response.getWriter().write(message);
}
}
} catch (ClassNotFoundException | SQLException e) {
throw new RuntimeException(e);
}
}

}
}
