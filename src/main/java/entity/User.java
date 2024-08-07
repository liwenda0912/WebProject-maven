package entity;

public class User {
    private String username;
    private String password;
    public String getUsername() {
        return username;
    }

    public User(String username , String passwd) {
        super();
        this.password=passwd;
        this.username = username;
    }
    public void setUsername(String username) {
        this.username = username;
    }


    public String getPasswd() {
        return password;
    }

    public void setPasswd(String passwd) {
        this.password = passwd;
    }

    @Override
    public String toString() {
        return "Tb_population [name=" + username + ", passwd=" + password + "]";
    }


    public User() {
        super();
        // TODO Auto-generated constructor stub
    }
}

