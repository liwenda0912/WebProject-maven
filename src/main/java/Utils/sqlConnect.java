package Utils;
import java.sql.*;



public class sqlConnect {
    static String driver = "com.mysql.cj.jdbc.Driver";
    static String user = "root";
    static String url = "jdbc:mysql://localhost:3306/testRunningdata";
    static String DBPasswd = "123456";
    private static Connection connection;
    static{
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("加载失败");
        }
    }
    //获取Connection 连接对象
    public static Connection getConnection() {
        try {
            // TODO Auto-generated catch block
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(url, user, DBPasswd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void close(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    //测试链接
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
    public void getCon() throws ClassNotFoundException {
        Class.forName(driver);
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user,DBPasswd);
            Statement stmt = conn.createStatement();
            String sql ="CREATE TABLE IF NOT EXISTS users (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "username VARCHAR(50) NOT NULL, " +
                    "password VARCHAR(50) NOT NULL) ";
            stmt.executeUpdate(sql);
            conn.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode()+"\n");
            e.printStackTrace();
        }
    }
    public <username, passwd> void getCreate(String username ,String passwd) throws ClassNotFoundException{
        Class.forName(driver);
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection(url, user, DBPasswd);
            stmt=conn.createStatement();
            String sql ="insert into users(username,password) values ('"+username+"','"+passwd+"');";
            System.out.print(sql);
            stmt.executeUpdate(sql);
            conn.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode()+"\n");
            e.printStackTrace();
        }
    }
//    public ResultSet getSelect(String dbname) throws ClassNotFoundException {
//        Class.forName(driver);
//        Connection conn = null;
//        Statement stmt = null;
//        ResultSet data = null;
//        try {
//            conn = DriverManager.getConnection(url, user, DBPasswd);
//            stmt = conn.createStatement();
//            String sql = "select * from "+dbname+";";
//            data = stmt.executeQuery(sql);
//        } catch (SQLException e) {
//            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
//            e.printStackTrace();
//        }
//        return data;
//    }
    public <username, passwd,dbname> void getUpData(String username ,String passwd,String dbname) throws ClassNotFoundException{
        Class.forName(driver);
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection(url, user, DBPasswd);
            stmt=conn.createStatement();
            String sql ="updata "+dbname+" set password="+passwd+" where username="+username+";";
            stmt.executeUpdate(sql);
            conn.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode()+"\n");
            e.printStackTrace();
        }
    }
    public <username, passwd> void getDeleteData(String username ,String passwd,String dbname) throws ClassNotFoundException{
        Class.forName(driver);
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection(url, user, DBPasswd);
            stmt=conn.createStatement();
            String sql ="DELETE FROM "+dbname+" WHERE username="+username+";";
            stmt.executeUpdate(sql);
            conn.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode()+"\n");
            e.printStackTrace();
        }
    }
}

