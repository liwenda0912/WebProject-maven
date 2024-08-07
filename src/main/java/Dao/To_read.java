package Dao;

import org.apache.poi.ss.usermodel.Sheet;
import org.json.JSONArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface To_read {
    String UploadFileUtils(HttpServletRequest request, HttpServletResponse response) throws IOException;

    JSONArray readSheet(Sheet sheet);
}
