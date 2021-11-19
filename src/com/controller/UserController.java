package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Admin;
import com.entity.Department;
import com.entity.Doctor;
import com.entity.User;
import com.service.UserService;
import com.utils.DataGridView;
import com.utils.ResultObj;
import com.utils.WebUtils;
import com.vo.UserVO;

/**
 * 用户管理控制器
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 加载所有的体检人员
     * @param userVo
     * @return
     */
    @RequestMapping("loadAllUser")
    public DataGridView loadAllUser(User user){
        return this.userService.queryAllUser(user);
    }

    /**
     * 添加体检人员
     * @param userVo
     * @return
     */
    @RequestMapping("addUser")
    public ResultObj addUser(User user){
        try {
            this.userService.addUser(user);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }
    /**
     * 修改体检人员
     * @param userVo
     * @return
     */
    @RequestMapping("updateUser")
    public ResultObj updateUser(User userVo){
        try {
            this.userService.updateUser(userVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除用户
     * @param userVo
     * @return
     */
    @RequestMapping("deleteUser")
    public ResultObj deleteUser(User user){
        try {
            this.userService.deleteUser(user.getUid());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    /**
     * 加载所有的医生
     * @param userVo
     * @return
     */
    @RequestMapping("loadAllDoctor")
    public DataGridView loadAllDoctor(Doctor doctor){
    	return this.userService.queryAllDoctor(doctor);
    }
    
    /**
     * 添加医生
     * @param userVo
     * @return
     */
    @RequestMapping("addDoctor")
    public ResultObj addDoctor(Doctor doctor){
    	try {
    		this.userService.addDoctor(doctor);
    		return ResultObj.ADD_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.ADD_ERROR;
    	}
    }
    /**
     * 修改医生
     * @param userVo
     * @return
     */
    @RequestMapping("updateDoctor")
    public ResultObj updateDoctor(Doctor userVo){
    	try {
    		this.userService.updateDoctor(userVo);
    		return ResultObj.UPDATE_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.UPDATE_ERROR;
    	}
    }
    
    /**
     * 删除医生
     * @param userVo
     * @return
     */
    @RequestMapping("deleteDoctor")
    public ResultObj deleteDoctor(Doctor doctor){
    	try {
    		this.userService.deleteDoctor(doctor.getDid());
    		return ResultObj.DELETE_SUCCESS;
    	}catch (Exception e){
    		e.printStackTrace();
    		return ResultObj.DELETE_ERROR;
    	}
    }
    /**
     * 加载所有的科室
     * @param userVo
     * @return
     */
    @RequestMapping("loadAllDepartment")
    public DataGridView loadAllDepartment(Department department){
    	return this.userService.queryAllDepartment(department);
    }
    /**
     * 查询管理员的个人信息
     * @param userVo
     * @return
     */
    @RequestMapping("queryOneUserInfo")
    public DataGridView queryOneUserInfo(){
    	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
    	return this.userService.queryOneUserInfo(user.getType(), user.getLoginname());
    }
    
   
    @RequestMapping("updateAdmin")
    public ResultObj updateAdmin(Admin admin){
    	try {
    		this.userService.updateAdmin(admin);
    		return ResultObj.UPDATE_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.UPDATE_ERROR;
    	}
    }
    @RequestMapping("changePwd")
    public ResultObj changePwd(HttpServletRequest request){
    	
    	try {
    		String pwd = request.getParameter("pwd");
        	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
            this.userService.changePwd(user.getType(), user.getLoginname(), pwd);
    		return ResultObj.UPDATE_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.UPDATE_ERROR;
    	}
    }
}
