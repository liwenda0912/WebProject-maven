////import entity.User;
////import org.apache.ibatis.session.RowBounds;
////import service.sqlService;
////
////import java.io.IOException;
////import java.util.List;
////
////public class test {
////
////    /**
////     * 查询
////     * @throws IOException
////     */
////     public static void main(String[] args) throws IOException {
////         sqlService sqlService = new sqlService();
////         RowBounds rowbounds = new RowBounds(0,5);
////         System.out.print(sqlService.findAll(rowbounds));
////         List<User> D = sqlService.findAll(rowbounds);
////         System.out.print(D.size());
////         for (int i=0;i< D.size();i++){
////             System.out.print(D.get(i));
////         }
////     }
////
////}
//
//
//import org.json.JSONObject;
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
//
//public class test {
//
//    public static JSONObject getLocationInfo(String ip) throws IOException {
//        String url = ip;
//
//        URL obj = new URL(url);
//        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//        con.setRequestMethod("GET");
//
//        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//        String inputLine;
//        StringBuffer response = new StringBuffer();
//
//        while ((inputLine = in.readLine()) != null) {
//            response.append(inputLine);
//        }
//        in.close();
//
//        return new JSONObject(response.toString());
//    }
//
//    public static void main(String[] args) throws IOException {
//        String ip = "192.168.50.90"; // 用户的IP地址
//        JSONObject locationInfo = getLocationInfo(ip);
//        System.out.println(locationInfo.toString());
//    }
//}


