package com.ruoyi.system.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 教室课程信息对象 rc
 *
 * @author ruoyi
 * @date 2024-07-18
 */
public class Rc extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教室课程编号 */
    private Long rcId;

    /** 教室号 */
    @Excel(name = "教室号")
    private Long rId;

    @Excel(name = "教室名称")
    private String rName;

    /** 课程编号 */
    @Excel(name = "课程编号")
    private Long cId;

    @Excel(name = "课程名称")
    private String cName;

    /** 星期 */
    @Excel(name = "星期")
    private String weekday;

    /** 上课节次 */
    @Excel(name = "上课节次")
    private String lessonNumber;

    private List<String> lessonNumbers=new ArrayList<>();

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deleteTime;

    /** 删除标记 */
    private Integer delFlag;

    public List<String> getLessonNumbers() {
        return lessonNumbers;
    }

    public void setLessonNumbers(List<String> lessonNumbers) {
        this.lessonNumbers = lessonNumbers;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public void setRcId(Long rcId)
    {
        this.rcId = rcId;
    }

    public Long getRcId()
    {
        return rcId;
    }

    public void setrId(Long rId)
    {
        this.rId = rId;
    }

    public Long getrId()
    {
        return rId;
    }

    public void setcId(Long cId)
    {
        this.cId = cId;
    }

    public Long getcId()
    {
        return cId;
    }

    public void setWeekday(String weekday)
    {
        this.weekday = weekday;
    }

    public String getWeekday()
    {
        return weekday;
    }

    public void setLessonNumber(String lessonNumber)
    {
        this.lessonNumber = lessonNumber;
    }

    public String getLessonNumber()
    {
        return lessonNumber;
    }

    public void setDeleteBy(String deleteBy)
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy()
    {
        return deleteBy;
    }

    public void setDeleteTime(Date deleteTime)
    {
        this.deleteTime = deleteTime;
    }

    public Date getDeleteTime()
    {
        return deleteTime;
    }

    public void setDelFlag(Integer delFlag)
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("rcId", getRcId())
                .append("rId", getrId())
                .append("cId", getcId())
                .append("weekday", getWeekday())
                .append("lessonNumber", getLessonNumber())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("deleteBy", getDeleteBy())
                .append("deleteTime", getDeleteTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
