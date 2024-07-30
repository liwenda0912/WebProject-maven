package entity;

public class CoordinateVO {
    /**
     * excel中的横坐标
     */
    private Integer coordinateX;
    /**
     * excel中的纵坐标
     */
    private Integer coordinateY;
    /**
     * excel中的每个单元格的数据值
     */
    private String dataValue;

    public void setCoordinateX(int coordinateX) {
        this.coordinateX = coordinateX;
    }

    public int getCoordinateX() {
        return coordinateX;
    }

    public void setCoordinateY(int coordinateY) {
        this.coordinateY = coordinateY;
    }

    public int getCoordinateY() {
        return coordinateY;
    }

    public void setDataValue(String dataValue) {
        this.dataValue = dataValue;
    }

    public String getDataValue() {
        return dataValue;
    }
}
