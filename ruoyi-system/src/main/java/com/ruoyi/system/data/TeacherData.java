package com.ruoyi.system.data;

import java.util.ArrayList;
import java.util.List;

public class TeacherData {
    private List<String> majorNames;
    private List<Integer> totalMaxs;
    private List<Integer> totalMins;

    public List<String> getMajorNames() {
        return majorNames;
    }

    public void setMajorNames(List<String> majorNames) {
        this.majorNames = majorNames;
    }

    public List<Integer> getTotalMaxs() {
        return totalMaxs;
    }

    public void setTotalMaxs(List<Integer> totalMaxs) {
        this.totalMaxs = totalMaxs;
    }

    public List<Integer> getTotalMins() {
        return totalMins;
    }

    public void setTotalMins(List<Integer> totalMins) {
        this.totalMins = totalMins;
    }

    @Override
    public String toString() {
        return "TeacherData{" +
                "majorNames=" + majorNames +
                ", totalMaxs=" + totalMaxs +
                ", totalMins=" + totalMins +
                '}';
    }
}
