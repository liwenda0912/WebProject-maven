package common;


import org.apache.poi.ss.formula.functions.T;

public class commonResult {
    private Integer code;
    private T data;
    private String msg;

    public commonResult(Integer code, T data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }

    public commonResult(Integer code ,String msg) {
        this.code = code;
        this.msg = msg;
    }

    protected void CommonResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
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
    @Override
    public String toString() {
        return "{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
    /**
     * 成功返回结果
     *
     * @param code  状态
     * @param data 获取的数据
     */
    public static commonResult success(Integer code ,T data){
        return new commonResult(code,data,null);
    }
    /**
     * 成功返回结果
     *
     * @param data    获取的数据
     * @param msg     提示信息
     */
    public static commonResult success(T data,String msg){
        return new commonResult(1,data,msg);
    }
    /**
     * 成功返回结果
     *
     * @param msg     提示信息
     */
    public static commonResult success(String msg){
        return new commonResult(1,msg);
    }

}
