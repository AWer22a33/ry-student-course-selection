package com.ruoyi.web.controller.system;

import java.util.Date;
import java.util.List;

import com.ruoyi.system.domain.Sc;
import com.ruoyi.system.service.ICourseService;
import com.ruoyi.system.service.ITeacherService;
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
import com.ruoyi.system.domain.Tc;
import com.ruoyi.system.service.ITcService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教师课程信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/tc")
public class TcController extends BaseController
{
    private String prefix = "system/tc";

    @Autowired
    private ITcService tcService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ITeacherService teacherService;

    @RequiresPermissions("system:tc:view")
    @GetMapping()
    public String tc()
    {
        return prefix + "/tc";
    }

    /**
     * 查询教师课程信息列表
     */
    @RequiresPermissions("system:tc:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Tc tc)
    {
        startPage();
        tc.setDelFlag(0);
        List<Tc> list = tcService.selectTcList(tc);
        for(Tc tc1 : list){
            if(tc1.gettId()!=null){
                if(teacherService.selectTeacherByTId(tc1.gettId())!=null)
            tc1.settName(teacherService.selectTeacherByTId(tc1.gettId()).gettName());}
            if(tc1.getcId()!=null){
                if(courseService.selectCourseByCId(tc1.getcId())!=null){
            tc1.setcName(courseService.selectCourseByCId(tc1.getcId()).getcName());
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出教师课程信息列表
     */
    @RequiresPermissions("system:tc:export")
    @Log(title = "教师课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Tc tc)
    {
        List<Tc> list = tcService.selectTcList(tc);
        ExcelUtil<Tc> util = new ExcelUtil<Tc>(Tc.class);
        return util.exportExcel(list, "教师课程信息数据");
    }

    /**
     * 新增教师课程信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存教师课程信息
     */
    @RequiresPermissions("system:tc:add")
    @Log(title = "教师课程信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Tc tc)
    {
        tc.setCreateBy(getSysUser().getUserName());
        return toAjax(tcService.insertTc(tc));
    }

    /**
     * 修改教师课程信息
     */
    @RequiresPermissions("system:tc:edit")
    @GetMapping("/edit/{tcId}")
    public String edit(@PathVariable("tcId") Long tcId, ModelMap mmap)
    {
        Tc tc = tcService.selectTcByTcId(tcId);
        mmap.put("tc", tc);
        mmap.put("currentCId",tc.getcId());
        mmap.put("currentTId",tc.gettId());
        return prefix + "/edit";
    }

    /**
     * 修改保存教师课程信息
     */
    @RequiresPermissions("system:tc:edit")
    @Log(title = "教师课程信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Tc tc)
    {
        tc.setUpdateBy(getSysUser().getUserName());
        return toAjax(tcService.updateTc(tc));
    }

    /**
     * 删除教师课程信息
     */
    @RequiresPermissions("system:tc:remove")
    @Log(title = "教师课程信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long tcId = Long.parseLong(ids);
        Tc tc = tcService.selectTcByTcId(tcId);
        tc.setDelFlag(1);
        tc.setDeleteBy(getSysUser().getUserName());
        tc.setDeleteTime(new Date());
        return toAjax(tcService.updateTc(tc));
    }
}
