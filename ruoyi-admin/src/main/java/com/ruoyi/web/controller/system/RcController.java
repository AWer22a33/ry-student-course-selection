package com.ruoyi.web.controller.system;

import java.util.*;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.service.ICourseService;
import com.ruoyi.system.service.IRoomService;
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
import com.ruoyi.system.domain.Rc;
import com.ruoyi.system.service.IRcService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教室课程信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/rc")
public class RcController extends BaseController
{
    private String prefix = "system/rc";

    @Autowired
    private IRcService rcService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IRoomService roomService;

    @RequiresPermissions("system:rc:view")
    @GetMapping()
    public String rc()
    {
        return prefix + "/rc";
    }

    /**
     * 查询教室课程信息列表
     */
    @RequiresPermissions("system:rc:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Rc rc)
    {
        startPage();
        rc.setDelFlag(0);
        List<Rc> list = rcService.selectRcList(rc);
        for(Rc rc1 : list){
            if(rc1.getcId()!=null){
                if(courseService.selectCourseByCId(rc1.getcId())!=null) {
                    rc1.setcName(courseService.selectCourseByCId(rc1.getcId()).getcName());
                }
            }
            if(rc1.getrId()!=null){
                if(roomService.selectRoomByRId(rc1.getrId())!=null)
                rc1.setrName(roomService.selectRoomByRId(rc1.getrId()).getrName());
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出教室课程信息列表
     */
    @RequiresPermissions("system:rc:export")
    @Log(title = "教室课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Rc rc)
    {
        List<Rc> list = rcService.selectRcList(rc);
        ExcelUtil<Rc> util = new ExcelUtil<Rc>(Rc.class);
        return util.exportExcel(list, "教室课程信息数据");
    }

    /**
     * 新增教室课程信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存教室课程信息
     */
    @RequiresPermissions("system:rc:add")
    @Log(title = "教室课程信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Rc rc)
    {
        Rc rcFlag=new Rc();
        rcFlag.setDelFlag(0);
        List<Rc> rcs = rcService.selectRcList(rcFlag);
        for(Rc rc1:rcs){
            Boolean Flag=false;
            String rc1LessonNumber=rc1.getLessonNumber();
            String rcLessonNumber=rc.getLessonNumber();
            String[] parts1 = rc1LessonNumber.split(",");
            String[] parts2 = rcLessonNumber.split(",");
            Set<String> set = new HashSet<>();
            for (String num1 : parts1) {
                set.add(num1);
            }
            for (String num2 : parts2) {
                if (set.contains(num2)) {
                    Flag=true;
                    break;
                }
            }
            if(rc1.getWeekday().equals(rc.getWeekday())&&Flag){
                        return AjaxResult.error("该教室在该时间段已有课程");
            }
        }
        rc.setCreateBy(getSysUser().getUserName());
        return toAjax(rcService.insertRc(rc));
    }

    /**
     * 修改教室课程信息
     */
    @RequiresPermissions("system:rc:edit")
    @GetMapping("/edit/{rcId}")
    public String edit(@PathVariable("rcId") Long rcId, ModelMap mmap)
    {
        Rc rc = rcService.selectRcByRcId(rcId);
        mmap.put("rc", rc);
        mmap.put("currentRId",rc.getrId());
        mmap.put("currentCId",rc.getcId());
        List<String> lessonNumbers=new ArrayList<>();
        String[] t=rc.getLessonNumber().split(",");
        for(String lessonNumber:t){
            lessonNumbers.add(lessonNumber);
        }
        rc.setLessonNumbers(lessonNumbers);
        return prefix + "/edit";
    }

    /**
     * 修改保存教室课程信息
     */
    @RequiresPermissions("system:rc:edit")
    @Log(title = "教室课程信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Rc rc)
    {
        Rc rcFlag=new Rc();
        rcFlag.setDelFlag(0);
        List<Rc> rcs = rcService.selectRcList(rcFlag);
        for(Rc rc1:rcs){
            if(rc1.getRcId()!=rc.getRcId()) {
                if (rc1.getWeekday().equals(rc.getWeekday())) {
                    for (String lessonNumber : rc.getLessonNumbers()) {
                        if (rc1.getLessonNumber().contains(lessonNumber))
                            return AjaxResult.error("该教室在该时间段已有课程");
                    }
                }
            }
        }
        rc.setUpdateBy(getSysUser().getUserName());
        List<String> lessonNumbers=rc.getLessonNumbers();
        rc.setLessonNumber(String.join(",",lessonNumbers));
        return toAjax(rcService.updateRc(rc));
    }

    /**
     * 删除教室课程信息
     */
    @RequiresPermissions("system:rc:remove")
    @Log(title = "教室课程信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long rcId = Long.parseLong(ids);
        Rc rc = rcService.selectRcByRcId(rcId);
        rc.setDeleteBy(getSysUser().getUserName());
        rc.setDelFlag(1);
        rc.setDeleteTime(new Date());
        return toAjax(rcService.updateRc(rc));
    }
}
