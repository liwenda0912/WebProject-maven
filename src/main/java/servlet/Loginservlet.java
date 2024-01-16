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
        if (Objects.equals(UserName, "1")) {
            if (!Objects.equals(Passwd, "1")) {
                response.setCharacterEncoding("gb2312");
                PrintWriter out = response.getWriter();
                out.print("<script>alert('您输入的密码错误，请重新输入...')</script>");
                out.print("<script>window.location='index.jsp'</script>");
                out.flush();
                out.close();
            } else {
                response.setCharacterEncoding("gb2312");
                PrintWriter out = response.getWriter();
                out.print("<script>alert('123')</script>");
                out.print("<script>window.location='index.jsp'</script>");
//                HttpSession session = request.getSession();
                // 设置session中的值
                request.setAttribute("username",UserName);
                request.setAttribute("key",1);
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        } else {
            response.setCharacterEncoding("gb2312");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('您输入的账号错误，请重新输入...')</script>");
            out.print("<script>window.location='index.jsp'</script>");
            out.flush();
            out.close();
        }
    }
}
