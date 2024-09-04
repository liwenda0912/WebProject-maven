package Dao;

import entity.Setting;
import org.apache.ibatis.session.RowBounds;

import java.io.IOException;
import java.util.List;

public interface To_setting {
    List<Setting> findSettingAll(RowBounds rowbounds) throws IOException;

}
