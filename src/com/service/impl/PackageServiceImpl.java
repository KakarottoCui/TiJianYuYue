package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Department;
import com.entity.Package;
import com.entity.Project;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mapper.PackageMapper;
import com.mapper.ProjectMapper;
import com.service.PackageService;
import com.utils.DataGridView;

/**
 *  角色管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    private PackageMapper packageMapper;
    
    @Autowired
    private ProjectMapper projectMapper;

	@Override
	public DataGridView queryAllPackage(Package pack) {
		if (pack.getPage() != null && pack.getLimit() != null) {
			Page<Object> page = PageHelper.startPage(pack.getPage(), pack.getLimit());
	        List<Package> data = this.packageMapper.queryAllPackage(pack);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Package p = data.get(i);
	        		Project pro = new Project();
	        		pro.setPid(p.getPid());
	        		List<Project> dep = projectMapper.queryAllProject(pro);
	        		if (dep != null && dep.size() > 0) {
	        			p.setPname(dep.get(0).getPname());
	        		}
	        	}
	        }
	        return new DataGridView(page.getTotal(),data);
		}else {
	        List<Package> data = this.packageMapper.queryAllPackage(pack);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Package p = data.get(i);
	        		Project pro = new Project();
	        		pro.setPid(p.getPid());
	        		List<Project> dep = projectMapper.queryAllProject(pro);
	        		if (dep != null && dep.size() > 0) {
	        			p.setPname(dep.get(0).getPname());
	        		}
	        	}
	        }
	        return new DataGridView(data);
		}
		
	}

	@Override
	public void addPackage(Package pack) {
		packageMapper.addPackage(pack);		
	}

	@Override
	public void updatePackage(Package pack) {
		packageMapper.updatePackage(pack);		
	}

	@Override
	public void deletePackage(String pid) {
		packageMapper.deletePackage(pid);		
	}


}
