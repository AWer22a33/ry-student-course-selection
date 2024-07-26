package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.vo.CourseCountVo;

/**
 * 课程信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
public interface ICourseService 
{
    /**
     * 查询课程信息
     * 
     * @param cId 课程信息主键
     * @return 课程信息
     */
    public Course selectCourseByCId(Long cId);

    /**
     * 查询课程信息列表
     * 
     * @param course 课程信息
     * @return 课程信息集合
     */
    public List<Course> selectCourseList(Course course);

    public List<CourseCountVo> getCourseCountGroupByMajor();

    /**
     * 新增课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 批量删除课程信息
     * 
     * @param cIds 需要删除的课程信息主键集合
     * @return 结果
     */
    public int deleteCourseByCIds(String cIds);

    /**
     * 删除课程信息信息
     * 
     * @param cId 课程信息主键
     * @return 结果
     */
    public int deleteCourseByCId(Long cId);
}
