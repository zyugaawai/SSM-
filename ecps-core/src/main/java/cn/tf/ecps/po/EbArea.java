package cn.tf.ecps.po;

public class EbArea {
    private Long areaId;

    private Long parentId;

    private String areaName;

    private Short areaLevel;

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public Short getAreaLevel() {
        return areaLevel;
    }

    public void setAreaLevel(Short areaLevel) {
        this.areaLevel = areaLevel;
    }
}