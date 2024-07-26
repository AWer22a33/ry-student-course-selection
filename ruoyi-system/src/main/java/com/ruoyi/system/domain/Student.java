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
 * 学生信息对象 student
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    private Long stuId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuName;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long stuAge;

    /** 性别 */
    @Excel(name = "性别")
    private Integer stuSex;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date stuBirthday;

    /** 介绍 */
    @Excel(name = "介绍")
    private String introducition;

    /** 爱好 */
    @Excel(name = "爱好")
    private String hobby;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deleteTime;

    /** 删除标记 */
    private Integer delFlag;

    private List<String> hobbies= new ArrayList<>();

    public List<String> getHobbies() {
        return hobbies;
    }

    public void setHobbies(List<String> hobbies) {
        this.hobbies = hobbies;
    }

    public void setStuId(Long stuId)
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }

    public void setStuName(String stuName) 
    {
        this.stuName = stuName;
    }

    public String getStuName() 
    {
        return stuName;
    }

    public void setStuAge(Long stuAge) 
    {
        this.stuAge = stuAge;
    }

    public Long getStuAge() 
    {
        return stuAge;
    }

    public void setStuSex(Integer stuSex) 
    {
        this.stuSex = stuSex;
    }

    public Integer getStuSex() 
    {
        return stuSex;
    }

    public void setStuBirthday(Date stuBirthday) 
    {
        this.stuBirthday = stuBirthday;
    }

    public Date getStuBirthday() 
    {
        return stuBirthday;
    }

    public void setIntroducition(String introducition) 
    {
        this.introducition = introducition;
    }

    public String getIntroducition() 
    {
        return introducition;
    }

    public void setHobby(String hobby) 
    {
        this.hobby = hobby;
    }

    public String getHobby() 
    {
        return hobby;
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
            .append("stuId", getStuId())
            .append("stuName", getStuName())
            .append("stuAge", getStuAge())
            .append("stuSex", getStuSex())
            .append("stuBirthday", getStuBirthday())
            .append("introducition", getIntroducition())
            .append("hobby", getHobby())
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
