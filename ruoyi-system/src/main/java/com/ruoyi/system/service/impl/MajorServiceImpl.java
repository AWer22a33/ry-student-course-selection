package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MajorMapper;
import com.ruoyi.system.domain.Major;
import com.ruoyi.system.service.IMajorService;
import com.ruoyi.common.core.text.Convert;

/**
 * 专业信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class MajorServiceImpl implements IMajorService 
{
    @Autowired
    private MajorMapper majorMapper;

    /**
     * 查询专业信息
     * 
     * @param majorId 专业信息主键
     * @return 专业信息
     */
    @Override
    public Major selectMajorByMajorId(Long majorId)
    {
        return majorMapper.selectMajorByMajorId(majorId);
    }

    /**
     * 查询专业信息列表
     * 
     * @param major 专业信息
     * @return 专业信息
     */
    @Override
    public List<Major> selectMajorList(Major major)
    {
        return majorMapper.selectMajorList(major);
    }

    /**
     * 新增专业信息
     * 
     * @param major 专业信息
     * @return 结果
     */
    @Override
    public int insertMajor(Major major)
    {
        major.setCreateTime(DateUtils.getNowDate());
        return majorMapper.insertMajor(major);
    }

    /**
     * 修改专业信息
     * 
     * @param major 专业信息
     * @return 结果
     */
    @Override
    public int updateMajor(Major major)
    {
        major.setUpdateTime(DateUtils.getNowDate());
        return majorMapper.updateMajor(major);
    }

    /**
     * 批量删除专业信息
     * 
     * @param majorIds 需要删除的专业信息主键
     * @return 结果
     */
    @Override
    public int deleteMajorByMajorIds(String majorIds)
    {
        return majorMapper.deleteMajorByMajorIds(Convert.toStrArray(majorIds));
    }

    /**
     * 删除专业信息信息
     * 
     * @param majorId 专业信息主键
     * @return 结果
     */
    @Override
    public int deleteMajorByMajorId(Long majorId)
    {
        return majorMapper.deleteMajorByMajorId(majorId);
    }
}
