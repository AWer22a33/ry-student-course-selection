package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Student;
import com.ruoyi.system.vo.StudentCountVo;

/**
 * 学生信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface IStudentService 
{
    /**
     * 查询学生信息
     * 
     * @param stuId 学生信息主键
     * @return 学生信息
     */
    public Student selectStudentByStuId(Long stuId);

    /**
     * 查询学生信息列表
     * 
     * @param student 学生信息
     * @return 学生信息集合
     */
    public List<Student> selectStudentList(Student student);

    public List<StudentCountVo> getCountStudentGroupByMajor();

    /**
     * 新增学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    public int insertStudent(Student student);

    /**
     * 修改学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    public int updateStudent(Student student);

    /**
     * 批量删除学生信息
     * 
     * @param stuIds 需要删除的学生信息主键集合
     * @return 结果
     */
    public int deleteStudentByStuIds(String stuIds);

    /**
     * 删除学生信息信息
     * 
     * @param stuId 学生信息主键
     * @return 结果
     */
    public int deleteStudentByStuId(Long stuId);
}
