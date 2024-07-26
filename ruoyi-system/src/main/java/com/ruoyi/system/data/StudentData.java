package com.ruoyi.system.data;

import java.util.ArrayList;
import java.util.List;

public class StudentData {
    private List<Integer> studentCounts;
    private List<String> majorNames;

    public List<Integer> getStudentCounts() {
        return studentCounts;
    }

    public void setStudentCounts(List<Integer> studentCounts) {
        this.studentCounts = studentCounts;
    }

    public List<String> getMajorNames() {
        return majorNames;
    }

    public void setMajorNames(List<String> majorNames) {
        this.majorNames = majorNames;
    }
}
