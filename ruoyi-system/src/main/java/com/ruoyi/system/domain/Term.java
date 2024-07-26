package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学期信息对象 term
 *
 * @author ruoyi
 * @date 2024-07-11
 */
public class Term extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学期编号 */
    private Long termId;

    /** 学期 */
    @Excel(name = "学期")
    private String termName;

    public void setTermId(Long termId)
    {
        this.termId = termId;
    }

    public Long getTermId()
    {
        return termId;
    }

    public void setTermName(String termName)
    {
        this.termName = termName;
    }

    public String getTermName()
    {
        return termName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("termId", getTermId())
                .append("termName", getTermName())
                .toString();
    }
}

