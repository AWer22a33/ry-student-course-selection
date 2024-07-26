package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ScMapper;
import com.ruoyi.system.domain.Sc;
import com.ruoyi.system.service.IScService;
import com.ruoyi.common.core.text.Convert;

/**
 * 学生课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class ScServiceImpl implements IScService 
{
    @Autowired
    private ScMapper scMapper;

    /**
     * 查询学生课程信息
     * 
     * @param scId 学生课程信息主键
     * @return 学生课程信息
     */
    @Override
    public Sc selectScByScId(Long scId)
    {
        return scMapper.selectScByScId(scId);
    }

    /**
     * 查询学生课程信息列表
     * 
     * @param sc 学生课程信息
     * @return 学生课程信息
     */
    @Override
    public List<Sc> selectScList(Sc sc)
    {
        return scMapper.selectScList(sc);
    }

    /**
     * 新增学生课程信息
     * 
     * @param sc 学生课程信息
     * @return 结果
     */
    @Override
    public int insertSc(Sc sc)
    {
        sc.setCreateTime(DateUtils.getNowDate());
        return scMapper.insertSc(sc);
    }

    /**
     * 修改学生课程信息
     * 
     * @param sc 学生课程信息
     * @return 结果
     */
    @Override
    public int updateSc(Sc sc)
    {
        sc.setUpdateTime(DateUtils.getNowDate());
        return scMapper.updateSc(sc);
    }

    /**
     * 批量删除学生课程信息
     * 
     * @param scIds 需要删除的学生课程信息主键
     * @return 结果
     */
    @Override
    public int deleteScByScIds(String scIds)
    {
        return scMapper.deleteScByScIds(Convert.toStrArray(scIds));
    }

    /**
     * 删除学生课程信息信息
     * 
     * @param scId 学生课程信息主键
     * @return 结果
     */
    @Override
    public int deleteScByScId(Long scId)
    {
        return scMapper.deleteScByScId(scId);
    }
}
