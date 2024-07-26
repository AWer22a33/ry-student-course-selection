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
 * 教师信息对象 teacher
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public class Teacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教师编号 */
    private Long tId;

    /** 教师名字 */
    @Excel(name = "教师名字")
    private String tName;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long tAge;

    /** 性别 */
    @Excel(name = "性别")
    private Integer tSex;

    /** 入职时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date hireDate;

    /** 教师职称 */
    @Excel(name = "教师职称")
    private String tTitle;

    /** 工作经历 */
    @Excel(name = "工作经历")
    private String workExperience;

    /** 党员 */
    @Excel(name = "党员")
    private Integer party;

    /** 特长 */
    @Excel(name = "特长")
    private String speciality;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deleteTime;

    /** 删除标记 */
    private Integer delFlag;

    private List<String> specialities= new ArrayList<>();

    public List<String> getSpecialities() {
        return specialities;
    }

    public void setSpecialities(List<String> specialities) {
        this.specialities = specialities;
    }

    public void settId(Long tId)
    {
        this.tId = tId;
    }

    public Long gettId() 
    {
        return tId;
    }

    public void settName(String tName) 
    {
        this.tName = tName;
    }

    public String gettName() 
    {
        return tName;
    }

    public void settAge(Long tAge) 
    {
        this.tAge = tAge;
    }

    public Long gettAge() 
    {
        return tAge;
    }

    public void settSex(Integer tSex) 
    {
        this.tSex = tSex;
    }

    public Integer gettSex() 
    {
        return tSex;
    }

    public void setHireDate(Date hireDate) 
    {
        this.hireDate = hireDate;
    }

    public Date getHireDate() 
    {
        return hireDate;
    }

    public void settTitle(String tTitle) 
    {
        this.tTitle = tTitle;
    }

    public String gettTitle() 
    {
        return tTitle;
    }

    public void setWorkExperience(String workExperience) 
    {
        this.workExperience = workExperience;
    }

    public String getWorkExperience() 
    {
        return workExperience;
    }

    public void setParty(Integer party) 
    {
        this.party = party;
    }

    public Integer getParty() 
    {
        return party;
    }

    public void setSpeciality(String speciality) 
    {
        this.speciality = speciality;
    }

    public String getSpeciality() 
    {
        return speciality;
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
            .append("tId", gettId())
            .append("tName", gettName())
            .append("tAge", gettAge())
            .append("tSex", gettSex())
            .append("hireDate", getHireDate())
            .append("tTitle", gettTitle())
            .append("workExperience", getWorkExperience())
            .append("party", getParty())
            .append("speciality", getSpeciality())
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
