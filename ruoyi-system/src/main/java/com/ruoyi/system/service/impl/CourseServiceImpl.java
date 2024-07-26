package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.vo.CourseCountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CourseMapper;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.service.ICourseService;
import com.ruoyi.common.core.text.Convert;

/**
 * 课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@Service
public class CourseServiceImpl implements ICourseService 
{
    @Autowired
    private CourseMapper courseMapper;

    /**
     * 查询课程信息
     * 
     * @param cId 课程信息主键
     * @return 课程信息
     */
    @Override
    public Course selectCourseByCId(Long cId)
    {
        return courseMapper.selectCourseByCId(cId);
    }

    /**
     * 查询课程信息列表
     * 
     * @param course 课程信息
     * @return 课程信息
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {
        return courseMapper.selectCourseList(course);
    }

    @Override
    public List<CourseCountVo> getCourseCountGroupByMajor() {
        return courseMapper.getCourseCountGroupByMajor();
    }

    /**
     * 新增课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int insertCourse(Course course)
    {
        course.setCreateTime(DateUtils.getNowDate());
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int updateCourse(Course course)
    {
        course.setUpdateTime(DateUtils.getNowDate());
        return courseMapper.updateCourse(course);
    }

    /**
     * 批量删除课程信息
     * 
     * @param cIds 需要删除的课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseByCIds(String cIds)
    {
        return courseMapper.deleteCourseByCIds(Convert.toStrArray(cIds));
    }

    /**
     * 删除课程信息信息
     * 
     * @param cId 课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseByCId(Long cId)
    {
        return courseMapper.deleteCourseByCId(cId);
    }
}
