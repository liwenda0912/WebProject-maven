package entity;

public class Setting {
    private  Integer setting_id;
    private String set_key;
    private String set_value;
    private String set_remark;
    private Integer state;
    private String set_code;
    private Integer tenant_id;
    private Integer create_time;
    private Integer set_type;
    private Integer set_version;

    public Setting(Integer settingId, String setKey, String setValue, String setRemark, Integer state, String setCode, Integer tenantId,Integer create_time,Integer set_type,Integer set_version) {
        this.setting_id = settingId;
        this.set_key = setKey;
        this.set_value = setValue;
        this.set_remark = setRemark;
        this.state = state;
        this.set_code = setCode;
        this.tenant_id = tenantId;
        this.create_time =create_time;
        this.set_type =set_type;
        this.set_version =set_version;
    }

    public Integer getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(Integer setting_id) {
        this.setting_id = setting_id;
    }

    public String getSet_key() {
        return set_key;
    }

    public void setSet_key(String set_key) {
        this.set_key = set_key;
    }

    public String getSet_value() {
        return set_value;
    }

    public void setSet_value(String set_value) {
        this.set_value = set_value;
    }

    public Integer getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Integer create_time) {
        this.create_time = create_time;
    }

    public Integer getSet_type() {
        return set_type;
    }

    public void setSet_type(Integer set_type) {
        this.set_type = set_type;
    }

    public Integer getSet_version() {
        return set_version;
    }

    public void setSet_version(Integer set_version) {
        this.set_version = set_version;
    }

    public Integer getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(Integer tenant_id) {
        this.tenant_id = tenant_id;
    }

    public String getSet_code() {
        return set_code;
    }

    public void setSet_code(String set_code) {
        this.set_code = set_code;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getSet_remark() {
        return set_remark;
    }

    public void setSet_remark(String set_remark) {
        this.set_remark = set_remark;
    }
    @Override
    public String toString() {
        return "Setting [setting_id=" + setting_id + ", set_key=" + set_key + ",set_value="+set_value+",set_remark="+set_remark+",state="+state+",set_code="+set_code+", tenant_id=" + tenant_id + ",create_time="+create_time+",set_type="+set_type+",set_version="+set_version+"]";
    }
}
