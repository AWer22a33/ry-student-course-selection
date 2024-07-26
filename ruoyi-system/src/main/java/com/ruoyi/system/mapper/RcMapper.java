package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Rc;

/**
 * 教室课程信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface RcMapper 
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
     * 删除教室课程信息
     * 
     * @param rcId 教室课程信息主键
     * @return 结果
     */
    public int deleteRcByRcId(Long rcId);

    /**
     * 批量删除教室课程信息
     * 
     * @param rcIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRcByRcIds(String[] rcIds);
}
