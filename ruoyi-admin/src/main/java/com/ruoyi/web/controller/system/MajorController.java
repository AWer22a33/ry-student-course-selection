package com.ruoyi.web.controller.system;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.service.ICourseService;
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
import com.ruoyi.system.domain.Major;
import com.ruoyi.system.service.IMajorService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专业信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/major")
public class MajorController extends BaseController
{
    private String prefix = "system/major";

    @Autowired
    private IMajorService majorService;

    @Autowired
    private ICourseService courseService;

    @RequiresPermissions("system:major:view")
    @GetMapping()
    public String major()
    {
        return prefix + "/major";
    }

    /**
     * 查询专业信息列表
     */
    @RequiresPermissions("system:major:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Major major)
    {
        startPage();
        major.setDelFlag(0);
        List<Major> list = majorService.selectMajorList(major);
        return getDataTable(list);
    }

    /**
     * 导出专业信息列表
     */
    @RequiresPermissions("system:major:export")
    @Log(title = "专业信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Major major)
    {
        List<Major> list = majorService.selectMajorList(major);
        ExcelUtil<Major> util = new ExcelUtil<Major>(Major.class);
        return util.exportExcel(list, "专业信息数据");
    }

    /**
     * 新增专业信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存专业信息
     */
    @RequiresPermissions("system:major:add")
    @Log(title = "专业信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Major major)
    {
        SysUser user = getSysUser();
        major.setCreateBy(user.getUserName());
        return toAjax(majorService.insertMajor(major));
    }

    /**
     * 修改专业信息
     */
    @RequiresPermissions("system:major:edit")
    @GetMapping("/edit/{majorId}")
    public String edit(@PathVariable("majorId") Long majorId, ModelMap mmap)
    {
        Major major = majorService.selectMajorByMajorId(majorId);
        mmap.put("major", major);
        return prefix + "/edit";
    }

    /**
     * 修改保存专业信息
     */
    @RequiresPermissions("system:major:edit")
    @Log(title = "专业信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Major major)
    {
        SysUser user = getSysUser();
        major.setUpdateBy(user.getUserName());
        return toAjax(majorService.updateMajor(major));
    }

    /**
     * 删除专业信息
     */
    @RequiresPermissions("system:major:remove")
    @Log(title = "专业信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long majorId=Long.parseLong(ids);
        SysUser user = getSysUser();
        Major major = majorService.selectMajorByMajorId(majorId);
        Course course=new Course();
        course.setMajorId(majorId);
        List<Course> courses = courseService.selectCourseList(course);
        if(courses.size()!=0){
            return AjaxResult.error("该专业下有课程，无法删除");
        }else {
            major.setDeleteBy(user.getUserName());
            major.setDeleteTime(new Date());
            major.setDelFlag(1);
            return toAjax(majorService.updateMajor(major));
        }
    }
}
