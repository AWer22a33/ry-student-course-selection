package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Student;
import com.ruoyi.system.vo.StudentCountVo;

/**
 * 学生信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface StudentMapper 
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
     * 删除学生信息
     * 
     * @param stuId 学生信息主键
     * @return 结果
     */
    public int deleteStudentByStuId(Long stuId);

    /**
     * 批量删除学生信息
     * 
     * @param stuIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentByStuIds(String[] stuIds);

    public List<StudentCountVo> getCountStudentGroupByMajor();
}
