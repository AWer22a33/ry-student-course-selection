package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Rc;

/**
 * 教室课程信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface IRcService 
{
    /**
     * 查询教室课程信息
     * 
     * @param rcId 教室课程信息主键
     * @return 教室课程信息
     */
    public Rc selectRcByRcId(Long rcId);

    /**
     * 查询教室课程信息列表
     * 
     * @param rc 教室课程信息
     * @return 教室课程信息集合
     */
    public List<Rc> selectRcList(Rc rc);

    /**
     * 新增教室课程信息
     * 
     * @param rc 教室课程信息
     * @return 结果
     */
    public int insertRc(Rc rc);

    /**
     * 修改教室课程信息
     * 
     * @param rc 教室课程信息
     * @return 结果
     */
    public int updateRc(Rc rc);

    /**
     * 批量删除教室课程信息
     * 
     * @param rcIds 需要删除的教室课程信息主键集合
     * @return 结果
     */
    public int deleteRcByRcIds(String rcIds);

    /**
     * 删除教室课程信息信息
     * 
     * @param rcId 教室课程信息主键
     * @return 结果
     */
    public int deleteRcByRcId(Long rcId);
}
