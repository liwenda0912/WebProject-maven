package service;

import common.To_Json;
import entity.Setting;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class jsonService implements To_Json {
    @Override
    public JSONObject setJson(String name, String address, int id, String phone, String passwd, String alias, String province, String city){
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("date", "2016-05-02");
        jsonObj.put("username", name);
        jsonObj.put("province", province);
        jsonObj.put("city", city);
        jsonObj.put("address",address);
        jsonObj.put("zip", 200333);
        jsonObj.put("id",id);
        jsonObj.put("phone",phone);
        return jsonObj;
    }

    @Override
    public void arrayList(List<Setting> selectData, JSONArray array) throws SQLException {
        JSONObject set = null;
        String[] column={"setting_id","set_key","set_value","set_remark","state","set_code","tenant_id","create_time","set_type","set_version"};
        List<Setting> array_settingText = new ArrayList<>();
        //获取每一行数据
        for (int i =0;i<selectData.size();i++){
            array_settingText.add(selectData.get(i));
            set = settingJson(array_settingText,column);
            array.put(set);
        }
    }

    @Override
    public  JSONObject settingJson(List<Setting> array_settingText, String[] column){
        //定义json对象
        JSONObject jsonObj = new JSONObject();
        //获取列表的数据
        for (int i = 0;i<array_settingText.size();i++){
            //获取到的数据添加进json
            jsonObj.put(column[0], array_settingText.get(i).getSetting_id());
            jsonObj.put(column[1], array_settingText.get(i).getSet_key());
            jsonObj.put(column[2], array_settingText.get(i).getSet_value());
            jsonObj.put(column[3], array_settingText.get(i).getSet_remark());
            jsonObj.put(column[4], array_settingText.get(i).getState());
            jsonObj.put(column[5], array_settingText.get(i).getSet_code());
            jsonObj.put(column[6], array_settingText.get(i).getTenant_id());
            jsonObj.put(column[7], array_settingText.get(i).getCreate_time());
            jsonObj.put(column[8], array_settingText.get(i).getSet_type());
            jsonObj.put(column[9], array_settingText.get(i).getSet_version());
        }
        return jsonObj;
    }
//    @Override
//    public void arrayList(ResultSet selectData, JSONArray array) throws SQLException {
//        //查询setting表的数据
//        JSONObject set = null;
//        String[] column={"setting_id","set_key","set_value","set_remark","state","set_code","tenant_id","create_time","set_type","set_version"};
//        List<String> array_settingText = new ArrayList<String>();
//        //获取每一行数据
////        for (int i=0;i< selectData.size();i++){
////            array_settingText.add();
////            array_settingText.add(selectData.get(i).getSetting_id(),selectData.get(i).getSet_key(),selectData.get(i).getSet_value(),selectData.get(i).getSet_remark(),selectData.get(i).getState(),selectData.get(i).getSet_code(),selectData.get(i).getTenant_id(),selectData.get(i).getCreate_time(),selectData.get(i).getSet_type(),selectData.get(i).getSet_version());
////            set = settingJson((List<String>) selectData.get(i),column);
////            System.out.print(set);
////            array.put(set);
////            array_settingText.clear();
//
////        }
//        while (selectData.next()) {
//            for (String s : column) {
//                //获取每一列数据
//                String columns_text = selectData.getString(s);
//                //将每列数据添加进列表
//                array_settingText.add(columns_text);
//            }
//            // 将列表和数组变成json格式
//            set = settingJson(array_settingText,column);
//            //将json数据添加进array列表
//            array.put(set);
//            //清除当前的列表数据
//            array_settingText.clear();
//        }
//    }
}
