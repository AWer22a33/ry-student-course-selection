package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Tc;

/**
 * 教师课程信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface ITcService 
{
    /**
     * 查询教师课程信息
     * 
     * @param tcId 教师课程信息主键
     * @return 教师课程信息
     */
    public Tc selectTcByTcId(Long tcId);

    /**
     * 查询教师课程信息列表
     * 
     * @param tc 教师课程信息
     * @return 教师课程信息集合
     */
    public List<Tc> selectTcList(Tc tc);

    /**
     * 新增教师课程信息
     * 
     * @param tc 教师课程信息
     * @return 结果
     */
    public int insertTc(Tc tc);

    /**
     * 修改教师课程信息
     * 
     * @param tc 教师课程信息
     * @return 结果
     */
    public int updateTc(Tc tc);

    /**
     * 批量删除教师课程信息
     * 
     * @param tcIds 需要删除的教师课程信息主键集合
     * @return 结果
     */
    public int deleteTcByTcIds(String tcIds);

    /**
     * 删除教师课程信息信息
     * 
     * @param tcId 教师课程信息主键
     * @return 结果
     */
    public int deleteTcByTcId(Long tcId);
}
