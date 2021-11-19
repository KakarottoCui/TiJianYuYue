package com.service;

import java.util.List;

import com.entity.Role;
import com.utils.DataGridView;
import com.vo.RoleVo;

/**
 * 
 * @date 2021/9/10
 */
public interface RoleService {
    /**
     * 查询所有角色返回
     * @param roleVo
     * @return
     */
    public List<Role> queryAllRoleForList(RoleVo roleVo);

    /**
     * 根据用户id查询用户的可用角色
     */
    public List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId);

    /**
     * 查询所有角色
     * @param roleVo
     * @return
     */
    public DataGridView queryAllRole(RoleVo roleVo);

    /**
     * 添加角色
     * @param roleVo
     */
    public void addRole(RoleVo roleVo);

    /**
     * 修改角色
     * @param roleVo
     */
    public void updateRole(RoleVo roleVo);

    /**
     * 根据id删除角色
     * @param roleid
     */
    public void deleteRole(Integer roleid);

    /**
     * 批量删除角色
     * @param ids
     */
    public void deleteBatchRole(Integer [] ids);

    /**
     * 加载角色管理分配菜单的json
     * @param roleid
     * @return
     */
    public DataGridView initRoleMenuTreeJson(String roleid);

    /**
     * 保存角色和菜单的关系
     * @param roleVo
     */
    public void saveRoleMenu(RoleVo roleVo);

}
