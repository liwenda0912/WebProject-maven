package Utils;

import entity.User;

import java.util.Map;

public class mapUtils {

    public static User test(Map<String, String[]> params) {
        User user = new User();
        System.out.print(params.get("username")[0]);
        user.setUsername(params.get("username")[0]);
        user.setId(Integer.parseInt(params.get("id")[0]));
        user.setAddress(params.get("address")[0]);
        user.setCity(params.get("city")[0]);
        user.setAlias("");
        user.setZip(Integer.parseInt(params.get("zip")[0]));
        user.setPhone(params.get("phone")[0]);
        user.setProvince(params.get("province")[0]);
        return user;
    }
}
