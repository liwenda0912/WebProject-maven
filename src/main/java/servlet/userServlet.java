package servlet;

import org.json.JSONArray;
import org.json.JSONObject;
import service.sqlService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "userServlet", value = "/userServlet")
public class userServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sqlService sqlService =new sqlService();
        String dbname = request.getParameter("dbname");
        Integer num = Integer.valueOf(request.getParameter("pageNum"));
        Integer pageNum = Integer.valueOf(request.getParameter("pageSize"));
        JSONArray  array = new JSONArray();
        try {
            ResultSet selectData = sqlService.getSelect(dbname,num,pageNum);
            int total_num = sqlService.getCount(dbname);
            JSONObject set = null;
            while (selectData.next()) {
                String columns_list = selectData.getString("username");
                String address_lists =selectData.getString("address");
                response.setCharacterEncoding("UTF-8");
                set = setJson(columns_list,address_lists);
                array.put(set);
            }
            array.put(total_num);
            response.getWriter().write(array.toString());

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public JSONObject setJson(String name, String address){
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("date", "2016-05-02");
        jsonObj.put("name", name);
        jsonObj.put("province", "上海");
        jsonObj.put("city", "普陀区");
        jsonObj.put("address",address);
        jsonObj.put("zip", 200333);
        return jsonObj;
    }



}
