package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TcMapper;
import com.ruoyi.system.domain.Tc;
import com.ruoyi.system.service.ITcService;
import com.ruoyi.common.core.text.Convert;

/**
 * 教师课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class TcServiceImpl implements ITcService 
{
    @Autowired
    private TcMapper tcMapper;

    /**
     * 查询教师课程信息
     * 
     * @param tcId 教师课程信息主键
     * @return 教师课程信息
     */
    @Override
    public Tc selectTcByTcId(Long tcId)
    {
        return tcMapper.selectTcByTcId(tcId);
    }

    /**
     * 查询教师课程信息列表
     * 
     * @param tc 教师课程信息
     * @return 教师课程信息
     */
    @Override
    public List<Tc> selectTcList(Tc tc)
    {
        return tcMapper.selectTcList(tc);
    }

    /**
     * 新增教师课程信息
     * 
     * @param tc 教师课程信息
     * @return 结果
     */
    @Override
    public int insertTc(Tc tc)
    {
        tc.setCreateTime(DateUtils.getNowDate());
        return tcMapper.insertTc(tc);
    }

    /**
     * 修改教师课程信息
     * 
     * @param tc 教师课程信息
     * @return 结果
     */
    @Override
    public int updateTc(Tc tc)
    {
        tc.setUpdateTime(DateUtils.getNowDate());
        return tcMapper.updateTc(tc);
    }

    /**
     * 批量删除教师课程信息
     * 
     * @param tcIds 需要删除的教师课程信息主键
     * @return 结果
     */
    @Override
    public int deleteTcByTcIds(String tcIds)
    {
        return tcMapper.deleteTcByTcIds(Convert.toStrArray(tcIds));
    }

    /**
     * 删除教师课程信息信息
     * 
     * @param tcId 教师课程信息主键
     * @return 结果
     */
    @Override
    public int deleteTcByTcId(Long tcId)
    {
        return tcMapper.deleteTcByTcId(tcId);
    }
}
