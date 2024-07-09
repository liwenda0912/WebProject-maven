package entity;

public class User {
    private String username;
    private String passwd;
    public String getUsername() {
        return username;
    }

    public User(String username , String passwd) {
        super();
        this.passwd=passwd;
        this.username = username;
    }
    public void setUsername(String username) {
        this.username = username;
    }


    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    @Override
    public String toString() {
        return "Tb_population [name=" + username + ", passwd=" + passwd + "]";
    }


    public User() {
        super();
        // TODO Auto-generated constructor stub
    }
}

