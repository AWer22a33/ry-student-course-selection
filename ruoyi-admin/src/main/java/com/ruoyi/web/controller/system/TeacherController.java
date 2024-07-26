package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.system.data.TeacherData;
import com.ruoyi.system.domain.Tc;
import com.ruoyi.system.service.ITcService;
import com.ruoyi.system.vo.TeacherMaxMinAgeVo;
import io.swagger.models.auth.In;
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
import com.ruoyi.system.domain.Teacher;
import com.ruoyi.system.service.ITeacherService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教师信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/teacher")
public class TeacherController extends BaseController
{
    private String prefix = "system/teacher";

    @Autowired
    private ITeacherService teacherService;

    @Autowired
    private ITcService tcService;

    @RequiresPermissions("system:teacher:view")
    @GetMapping()
    public String teacher()
    {
        return prefix + "/teacher";
    }

    /**
     * 查询教师信息列表
     */
    @RequiresPermissions("system:teacher:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Teacher teacher)
    {
        startPage();
        teacher.setDelFlag(0);
        List<Teacher> list = teacherService.selectTeacherList(teacher);
        return getDataTable(list);
    }

    @GetMapping("/getMaxMinTeacherAgeGroupByMajor")
    @ResponseBody
    public TeacherData getMaxMinTeacherAgeGroupByMajor()
    {
        TeacherData teacherData=new TeacherData();
        List<TeacherMaxMinAgeVo> teacherMaxMinAgeVos = teacherService.getMaxMinTeacherAgeGroupByMajor();
        List<Integer> totalMaxs = new ArrayList<>();
        List<Integer> totalMins = new ArrayList<>();
        List<String> majorNames = new ArrayList<>();
        for(TeacherMaxMinAgeVo teacherMaxMinAgeVo:teacherMaxMinAgeVos){
            totalMaxs.add(teacherMaxMinAgeVo.getTotalMax());
            totalMins.add(teacherMaxMinAgeVo.getTotalMin());
            majorNames.add(teacherMaxMinAgeVo.getMajorName());
        }
        teacherData.setMajorNames(majorNames);
        teacherData.setTotalMaxs(totalMaxs);
        teacherData.setTotalMins(totalMins);
        return teacherData;
    }

    /**
     * 导出教师信息列表
     */
    @RequiresPermissions("system:teacher:export")
    @Log(title = "教师信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Teacher teacher)
    {
        List<Teacher> list = teacherService.selectTeacherList(teacher);
        ExcelUtil<Teacher> util = new ExcelUtil<Teacher>(Teacher.class);
        return util.exportExcel(list, "教师信息数据");
    }

    /**
     * 新增教师信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存教师信息
     */
    @RequiresPermissions("system:teacher:add")
    @Log(title = "教师信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Teacher teacher)
    {
        teacher.setCreateBy(getSysUser().getUserName());
        return toAjax(teacherService.insertTeacher(teacher));
    }

    /**
     * 修改教师信息
     */
    @RequiresPermissions("system:teacher:edit")
    @GetMapping("/edit/{tId}")
    public String edit(@PathVariable("tId") Long tId, ModelMap mmap)
    {
        Teacher teacher = teacherService.selectTeacherByTId(tId);
        mmap.put("teacher", teacher);
        List<String> specialities=new ArrayList<>();
        String[] t=teacher.getSpeciality().split(",");
        for(String speciality:t){
            specialities.add(speciality);
        }
        teacher.setSpecialities(specialities);
        return prefix + "/edit";
    }

    /**
     * 修改保存教师信息
     */
    @RequiresPermissions("system:teacher:edit")
    @Log(title = "教师信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Teacher teacher)
    {
        teacher.setUpdateBy(getSysUser().getUserName());
        List<String> specialities=teacher.getSpecialities();
        teacher.setSpeciality(String.join(",",specialities));
        return toAjax(teacherService.updateTeacher(teacher));
    }

    /**
     * 删除教师信息
     */
    @RequiresPermissions("system:teacher:remove")
    @Log(title = "教师信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long tId = Long.parseLong(ids);
        Teacher teacher = teacherService.selectTeacherByTId(tId);
        Tc tc=new Tc();
        tc.settId(tId);
        if(tcService.selectTcList(tc).size()!=0){
            return AjaxResult.error("该教师有课程，无法删除");
        }else {
            teacher.setDelFlag(1);
            teacher.setDeleteBy(getSysUser().getUserName());
            teacher.setDeleteTime(new Date());
            return toAjax(teacherService.updateTeacher(teacher));
        }
    }
}
