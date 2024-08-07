package service;

import Dao.To_Json;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class jsonService implements To_Json {
    @Override
    public JSONObject setJson(String name, String address, String id){
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("date", "2016-05-02");
        jsonObj.put("name", name);
        jsonObj.put("province", "上海");
        jsonObj.put("city", "普陀区");
        jsonObj.put("address",address);
        jsonObj.put("zip", 200333);
        jsonObj.put("id",id);
        return jsonObj;
    }
    @Override
    public JSONObject settingJson(List<String> array_settingText, String[] column){
        //定义json对象
        JSONObject jsonObj = new JSONObject();
        //获取列表的数据
        for (int i = 0;i<array_settingText.size();i++){
            //获取到的数据添加进json
            jsonObj.put(column[i], array_settingText.get(i));
        }
        return jsonObj;
    }
    @Override
    public void arrayList(ResultSet selectData, JSONArray array) throws SQLException {
        //查询setting表的数据
        JSONObject set = null;
        String[] column={"setting_id","set_key","set_value","set_remark","state","set_code","tenant_id","create_time","set_type","set_version"};
        List<String> array_settingText = new ArrayList<String>();
        //获取每一行数据
        while (selectData.next()) {
            for (String s : column) {
                //获取每一列数据
                String columns_text = selectData.getString(s);
                //将每列数据添加进列表
                array_settingText.add(columns_text);
            }
            // 将列表和数组变成json格式
            set = settingJson(array_settingText,column);
            //将json数据添加进array列表
            array.put(set);
            //清除当前的列表数据
            array_settingText.clear();
        }
    }
}
