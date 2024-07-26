package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.vo.TeacherMaxMinAgeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeacherMapper;
import com.ruoyi.system.domain.Teacher;
import com.ruoyi.system.service.ITeacherService;
import com.ruoyi.common.core.text.Convert;

/**
 * 教师信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class TeacherServiceImpl implements ITeacherService 
{
    @Autowired
    private TeacherMapper teacherMapper;

    /**
     * 查询教师信息
     * 
     * @param tId 教师信息主键
     * @return 教师信息
     */
    @Override
    public Teacher selectTeacherByTId(Long tId)
    {
        return teacherMapper.selectTeacherByTId(tId);
    }

    /**
     * 查询教师信息列表
     * 
     * @param teacher 教师信息
     * @return 教师信息
     */
    @Override
    public List<Teacher> selectTeacherList(Teacher teacher)
    {
        return teacherMapper.selectTeacherList(teacher);
    }

    @Override
    public List<TeacherMaxMinAgeVo> getMaxMinTeacherAgeGroupByMajor() {
        return teacherMapper.getMaxMinTeacherAgeGroupByMajor();
    }

    /**
     * 新增教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    @Override
    public int insertTeacher(Teacher teacher)
    {
        teacher.setCreateTime(DateUtils.getNowDate());
        return teacherMapper.insertTeacher(teacher);
    }

    /**
     * 修改教师信息
     * 
     * @param teacher 教师信息
     * @return 结果
     */
    @Override
    public int updateTeacher(Teacher teacher)
    {
        teacher.setUpdateTime(DateUtils.getNowDate());
        return teacherMapper.updateTeacher(teacher);
    }

    /**
     * 批量删除教师信息
     * 
     * @param tIds 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByTIds(String tIds)
    {
        return teacherMapper.deleteTeacherByTIds(Convert.toStrArray(tIds));
    }

    /**
     * 删除教师信息信息
     * 
     * @param tId 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByTId(Long tId)
    {
        return teacherMapper.deleteTeacherByTId(tId);
    }
}
