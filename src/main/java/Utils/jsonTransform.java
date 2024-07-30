package Utils;

import org.apache.poi.ss.usermodel.Row;
import org.json.JSONObject;

import java.util.List;

public class jsonTransform {
    public String jsonTranForm(String message, int code) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", message);
        jsonObject.put("code", code);
        return jsonObject.toString();
    }

    public JSONObject putJson(List<String> array_text, Row array_name) {
        int columns = array_name.getLastCellNum();
        JSONObject jsonObj = new JSONObject();
        for (int i = 0 ;i<array_text.size();i++){
//            System.out.print(array_name.getCell(i+1)+"\n");
            jsonObj.put(String.valueOf(array_name.getCell(i+1)), array_text.get(i));
        }
        return jsonObj;
    }
}