package com.ruoyi.system.data;

import com.ruoyi.system.vo.CourseCountVo;

import java.util.List;

public class CourseData {
    private List<String> MajorNames;
    private List<CourseCountVo> CourseCounts;

    public List<String> getMajorNames() {
        return MajorNames;
    }

    public void setMajorNames(List<String> majorNames) {
        MajorNames = majorNames;
    }

    public List<CourseCountVo> getCourseCounts() {
        return CourseCounts;
    }

    public void setCourseCounts(List<CourseCountVo> courseCounts) {
        CourseCounts = courseCounts;
    }

    @Override
    public String toString() {
        return "CourseData{" +
                "MajorNames=" + MajorNames +
                ", CourseCounts=" + CourseCounts +
                '}';
    }
}
