package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TermMapper;
import com.ruoyi.system.domain.Term;
import com.ruoyi.system.service.ITermService;
import com.ruoyi.common.core.text.Convert;

/**
 * 学期信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@Service
public class TermServiceImpl implements ITermService 
{
    @Autowired
    private TermMapper termMapper;

    /**
     * 查询学期信息
     * 
     * @param termId 学期信息主键
     * @return 学期信息
     */
    @Override
    public Term selectTermByTermId(Long termId)
    {
        return termMapper.selectTermByTermId(termId);
    }

    /**
     * 查询学期信息列表
     * 
     * @param term 学期信息
     * @return 学期信息
     */
    @Override
    public List<Term> selectTermList(Term term)
    {
        return termMapper.selectTermList(term);
    }

    /**
     * 新增学期信息
     * 
     * @param term 学期信息
     * @return 结果
     */
    @Override
    public int insertTerm(Term term)
    {
        return termMapper.insertTerm(term);
    }

    /**
     * 修改学期信息
     * 
     * @param term 学期信息
     * @return 结果
     */
    @Override
    public int updateTerm(Term term)
    {
        return termMapper.updateTerm(term);
    }

    /**
     * 批量删除学期信息
     * 
     * @param termIds 需要删除的学期信息主键
     * @return 结果
     */
    @Override
    public int deleteTermByTermIds(String termIds)
    {
        return termMapper.deleteTermByTermIds(Convert.toStrArray(termIds));
    }

    /**
     * 删除学期信息信息
     * 
     * @param termId 学期信息主键
     * @return 结果
     */
    @Override
    public int deleteTermByTermId(Long termId)
    {
        return termMapper.deleteTermByTermId(termId);
    }
}
