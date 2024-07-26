package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RoomMapper;
import com.ruoyi.system.domain.Room;
import com.ruoyi.system.service.IRoomService;
import com.ruoyi.common.core.text.Convert;

/**
 * 教室信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
@Service
public class RoomServiceImpl implements IRoomService 
{
    @Autowired
    private RoomMapper roomMapper;

    /**
     * 查询教室信息
     * 
     * @param rId 教室信息主键
     * @return 教室信息
     */
    @Override
    public Room selectRoomByRId(Long rId)
    {
        return roomMapper.selectRoomByRId(rId);
    }

    /**
     * 查询教室信息列表
     * 
     * @param room 教室信息
     * @return 教室信息
     */
    @Override
    public List<Room> selectRoomList(Room room)
    {
        return roomMapper.selectRoomList(room);
    }

    /**
     * 新增教室信息
     * 
     * @param room 教室信息
     * @return 结果
     */
    @Override
    public int insertRoom(Room room)
    {
        room.setCreateTime(DateUtils.getNowDate());
        return roomMapper.insertRoom(room);
    }

    /**
     * 修改教室信息
     * 
     * @param room 教室信息
     * @return 结果
     */
    @Override
    public int updateRoom(Room room)
    {
        room.setUpdateTime(DateUtils.getNowDate());
        return roomMapper.updateRoom(room);
    }

    /**
     * 批量删除教室信息
     * 
     * @param rIds 需要删除的教室信息主键
     * @return 结果
     */
    @Override
    public int deleteRoomByRIds(String rIds)
    {
        return roomMapper.deleteRoomByRIds(Convert.toStrArray(rIds));
    }

    /**
     * 删除教室信息信息
     * 
     * @param rId 教室信息主键
     * @return 结果
     */
    @Override
    public int deleteRoomByRId(Long rId)
    {
        return roomMapper.deleteRoomByRId(rId);
    }
}
