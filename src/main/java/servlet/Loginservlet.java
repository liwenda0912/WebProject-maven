package servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
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
//          request.setAttribute("keys-test",UserName);
//          RequestDispatcher dispatcher_test = getServletContext().getRequestDispatcher("/Result.jsp");
//          dispatcher_test.forward(request, response) ;
          if(UserName.isEmpty()){
              RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login_input.jsp");
              dispatcher.forward(request, response);
          }else {
              if (Objects.equals(UserName, "1")) {
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
