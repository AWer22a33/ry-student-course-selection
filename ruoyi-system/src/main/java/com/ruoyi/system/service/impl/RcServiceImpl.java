package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RcMapper;
import com.ruoyi.system.domain.Rc;
import com.ruoyi.system.service.IRcService;
import com.ruoyi.common.core.text.Convert;

/**
 * 教室课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class RcServiceImpl implements IRcService 
{
    @Autowired
    private RcMapper rcMapper;

    /**
     * 查询教室课程信息
     * 
     * @param rcId 教室课程信息主键
     * @return 教室课程信息
     */
    @Override
    public Rc selectRcByRcId(Long rcId)
    {
        return rcMapper.selectRcByRcId(rcId);
    }

    /**
     * 查询教室课程信息列表
     * 
     * @param rc 教室课程信息
     * @return 教室课程信息
     */
    @Override
    public List<Rc> selectRcList(Rc rc)
    {
        return rcMapper.selectRcList(rc);
    }

    /**
     * 新增教室课程信息
     * 
     * @param rc 教室课程信息
     * @return 结果
     */
    @Override
    public int insertRc(Rc rc)
    {
        rc.setCreateTime(DateUtils.getNowDate());
        return rcMapper.insertRc(rc);
    }

    /**
     * 修改教室课程信息
     * 
     * @param rc 教室课程信息
     * @return 结果
     */
    @Override
    public int updateRc(Rc rc)
    {
        rc.setUpdateTime(DateUtils.getNowDate());
        return rcMapper.updateRc(rc);
    }

    /**
     * 批量删除教室课程信息
     * 
     * @param rcIds 需要删除的教室课程信息主键
     * @return 结果
     */
    @Override
    public int deleteRcByRcIds(String rcIds)
    {
        return rcMapper.deleteRcByRcIds(Convert.toStrArray(rcIds));
    }

    /**
     * 删除教室课程信息信息
     * 
     * @param rcId 教室课程信息主键
     * @return 结果
     */
    @Override
    public int deleteRcByRcId(Long rcId)
    {
        return rcMapper.deleteRcByRcId(rcId);
    }
}
