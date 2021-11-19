package com.service.impl;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.constant.SysConstant;
import com.entity.Admin;
import com.entity.Department;
import com.entity.Doctor;
import com.entity.User;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mapper.UserMapper;
import com.service.UserService;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

	@Override
	public Admin adminLogin(Admin admin) {
		return userMapper.adminLogin(admin);
	}

	@Override
	public Doctor doctorLogin(Doctor doctor) {
		return userMapper.doctorLogin(doctor);
	}

	@Override
	public User userLogin(User user) {
		return userMapper.userLogin(user);
	}

	@Override
	public void addUser(User user) {
		userMapper.addUser(user);		
	}

	@Override
	public DataGridView queryAllUser(User user) {
		Page<Object> page = PageHelper.startPage(user.getPage(), user.getLimit());
        List<User> data = this.userMapper.queryAllUser(user);
        return new DataGridView(page.getTotal(),data);
	}

	@Override
	public void updateUser(User user) {
		this.userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public void deleteUser(String uid) {
		//先删除用户
        this.userMapper.deleteByPrimaryKey(uid);
        //根据用户id删除sys_role_user
//        this.roleMapper.deleteRoleUserByUid(userid);
		
	}

	@Override
	public void addDoctor(Doctor doctor) {
		userMapper.addDoctor(doctor);		
	}

	@Override
	public DataGridView queryAllDoctor(Doctor doctor) {
		if (doctor.getPage() != null && doctor.getLimit() != null) {
			Page<Object> page = PageHelper.startPage(doctor.getPage(), doctor.getLimit());
	        List<Doctor> data = this.userMapper.queryAllDoctor(doctor);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Doctor doc = data.get(i);
	        		Department dep = new Department();
	        		dep.setId(doc.getDepartment());
	        		List<Department> depList = userMapper.queryAllDepartment(dep);
	        		if (depList != null && depList.size() >0) {
	        			doc.setDepartmentname(depList.get(0).getName());
	        		}
	        	}
	        }
	        return new DataGridView(page.getTotal(),data);
		}else {
	        List<Doctor> data = this.userMapper.queryAllDoctor(doctor);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Doctor doc = data.get(i);
	        		Department dep = new Department();
	        		dep.setId(doc.getDepartment());
	        		List<Department> depList = userMapper.queryAllDepartment(dep);
	        		if (depList != null && depList.size() >0) {
	        			doc.setDepartmentname(depList.get(0).getName());
	        		}
	        	}
	        }
	        return new DataGridView(data);
		}
		
	}

	@Override
	public void updateDoctor(Doctor userVo) {
		userMapper.updateDoctor(userVo);
	}

	@Override
	public void deleteDoctor(String uid) {
		userMapper.deleteDoctor(uid);
	}

	@Override
	public DataGridView queryAllDepartment(Department department) {
		List<Department> data = this.userMapper.queryAllDepartment(department);
		return new DataGridView(data);
	}

	@Override
	public DataGridView queryOneUserInfo(String type, String loginname) {
		 if (SysConstant.USER_TYPE_ADMIN.equals(type)) {//管理员
			 Admin admin = userMapper.queryAdmin(loginname);
			 return new DataGridView(admin);
	        } else if (SysConstant.USER_TYPE_DOCTOR.equals(type)) {
	            Doctor doctor = userMapper.queryDoctor(loginname);
	            return new DataGridView(doctor);
	        }else if (SysConstant.USER_TYPE_USER.equals(type)) {
	            User user = userMapper.queryUser(loginname);
	            return new DataGridView(user);
	        }
		 return new DataGridView(null);
	}

	@Override
	public void updateAdmin(Admin admin) {
		userMapper.updateAdmin(admin);
		
	}

	@Override
	public void changePwd(String type, String loginname, String pwd) {
		if (SysConstant.USER_TYPE_ADMIN.equals(type)) {//管理员
			 Admin admin = new Admin();
			 admin.setAid(loginname);
			 admin.setApassword(pwd);
			 userMapper.updateAdmin(admin);
	        } else if (SysConstant.USER_TYPE_DOCTOR.equals(type)) {
	            Doctor doctor = new Doctor();
	            doctor.setDid(loginname);
	            doctor.setDpassword(pwd);
	            userMapper.updateDoctor(doctor);
	        }else if (SysConstant.USER_TYPE_USER.equals(type)) {
	            User user = new User();
	            user.setUid(loginname);
	            user.setUpassword(pwd);
	            userMapper.updateByPrimaryKeySelective(user);
	        }
		
	}
	
	@Override
	public User queryUser(String id) {
		return userMapper.queryUser(id);
	}


}
