package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Menu;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mapper.MenuMapper;
import com.service.MenuService;
import com.utils.DataGridView;
import com.vo.MenuVo;

/**
 * 
 * @date 2021/9/10
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;
    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }

    /**
     * 权限管理做完成后再回来改
     * @param menuVo
     * @param userId
     * @return
     */
//    @Override
//    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
//        return menuMapper.queryMenuByUid(menuVo.getAvailable(),userId);
//    }

    /**
     * 查询所有菜单的实现类
     * @param menuVo
     * @return
     */
    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page = PageHelper.startPage(menuVo.getPage(),menuVo.getLimit());
        List<Menu> data = this.menuMapper.queryAllMenu(menuVo);
        System.out.println("data = " + data);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加菜单
     * @param menuVo
     */
    @Override
    public void addMenu(MenuVo menuVo) {
        this.menuMapper.insertSelective(menuVo);
    }

    /**
     * 修改菜单
     * @param menuVo
     */
    @Override
    public void updateMenu(MenuVo menuVo) {
        this.menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    /**
     * 根据pid查询菜单的数量
     * @param pid
     * @return
     */
    @Override
    public Integer queryMenuByPid(Integer pid) {
        return this.menuMapper.queryMenuByPid(pid);
    }

    /**
     * 删除菜单
     * @param menuVo
     */
    @Override
    public void deleteMenu(MenuVo menuVo) {
        //删除菜单的数据
        this.menuMapper.deleteByPrimaryKey(menuVo.getId());
        //根据id删除sys_role_menu里面的数据
        this.menuMapper.deleteRoleMenuByMid(menuVo.getId());
    }

	@Override
	public List<Menu> queryMenuByDoctorIdForList(String roleid) {
		return menuMapper.queryMenuByRoleId(1, roleid);
	}

	@Override
	public List<Menu> queryMenuByUserIdForList(String roleid) {
		return menuMapper.queryMenuByRoleId(1, roleid);
	}
}
