package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生课程信息对象 sc
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public class Sc extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生课程编号 */
    private Long scId;

    /** 学号 */
    @Excel(name = "学号")
    private Long stuId;

    @Excel(name = "学生姓名")
    private String stuName;

    /** 课程编号 */
    @Excel(name = "课程编号")
    private Long cId;

    @Excel(name = "课程名称")
    private String cName;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deleteTime;

    /** 删除标记 */
    private Integer delFlag;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public void setScId(Long scId)
    {
        this.scId = scId;
    }

    public Long getScId() 
    {
        return scId;
    }

    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }

    public void setcId(Long cId) 
    {
        this.cId = cId;
    }

    public Long getcId() 
    {
        return cId;
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
            .append("scId", getScId())
            .append("stuId", getStuId())
            .append("cId", getcId())
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
