import entity.User;
import org.apache.ibatis.session.RowBounds;
import service.sqlService;

import java.io.IOException;
import java.util.List;

public class test {

    /**
     * 查询
     * @throws IOException
     */
     public static void main(String[] args) throws IOException {
         sqlService sqlService = new sqlService();
         RowBounds rowbounds = new RowBounds(0,5);
         System.out.print(sqlService.findAll(rowbounds));
         List<User> D = sqlService.findAll(rowbounds);
         System.out.print(D.size());
         for (int i=0;i< D.size();i++){
             System.out.print(D.get(i));
         }
     }

}
