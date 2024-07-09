package entity;

public enum Enum {
    //
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//
        SUCCESS(0, "操作成功"),
        ERROR(1, "操作失败"),
        ERROR_1(2,"账号密码错误"),
        SERVER_ERROR(500, "服务器异常"),
        MAIL_SEND_SUCCESS(10003, "邮件发送成功"),
        NEED_LOGIN(20001, "登录失效"),
        USERNAME_OR_PASSWORD_EMPTY(20002, "用户名或密码不能为空"),
        USERNAME_OR_PASSWORD_WRONG(20003, "用户名或密码错误");

        private Integer code;
        private String msg;

        Enum(Integer code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public int getCode() {
            return this.code;
        }

        public void setCode(Integer code) {
            this.code = code;
        }

        public String getMsg() {
            return this.msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }
    }

