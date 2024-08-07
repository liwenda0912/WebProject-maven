package servlet;

import org.json.JSONArray;
import org.json.JSONObject;
import service.jsonService;
import service.sqlService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DataServlet", value = "/DataServlet")
public class DataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用sql服务
        sqlService sqlService =new sqlService();
        //调用数据处理服务
        jsonService jsonService = new jsonService();
        //获取请求数据
        String dbname = request.getParameter("dbname");
        Integer num = Integer.valueOf(request.getParameter("pageNum"));
        Integer pageNum = Integer.valueOf(request.getParameter("pageSize"));
        //创建json列表
        JSONArray  array = new JSONArray();
        try {
            //查询数据
            ResultSet selectData = sqlService.getSelect(dbname,num,pageNum);
            // 统计数量（没去重）
            int total_num = sqlService.getCount(dbname);
            if(dbname.equals("setting")){
                response.setCharacterEncoding("UTF-8");
                //处理数据变成arraylist格式
                jsonService.arrayList(selectData,array);
                array.put(total_num);
            }else {
                //用户表的数据
                JSONObject set = null;
                while (selectData.next()) {
                    String columns_list = selectData.getString("username");
                    String address_lists =selectData.getString("address");
                    String id = selectData.getString("id");
                    response.setCharacterEncoding("UTF-8");
                    //将获取到的数据变成json格式
                    set = jsonService.setJson(columns_list,address_lists,id);
                    //将json数据添加进json array里面
                    array.put(set);
                }
                array.put(total_num);
            }
            // 响应get请求返回json array列表
            response.getWriter().write(array.toString());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //调用sql服务
            sqlService sqlService =new sqlService();
            //设置响应的数据格式伟utf-8
            response.setContentType("application/json;charset=UTF-8");//定义servlet返回信息的格式
            // 获取所有form-data格式的请求数据并转变成map格式
            Map<String, String[]> params = request.getParameterMap();
            //单独获取数据库名称
            String dbname = request.getParameter("dbname");
            //调用sql服务的更新方法
            int selectData = sqlService.updateTbp(dbname,params);
            //校验服务返回的结果
            if (selectData==0){
                //成功
                String message = "{\"state\":\"true\",\"code\":\"200\",\"message\":\"修改成功！\"}";
                response.getWriter().write(message);
            }else {
                //失败
                String message = "{\"state\":\"true\",\"code\":\"404\",\"message\":\"服务器异常！\"}";
                response.getWriter().write(message);
            }
        }catch (Exception e){
            throw new Error(e);
        }
    }

}
