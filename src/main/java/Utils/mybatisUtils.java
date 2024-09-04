package Utils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class mybatisUtils {
    public SqlSession MybatisUtils() throws IOException {
        InputStream resourceAsStream = null;
        //加载mybatis的配置文件
        InputStream inputStream = Resources.getResourceAsStream("sqlMapConfig.xml");
        //通过sqlSession工厂创建者build出一个数据库会话工程
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //打开一个数据库会话
//        SqlSession session = sqlSessionFactory.openSession();
//        try {
//            resourceAsStream = Resources.getResourceAsStream("sqlMapConfig.xml");
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//        //获得session工厂对象
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
//        //获得session会话对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        return sqlSession;
    }
    //打印数据



    //释放资源
}
