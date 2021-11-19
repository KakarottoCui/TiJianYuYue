package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Department;
import com.entity.Project;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mapper.ProjectMapper;
import com.mapper.UserMapper;
import com.service.ProjectService;
import com.utils.DataGridView;

/**
 *  角色管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;
    
    @Autowired
    private UserMapper userMapper;

	@Override
	public DataGridView queryAllProject(Project project) {
		if (project.getPage() != null && project.getLimit() != null) {
			Page<Object> page = PageHelper.startPage(project.getPage(), project.getLimit());
	        List<Project> data = this.projectMapper.queryAllProject(project);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Project p = data.get(i);
	        		Department department = new Department();
	        		department.setId(p.getDepartment());
	        		List<Department> dep = userMapper.queryAllDepartment(department);
	        		if (dep != null && dep.size() > 0) {
	        			p.setDepartmentname(dep.get(0).getName());
	        		}
	        	}
	        }
	        return new DataGridView(page.getTotal(),data);
		}else {
			List<Project> data = this.projectMapper.queryAllProject(project);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Project p = data.get(i);
	        		Department department = new Department();
	        		department.setId(p.getDepartment());
	        		List<Department> dep = userMapper.queryAllDepartment(department);
	        		if (dep != null && dep.size() > 0) {
	        			p.setDepartmentname(dep.get(0).getName());
	        		}
	        	}
	        }
	        return new DataGridView(data);
		}
		
	}

	@Override
	public void addProject(Project project) {
		projectMapper.addProject(project);		
	}

	@Override
	public void updateProject(Project project) {
		projectMapper.updateProject(project);		
	}

	@Override
	public void deleteProject(String pid) {
		projectMapper.deleteProject(pid);		
	}


}
