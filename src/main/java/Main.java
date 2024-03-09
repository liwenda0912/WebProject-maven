import uilts.sqlConnect;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException {
        sqlConnect sql = new sqlConnect();
//        sql.getCon();
//        sql.getCreate("sdad","113456");
        sql.getSelect();
    }
}