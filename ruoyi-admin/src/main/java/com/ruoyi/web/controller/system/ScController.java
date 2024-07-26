package com.ruoyi.web.controller.system;

import java.util.Date;
import java.util.List;

import com.ruoyi.system.domain.Rc;
import com.ruoyi.system.service.ICourseService;
import com.ruoyi.system.service.IStudentService;
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
import com.ruoyi.system.domain.Sc;
import com.ruoyi.system.service.IScService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学生课程信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/sc")
public class ScController extends BaseController
{
    private String prefix = "system/sc";

    @Autowired
    private IScService scService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IStudentService studentService;

    @RequiresPermissions("system:sc:view")
    @GetMapping()
    public String sc()
    {
        return prefix + "/sc";
    }

    /**
     * 查询学生课程信息列表
     */
    @RequiresPermissions("system:sc:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Sc sc)
    {
        startPage();
        sc.setDelFlag(0);
        List<Sc> list = scService.selectScList(sc);
        for(Sc sc1 : list){
            if(sc1.getcId()!=null){
                if(courseService.selectCourseByCId(sc1.getcId())!=null) {
                    sc1.setcName(courseService.selectCourseByCId(sc1.getcId()).getcName());
                }
            }
            if(sc1.getStuId()!=null){
                if(studentService.selectStudentByStuId(sc1.getStuId())!=null)
                sc1.setStuName(studentService.selectStudentByStuId(sc1.getStuId()).getStuName());
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出学生课程信息列表
     */
    @RequiresPermissions("system:sc:export")
    @Log(title = "学生课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Sc sc)
    {
        List<Sc> list = scService.selectScList(sc);
        ExcelUtil<Sc> util = new ExcelUtil<Sc>(Sc.class);
        return util.exportExcel(list, "学生课程信息数据");
    }

    /**
     * 新增学生课程信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存学生课程信息
     */
    @RequiresPermissions("system:sc:add")
    @Log(title = "学生课程信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Sc sc)
    {
        sc.setCreateBy(getSysUser().getUserName());
        return toAjax(scService.insertSc(sc));
    }

    /**
     * 修改学生课程信息
     */
    @RequiresPermissions("system:sc:edit")
    @GetMapping("/edit/{scId}")
    public String edit(@PathVariable("scId") Long scId, ModelMap mmap)
    {
        Sc sc = scService.selectScByScId(scId);
        mmap.put("sc", sc);
        mmap.put("currentCId",sc.getcId());
        mmap.put("currentStuId",sc.getStuId());
        return prefix + "/edit";
    }

    /**
     * 修改保存学生课程信息
     */
    @RequiresPermissions("system:sc:edit")
    @Log(title = "学生课程信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Sc sc)
    {
        sc.setUpdateBy(getSysUser().getUserName());
        return toAjax(scService.updateSc(sc));
    }

    /**
     * 删除学生课程信息
     */
    @RequiresPermissions("system:sc:remove")
    @Log(title = "学生课程信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long scId = Long.parseLong(ids);
        Sc sc = scService.selectScByScId(scId);
        sc.setDelFlag(1);
        sc.setDeleteBy(getSysUser().getUserName());
        sc.setDeleteTime(new Date());
        return toAjax(scService.updateSc(sc));
    }
}
