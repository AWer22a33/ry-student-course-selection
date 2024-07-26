package com.ruoyi.web.controller.system;

import java.util.Date;
import java.util.List;

import com.ruoyi.system.domain.Rc;
import com.ruoyi.system.service.IRcService;
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
import com.ruoyi.system.domain.Room;
import com.ruoyi.system.service.IRoomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教室信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Controller
@RequestMapping("/system/room")
public class RoomController extends BaseController
{
    private String prefix = "system/room";

    @Autowired
    private IRoomService roomService;

    @Autowired
    private IRcService rcService;

    @RequiresPermissions("system:room:view")
    @GetMapping()
    public String room()
    {
        return prefix + "/room";
    }

    /**
     * 查询教室信息列表
     */
    @RequiresPermissions("system:room:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Room room)
    {
        startPage();
        room.setDelFlag(0);
        List<Room> list = roomService.selectRoomList(room);
        return getDataTable(list);
    }

    /**
     * 导出教室信息列表
     */
    @RequiresPermissions("system:room:export")
    @Log(title = "教室信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Room room)
    {
        List<Room> list = roomService.selectRoomList(room);
        ExcelUtil<Room> util = new ExcelUtil<Room>(Room.class);
        return util.exportExcel(list, "教室信息数据");
    }

    /**
     * 新增教室信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存教室信息
     */
    @RequiresPermissions("system:room:add")
    @Log(title = "教室信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Room room)
    {
        room.setCreateBy(getSysUser().getUserName());
        return toAjax(roomService.insertRoom(room));
    }

    /**
     * 修改教室信息
     */
    @RequiresPermissions("system:room:edit")
    @GetMapping("/edit/{rId}")
    public String edit(@PathVariable("rId") Long rId, ModelMap mmap)
    {
        Room room = roomService.selectRoomByRId(rId);
        mmap.put("room", room);
        return prefix + "/edit";
    }

    /**
     * 修改保存教室信息
     */
    @RequiresPermissions("system:room:edit")
    @Log(title = "教室信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Room room)
    {
        room.setUpdateBy(getSysUser().getUserName());
        return toAjax(roomService.updateRoom(room));
    }

    /**
     * 删除教室信息
     */
    @RequiresPermissions("system:room:remove")
    @Log(title = "教室信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Long rId = Long.valueOf(ids);
        Room room = roomService.selectRoomByRId(rId);
        Rc rc=new Rc();
        rc.setrId(rId);
        if(rcService.selectRcList(rc).size()!=0){
            return AjaxResult.error("教室已被使用，无法删除");
        }else {
            room.setDelFlag(1);
            room.setDeleteBy(getSysUser().getUserName());
            room.setDeleteTime(new Date());
            return toAjax(roomService.updateRoom(room));
        }
    }
}
