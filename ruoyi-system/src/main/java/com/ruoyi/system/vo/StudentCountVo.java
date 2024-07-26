package com.ruoyi.system.vo;

import java.io.Serializable;

public class StudentCountVo implements Serializable {
    private Integer studentCount;
    private String majorName;

    public StudentCountVo() {
    }

    public StudentCountVo(Integer studentCount, String majorName) {
        this.studentCount = studentCount;
        this.majorName = majorName;
    }

    public Integer getStudentCount() {
        return studentCount;
    }

    public void setStudentCount(Integer studentCount) {
        this.studentCount = studentCount;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    @Override
    public String toString() {
        return "StudentCountVo{" +
                "studentCount=" + studentCount +
                ", majorName='" + majorName + '\'' +
                '}';
    }
}
