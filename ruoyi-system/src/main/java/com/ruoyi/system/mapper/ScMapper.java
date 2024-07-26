package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Sc;

/**
 * 学生课程信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface ScMapper 
{
    /**
     * 查询学生课程信息
     * 
     * @param scId 学生课程信息主键
     * @return 学生课程信息
     */
    public Sc selectScByScId(Long scId);

    /**
     * 查询学生课程信息列表
     * 
     * @param sc 学生课程信息
     * @return 学生课程信息集合
     */
    public List<Sc> selectScList(Sc sc);

    /**
     * 新增学生课程信息
     * 
     * @param sc 学生课程信息
     * @return 结果
     */
    public int insertSc(Sc sc);

    /**
     * 修改学生课程信息
     * 
     * @param sc 学生课程信息
     * @return 结果
     */
    public int updateSc(Sc sc);

    /**
     * 删除学生课程信息
     * 
     * @param scId 学生课程信息主键
     * @return 结果
     */
    public int deleteScByScId(Long scId);

    /**
     * 批量删除学生课程信息
     * 
     * @param scIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteScByScIds(String[] scIds);
}
