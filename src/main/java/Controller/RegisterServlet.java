package Controller;

import Utils.jsonTransform;
import entity.RegisterEnum;
import service.sqlService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        RegisterEnum code;
        jsonTransform jsonTransform = new jsonTransform();
        Map<String, String[]> params = request.getParameterMap();
        System.out.print(params.get("ruleForm[user_name]")[0]);
        String UserName_register = params.get("ruleForm[user_name]")[0];
        String Passwd = params.get("ruleForm[register_passwd]")[0];
        //单独获取数据库名称
        response.setContentType("application/json;charset=UTF-8");
        String dbname = request.getParameter("dbname");
        sqlService sql =new sqlService();
        try {
            if(UserName_register.isEmpty()){
                code =  RegisterEnum.USERNAME_UNDEFINED;
                String message = jsonTransform.jsonTranForm(code.getMsg(), code.getCode());
                response.getWriter().write(message);
            }else {
                    if (Passwd.isEmpty()) {
                        code =  RegisterEnum.PASSWORD_UNDEFINED;
                        String message = jsonTransform.jsonTranForm(code.getMsg(), code.getCode());
                        response.getWriter().write(message);
                    } else {
                        // 设置session中的值
                        int code_1 = sql.addTbp(UserName_register,Passwd);
                        if (code_1==0){
                            code =  RegisterEnum.REGISTER_SUCCESS;
                            String message = jsonTransform.jsonTranForm(code.getMsg(), code.getCode());
                            response.getWriter().write(message);

                        }else{
                            code =  RegisterEnum.SERVER_ERROR;
                            String message = jsonTransform.jsonTranForm(code.getMsg(), code.getCode());
                            response.getWriter().write(message);
                        }
                    }
            }
        } catch (IOException e) {
            code =  RegisterEnum.SERVER_ERROR;
            String message = jsonTransform.jsonTranForm(code.getMsg(), code.getCode());
            response.getWriter().write(message);
            throw new RuntimeException(e);
        }
    }
}
