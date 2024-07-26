package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程信息对象 course
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public class Course extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课程编号 */
    private Long cId;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String cName;

    /** 专业号 */
    @Excel(name = "专业号")
    private Long majorId;

    @Excel(name = "专业名称")
    private String majorName;

    /** 学期编号 */
    @Excel(name = "学期编号")
    private Long termId;

/*    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "学期开始", width = 30, dateFormat = "yyyy-MM-dd")
    private Date termBegin;

    *//** 学期结束 *//*
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "学期结束", width = 30, dateFormat = "yyyy-MM-dd")
    private Date termEnd;*/

    private String termName;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deleteTime;

    /** 删除标记 */
    private Integer delFlag;

    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    /*public Date getTermBegin() {
        return termBegin;
    }

    public void setTermBegin(Date termBegin) {
        this.termBegin = termBegin;
    }

    public Date getTermEnd() {
        return termEnd;
    }

    public void setTermEnd(Date termEnd) {
        this.termEnd = termEnd;
    }*/

    public void setcId(Long cId)
    {
        this.cId = cId;
    }

    public Long getcId() 
    {
        return cId;
    }

    public void setcName(String cName) 
    {
        this.cName = cName;
    }

    public String getcName() 
    {
        return cName;
    }

    public void setMajorId(Long majorId) 
    {
        this.majorId = majorId;
    }

    public Long getMajorId() 
    {
        return majorId;
    }

    public void setTermId(Long termId) 
    {
        this.termId = termId;
    }

    public Long getTermId() 
    {
        return termId;
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
            .append("cId", getcId())
            .append("cName", getcName())
            .append("majorId", getMajorId())
            .append("termId", getTermId())
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
