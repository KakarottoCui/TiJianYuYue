package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.constant.SysConstant;
import com.utils.WebUtils;
import com.vo.UserVO;

/**
 * 页面跳转控制器
 */
@Controller
@RequestMapping("sys")
public class SysController {

    /**
     * @return 跳转到菜单管理
     */
    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "system/menu/menuManager";
    }

    /**
     * 跳转到菜单管理的左边的菜单树页面
     * @return
     */
    @RequestMapping("toMenuRight")
    public String toMenuRight(){
        return "system/menu/MenuRight";
    }

    /**
     * 跳转到菜单管理的右边的菜单树页面
     * @return
     */
    @RequestMapping("toMenuLeft")
    public String toMenuLeft(){
        return "system/menu/MenuLeft";
    }
    /**
     * 跳转到角色管理
     * @return
     */
    @RequestMapping("toRoleManager")
    public String toRoleManager(){
        return "system/role/roleManager";
    }

    /**
     * 跳转到用户管理页面
     * @return
     */
    @RequestMapping("toUserManager")
    public String toUserManager(){
        return "system/user/userManager";
    }
    
    
    
    /**
     * 跳转到体检人员管理
     * @return
     */
    @RequestMapping("toTJUserManager")
    public String toTJUserManager(){
    	return "system/user/tjuserManager";
    }
    /**
     * 跳转到医生人员管理
     * @return
     */
    @RequestMapping("toDoctorManager")
    public String toDoctorManager(){
    	return "system/user/doctorManager";
    }
    /**
     * 跳转到体检项目管理
     * @return
     */
    @RequestMapping("toProjectManager")
    public String toProjectManager(){
    	return "system/project/projectManager";
    }
    /**
     * 跳转到套餐管理
     * @return
     */
    @RequestMapping("toPackageManager")
    public String toPackageManager(){
    	return "system/pack/packageManager";
    }
    /**
     * 跳转到个人预约管理
     * @return
     */
    @RequestMapping("toOrder1Manager")
    public String toOrder1Manager(){
    	return "system/order/order1Manager";
    }
    /**
     * 跳转到单位预约管理
     * @return
     */
    @RequestMapping("toOrder2Manager")
    public String toOrder2Manager(){
    	return "system/order/order2Manager";
    }
    /**
     * 跳转到个人信息页面
     * @return
     */
    @RequestMapping("toUserInfoManager")
    public String toUserInfoManager(){
    	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
    	if (SysConstant.USER_TYPE_ADMIN.equals(user.getType())) {//管理员
    		return "system/user/adminInfoManager";
        } else if (SysConstant.USER_TYPE_DOCTOR.equals(user.getType())) {
        	return "system/user/doctorInfoManager";
        }else if (SysConstant.USER_TYPE_USER.equals(user.getType())) {
        	return "system/user/userInfoManager";
        }
    	return "system/main/login";
    }
   
    @RequestMapping("toChangePwdManager")
    public String toChangePwdManager(){
    	return "system/user/changePwdManager";
    }
    
    @RequestMapping("toCheckOneOrderManager")
    public String toCheckOneOrderManager(){
    	return "system/order/checkOneOrderManager";
    }
    
    @RequestMapping("toCheckOrderManager")
    public String toCheckOrderManager(){
    	return "system/order/checkOrderManager";
    }
    @RequestMapping("toAnalyseManager")
    public String toAnalyseManager(){
    	return "system/analyse/toAnalyseManage";
    }
    
    /**
     * 跳转到体检小知识页面
     * @return
     */
    @RequestMapping("toCheckKnowledge")
    public String toCheckKnowledge(){
    	
    	return "system/news/checkKnowledge";
    }
    
    /**
     * 跳转到体检小知识页面
     * @return
     */
    @RequestMapping("toOrderTeamManager")
    public String toOrderTeamManager(){
    	
    	return "system/order/orderTeamManager";
    }
    
    /**
     * 跳转到用户反馈页面
     * @return
     */
    @RequestMapping("toUserFeedback")
    public String toUserFeedback(){
    	
    	return "system/analyse/userFeeddback";
    }
    /**
     * 跳转到医生的用户反馈页面
     * @return
     */
    @RequestMapping("toDoctorFeedback")
    public String toDoctorFeedback(){
    	
    	return "system/analyse/doctorFeeddback";
    }
    
    /**
     * 跳转到查看体检小知识的页面
     * @return
     */
    @RequestMapping("toViewCheckKnowledge")
    public String toViewCheckKnowledge(String id){
    	WebUtils.getHttpSession().setAttribute("checkKnowledgeId",id);
    	return "system/news/viewCheckKnowledge";
    }
}
