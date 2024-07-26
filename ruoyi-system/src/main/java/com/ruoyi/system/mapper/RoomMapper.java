package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Room;

/**
 * 教室信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-09
 */
public interface RoomMapper 
{
    /**
     * 查询教室信息
     * 
     * @param rId 教室信息主键
     * @return 教室信息
     */
    public Room selectRoomByRId(Long rId);

    /**
     * 查询教室信息列表
     * 
     * @param room 教室信息
     * @return 教室信息集合
     */
    public List<Room> selectRoomList(Room room);

    /**
     * 新增教室信息
     * 
     * @param room 教室信息
     * @return 结果
     */
    public int insertRoom(Room room);

    /**
     * 修改教室信息
     * 
     * @param room 教室信息
     * @return 结果
     */
    public int updateRoom(Room room);

    /**
     * 删除教室信息
     * 
     * @param rId 教室信息主键
     * @return 结果
     */
    public int deleteRoomByRId(Long rId);

    /**
     * 批量删除教室信息
     * 
     * @param rIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRoomByRIds(String[] rIds);
}
