package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.vo.StudentCountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.StudentMapper;
import com.ruoyi.system.domain.Student;
import com.ruoyi.system.service.IStudentService;
import com.ruoyi.common.core.text.Convert;

/**
 * 学生信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class StudentServiceImpl implements IStudentService 
{
    @Autowired
    private StudentMapper studentMapper;

    /**
     * 查询学生信息
     * 
     * @param stuId 学生信息主键
     * @return 学生信息
     */
    @Override
    public Student selectStudentByStuId(Long stuId)
    {
        return studentMapper.selectStudentByStuId(stuId);
    }

    /**
     * 查询学生信息列表
     * 
     * @param student 学生信息
     * @return 学生信息
     */
    @Override
    public List<Student> selectStudentList(Student student)
    {
        return studentMapper.selectStudentList(student);
    }

    @Override
    public List<StudentCountVo> getCountStudentGroupByMajor() {
        return studentMapper.getCountStudentGroupByMajor();
    }

    /**
     * 新增学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    @Override
    public int insertStudent(Student student)
    {
        student.setCreateTime(DateUtils.getNowDate());
        return studentMapper.insertStudent(student);
    }

    /**
     * 修改学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    @Override
    public int updateStudent(Student student)
    {
        student.setUpdateTime(DateUtils.getNowDate());
        return studentMapper.updateStudent(student);
    }

    /**
     * 批量删除学生信息
     * 
     * @param stuIds 需要删除的学生信息主键
     * @return 结果
     */
    @Override
    public int deleteStudentByStuIds(String stuIds)
    {
        return studentMapper.deleteStudentByStuIds(Convert.toStrArray(stuIds));
    }

    /**
     * 删除学生信息信息
     * 
     * @param stuId 学生信息主键
     * @return 结果
     */
    @Override
    public int deleteStudentByStuId(Long stuId)
    {
        return studentMapper.deleteStudentByStuId(stuId);
    }
}
