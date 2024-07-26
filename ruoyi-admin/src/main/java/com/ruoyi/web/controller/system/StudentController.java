package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.system.data.StudentData;
import com.ruoyi.system.domain.Sc;
import com.ruoyi.system.service.IScService;
import com.ruoyi.system.vo.StudentCountVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Student;
import com.ruoyi.system.service.IStudentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学生信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/student")
public class StudentController extends BaseController
{
    private String prefix = "system/student";

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IScService scService;

    @RequiresPermissions("system:student:view")
    @GetMapping()
    public String student()
    {
        return prefix + "/student";
    }

    /**
     * 分组统计学生的人数
     */
    @GetMapping("/getCountStudentGroupByMajor")
    @ResponseBody
    public StudentData getCountStudentGroupByMajor()
    {
        StudentData studentData = new StudentData();
        List<StudentCountVo> lists=studentService.getCountStudentGroupByMajor();
        List<Integer> stuentCounts=new ArrayList<>();
        List<String> majorName=new ArrayList<>();
        for(StudentCountVo studentCountVo:lists){
            stuentCounts.add(studentCountVo.getStudentCount());
            majorName.add(studentCountVo.getMajorName());
        }
        studentData.setStudentCounts(stuentCounts);
        studentData.setMajorNames(majorName);
        return studentData;
    }

    /**
     * 查询学生信息列表
     */
    @RequiresPermissions("system:student:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Student student)
    {
        startPage();
        student.setDelFlag(0);
        List<Student> list = studentService.selectStudentList(student);
        return getDataTable(list);
    }

    /**
     * 导出学生信息列表
     */
    @RequiresPermissions("system:student:export")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Student student)
    {
        List<Student> list = studentService.selectStudentList(student);
        ExcelUtil<Student> util = new ExcelUtil<Student>(Student.class);
        return util.exportExcel(list, "学生信息数据");
    }

    /**
     * 新增学生信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存学生信息
     */
    @RequiresPermissions("system:student:add")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Student student)
    {
        student.setCreateBy(getSysUser().getUserName());
        return toAjax(studentService.insertStudent(student));
    }

    /**
     * 修改学生信息
     */
    @RequiresPermissions("system:student:edit")
    @GetMapping("/edit/{stuId}")
    public String edit(@PathVariable("stuId") Long stuId, ModelMap mmap)
    {
        Student student = studentService.selectStudentByStuId(stuId);
        mmap.put("student", student);
        List<String> hobbies=new ArrayList<>();
        String[] s=student.getHobby().split(",");
        for(String hobby:s){
            hobbies.add(hobby);
        }
        student.setHobbies(hobbies);
        return prefix + "/edit";
    }

    /**
     * 修改保存学生信息
     */
    @RequiresPermissions("system:student:edit")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Student student)
    {
        student.setUpdateBy(getSysUser().getUserName());
        List<String> hobbies = student.getHobbies();
        student.setHobby(String.join(",",hobbies));
        return toAjax(studentService.updateStudent(student));
    }

    /**
     * 删除学生信息
     */
    @RequiresPermissions("system:student:remove")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long stuId = Long.parseLong(ids);
        Student student = studentService.selectStudentByStuId(stuId);
        Sc sc=new Sc();
        sc.setStuId(stuId);
        if(scService.selectScList(sc).size()!=0){
            return AjaxResult.error("该学生已选课程，不能删除");
        }else {
            student.setDelFlag(1);
            student.setDeleteBy(getSysUser().getUserName());
            student.setDeleteTime(new Date());
            return toAjax(studentService.updateStudent(student));
        }
    }
}
