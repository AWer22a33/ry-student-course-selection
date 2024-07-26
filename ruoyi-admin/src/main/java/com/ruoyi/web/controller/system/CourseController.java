package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.data.CourseData;
import com.ruoyi.system.domain.Rc;
import com.ruoyi.system.domain.Sc;
import com.ruoyi.system.domain.Tc;
import com.ruoyi.system.service.*;
import com.ruoyi.system.vo.CourseCountVo;
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
import com.ruoyi.system.domain.Course;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-10
 */
@Controller
@RequestMapping("/system/course")
public class CourseController extends BaseController
{
    private String prefix = "system/course";

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IRcService rcService;

    @Autowired
    private IScService scService;

    @Autowired
    private ITcService tcService;

    @Autowired
    private IMajorService majorService;

    @Autowired
    private ITermService termService;

    @RequiresPermissions("system:course:view")
    @GetMapping()
    public String course()
    {
        return prefix + "/course";
    }

    /**
     * 查询课程信息列表
     */
    @RequiresPermissions("system:course:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Course course)
    {
        startPage();
        course.setDelFlag(0);
        List<Course> list = courseService.selectCourseList(course);
        for(Course course1:list){
            if(course1.getMajorId()!=null){
            course1.setMajorName(majorService.selectMajorByMajorId(course1.getMajorId()).getMajorName());
                }
            if(course1.getTermId()!=null){
                course1.setTermName(termService.selectTermByTermId(course1.getTermId()).getTermName());
            }
        }
        return getDataTable(list);
    }

    @GetMapping("/getCourseCountGroupByMajor")
    @ResponseBody
    public CourseData getCourseCountGroupByMajor(){
        List<CourseCountVo> list = courseService.getCourseCountGroupByMajor();
        List<String> majorNames=new ArrayList<>();
        List<CourseCountVo> courseCounts=new ArrayList<>();
        for(CourseCountVo courseCountVo:list){
            majorNames.add(courseCountVo.getName());
            courseCounts.add(courseCountVo);
        }
        CourseData courseData=new CourseData();
        courseData.setMajorNames(majorNames);
        courseData.setCourseCounts(courseCounts);
        return courseData;
    }

    /**
     * 导出课程信息列表
     */
    @RequiresPermissions("system:course:export")
    @Log(title = "课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Course course)
    {
        List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        return util.exportExcel(list, "课程信息数据");
    }

    /**
     * 新增课程信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存课程信息
     */
    @RequiresPermissions("system:course:add")
    @Log(title = "课程信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Course course)
    {
        SysUser user = this.getSysUser();
        course.setCreateBy(user.getUserName());
        return toAjax(courseService.insertCourse(course));
    }

    /**
     * 修改课程信息
     */
    @RequiresPermissions("system:course:edit")
    @GetMapping("/edit/{cId}")
    public String edit(@PathVariable("cId") Long cId, ModelMap mmap)
    {
        Course course = courseService.selectCourseByCId(cId);
        mmap.put("course", course);
        mmap.put("currentMarjorId", course.getMajorId());
        mmap.put("currentTermId", course.getTermId());
        return prefix + "/edit";
    }

    /**
     * 修改保存课程信息
     */
    @RequiresPermissions("system:course:edit")
    @Log(title = "课程信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Course course)
    {
        SysUser user = this.getSysUser();
        course.setUpdateBy(user.getUserName());
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 删除课程信息
     */
    @RequiresPermissions("system:course:remove")
    @Log(title = "课程信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        /*return toAjax(courseService.deleteCourseByCIds(ids));*/
        SysUser user = this.getSysUser();
        Long cId = Long.parseLong(ids);
        Course course = courseService.selectCourseByCId(cId);
        Rc rc=new Rc();
        rc.setcId(cId);
        List<Rc> rcs = rcService.selectRcList(rc);
        Sc sc=new Sc();
        sc.setcId(cId);
        List<Sc> scs = scService.selectScList(sc);
        Tc tc=new Tc();
        tc.setcId(cId);
        List<Tc> tcs = tcService.selectTcList(tc);
        if(rcs.size()!=0||scs.size()!=0||tcs.size()!=0){
            return AjaxResult.warn("该课程已有学生选课，无法删除");
        }else {
            course.setDeleteBy(user.getUserName());
            course.setDeleteTime(new Date());
            course.setDelFlag(1);
            return toAjax(courseService.updateCourse(course));
        }
    }
}
