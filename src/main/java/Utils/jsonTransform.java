package Utils;

import org.json.JSONObject;

public class jsonTransform {
    public String jsonTranForm(String message, int code){
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("message",message);
        jsonObject.put("code",code);
        return jsonObject.toString();
    }
}
