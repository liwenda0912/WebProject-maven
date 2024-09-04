package entity;

public enum RegisterEnum {
    ERROR(2,"账号密码错误"),
    REGISTER_SUCCESS(1,"注册成功"),
    USERNAME_UNDEFINED(0,"创建账号为空"),
    SERVER_ERROR(500, "服务器异常"),
    PASSWORD_UNDEFINED(3, "注册密码为空");
    private Integer code;
    private String msg;

    RegisterEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
