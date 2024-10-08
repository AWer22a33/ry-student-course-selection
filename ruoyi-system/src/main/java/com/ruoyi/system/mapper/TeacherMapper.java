package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Teacher;
import com.ruoyi.system.vo.TeacherMaxMinAgeVo;

/**
 * 教师信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface TeacherMapper 
{
    /**
     * 查询教师信息
     * 
     * @param tId 教师信息主键
     * @return 教师信息
     */
    public Teacher selectTeacherByTId(Long tId);

    /**
     * 查询教师信息列表
     * 
     * @param teacher 教师信息
     * @return 教师信息集合
     */
    public List<Teacher> selectTeacherList(Teacher teacher);

    public List<TeacherMaxMinAgeVo> getMaxMinTeacherAgeGroupByMajor();

    /**
     * 新增教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    public int insertTeacher(Teacher teacher);

    /**
     * 修改教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    public int updateTeacher(Teacher teacher);

    /**
     * 删除教师信息
     * 
     * @param tId 教师信息主键
     * @return 结果
     */
    public int deleteTeacherByTId(Long tId);

    /**
     * 批量删除教师信息
     * 
     * @param tIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeacherByTIds(String[] tIds);
}
