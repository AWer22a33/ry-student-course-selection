package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Major;

/**
 * 专业信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface MajorMapper 
{
    /**
     * 查询专业信息
     * 
     * @param majorId 专业信息主键
     * @return 专业信息
     */
    public Major selectMajorByMajorId(Long majorId);

    /**
     * 查询专业信息列表
     * 
     * @param major 专业信息
     * @return 专业信息集合
     */
    public List<Major> selectMajorList(Major major);

    /**
     * 新增专业信息
     * 
     * @param major 专业信息
     * @return 结果
     */
    public int insertMajor(Major major);

    /**
     * 修改专业信息
     * 
     * @param major 专业信息
     * @return 结果
     */
    public int updateMajor(Major major);

    /**
     * 删除专业信息
     * 
     * @param majorId 专业信息主键
     * @return 结果
     */
    public int deleteMajorByMajorId(Long majorId);

    /**
     * 批量删除专业信息
     * 
     * @param majorIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMajorByMajorIds(String[] majorIds);
}
