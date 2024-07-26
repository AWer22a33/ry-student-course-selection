package com.ruoyi.system.vo;

import java.io.Serializable;

public class CourseCountVo implements Serializable {

    private Double value;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "CourseCountVo{" +
                "value=" + value +
                ", name='" + name + '\'' +
                '}';
    }
}
