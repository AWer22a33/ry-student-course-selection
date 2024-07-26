package com.ruoyi.system.vo;

import java.io.Serializable;

public class TeacherMaxMinAgeVo implements Serializable {
    private String majorName;
    private Integer totalMax;
    private Integer totalMin;

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public Integer getTotalMax() {
        return totalMax;
    }

    public void setTotalMax(Integer totalMax) {
        this.totalMax = totalMax;
    }

    public Integer getTotalMin() {
        return totalMin;
    }

    public void setTotalMin(Integer totalMin) {
        this.totalMin = totalMin;
    }

    @Override
    public String toString() {
        return "TeacherMaxMinAgeVo{" +
                "majorName='" + majorName + '\'' +
                ", totalMax=" + totalMax +
                ", totalMin=" + totalMin +
                '}';
    }
}
