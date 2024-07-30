import org.json.JSONArray;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import static jdk.nashorn.internal.objects.Global.undefined;
//

import org.json.JSONObject;
public class Main {
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
////        sqlConnect sql = new sqlConnect();
//////        sql.getCon();
//////      sql.getCreate("sdad","113456");
////        String dbname = "testrunningdata.users";
////        ResultSet data =sql.getSelect(dbname);
//
//
//    }

public static void main(String[] args) {

            JSONObject jsonObj = new JSONObject();
            jsonObj.put("key", "value");
            jsonObj.put("key1", "value");

    // 设置key-value
            System.out.println(jsonObj.toString());
        }
}
