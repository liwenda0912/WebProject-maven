package servlet;
import entity.Enum;
import service.sqlService;
import Utils.sqlConnect;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import Utils.jsonTransform;
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
        jsonTransform jsonTransform = new jsonTransform();
//        sqlConnect sql =new sqlConnect();//连接数据库，查询所有用户信息
        sqlService sqlService =new sqlService();
        String message;
        Enum code;
        String node =null;
        response.setContentType("application/json;charset=UTF-8");//定义servlet返回信息的格式
        if(UserName.isEmpty()){
            code = Enum.USERNAME_OR_PASSWORD_WRONG;
            message = jsonTransform.jsonTranForm(code.getMsg(),code.getCode());
            response.getWriter().write(message);
        }else if(Passwd.isEmpty()){
            code = Enum.USERNAME_OR_PASSWORD_EMPTY;
            message = jsonTransform.jsonTranForm(code.getMsg(),code.getCode());
            response.getWriter().write(message);
        }else {
            try {
                String dbname = "testrunningdata.users";
                ResultSet data =  sqlService.getSelectLogin(dbname);//调用sqlConnect的getSelect方法
                while (data.next()){
                    if (Objects.equals(UserName, data.getString("username"))) {
                        if (Objects.equals(Passwd, data.getString("password"))) {
                            // 设置session中的值
                            code = Enum.LOGIN_SUCCESS;
                            message = jsonTransform.jsonTranForm(code.getMsg(),code.getCode());
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
//            message= "{\"notice\":\"2\",\"message_login\":\"账号密码错误\"}";
            code = Enum.ERROR_1;
            message = jsonTransform.jsonTranForm(code.getMsg(),code.getCode());
            response.getWriter().write(message);
        } else if (Objects.equals(node, "0")) {
            code = Enum.USERNAME_UNDEFINED;
            message = jsonTransform.jsonTranForm(code.getMsg(),code.getCode());
            response.getWriter().write(message);
        }
    }
}

