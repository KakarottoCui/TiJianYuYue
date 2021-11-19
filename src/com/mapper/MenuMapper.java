package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Menu;
import com.vo.MenuVo;

/**
 *
 * 
 * @date 2021/9/10
 */
public interface MenuMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    /**
     * 查询所有菜单
     */
    List<Menu> queryAllMenu(Menu menu);

    /**
     * 根据pid查询菜单数量
     * @param pid
     * @return
     */
    Integer queryMenuByPid(@Param("pid")Integer pid);

    /**
     * 根据菜单id删除sys_role_menu里面的数据
     * @param mid
     */
    void deleteRoleMenuByMid(@Param("mid") Integer mid);

    /**
     * 根据角色ID查询菜单
     * @param available
     * @param roleid
     * @return
     */
    List<Menu> queryMenuByRoleId(@Param("available") Integer available,@Param("rid") String roleid);

    /**
     * 根据用户id查询菜单
     * @param available
     * @param userId
     * @return
     */
    List<Menu> queryMenuByUid(@Param("available") Integer available,@Param("uid") Integer userId);
    
    /**
     * 查询医生的菜单
     * */
    List<Menu> queryMenuByDoctorIdForList(MenuVo menuVo);
    
    /**
     * 查询体检人员的菜单
     * */
    List<Menu> queryMenuByUserIdForList(MenuVo menuVo);
}
