package com.service;

import java.util.List;

import com.entity.Menu;
import com.utils.DataGridView;
import com.vo.MenuVo;

/**
 * 菜单管理的服务接口
 * 
 * @date 2021/9/10
 */
public interface MenuService {

    /**
     * 查询所有的菜单返回List
     * @param menuVo
     * @return
     */
     List<Menu> queryAllMenuForList(MenuVo menuVo);

     /**
      *根据用户id查询用户可用菜单
      * */
//     List<Menu> queryMenuByUserIdForList(MenuVo menuVo,Integer userId);
     
     /**
      * 查询医生的菜单
      * */
     List<Menu> queryMenuByDoctorIdForList(String role);
     
     /**
      * 查询体检人员的菜单
      * */
     List<Menu> queryMenuByUserIdForList(String role);


    /**
     * 查询所有菜单
     * @param menuVo
     * @return
     */
    DataGridView queryAllMenu(MenuVo menuVo);

    /**
     *添加菜单
     **/
    void addMenu(MenuVo menuVo);

    /**
     *修改菜单
     **/
    void updateMenu(MenuVo menuVo);
    /**
     *根据pid查询菜单的数量
     **/
    Integer queryMenuByPid(Integer pid);

    /**
     * 删除菜单
     * @param menuVo
     */
    void deleteMenu(MenuVo menuVo);
}
