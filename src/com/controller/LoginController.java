package com.controller;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.constant.SysConstant;
import com.entity.Admin;
import com.entity.Doctor;
import com.entity.User;
import com.service.UserService;
import com.utils.WebUtils;
import com.vo.UserVO;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

/**
 * 用户登录控制器
 */
@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService userService;
//
//    @Autowired
//    private LogInfoService logInfoService;

    /**
     * @return 跳转到登录页面的方法
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "system/main/login";
    }

    /**
     * .登陆方法
     * @param userVo
     * @param model
     * @return
     */
    @RequestMapping("login")
    public String login(HttpServletRequest request,  Model model){
    	String role = request.getParameter("role");
    	String userName = request.getParameter("userName");
    	String password = request.getParameter("password");
//        String code = WebUtils.getHttpSession().getAttribute("code").toString();
//        if(userVo.getCode().equals(code)){
    	if (SysConstant.USER_TYPE_ADMIN.equals(role)) {//管理员
    		Admin a = new Admin();
    		a.setAid(userName);
    		a.setApassword(password);
    		Admin admin = userService.adminLogin(a);
            if(null != admin){
                //放入到session
            	UserVO uv = new UserVO();
            	uv.setLoginname(admin.getAid());
            	uv.setPwd(admin.getApassword());
            	uv.setRealname(admin.getAname());
            	uv.setType(SysConstant.USER_TYPE_ADMIN);
                WebUtils.getHttpSession().setAttribute("user",uv);
                WebUtils.getHttpSession().setAttribute("userInfoPage","adminInfo.html");
                WebUtils.getHttpSession().setAttribute("rolename","管理员");
                return "system/main/index";
            }else {
                model.addAttribute("error", SysConstant.USER_LOGIN_ERROR_MSG);
                return "system/main/login";
            }
		}else if (SysConstant.USER_TYPE_DOCTOR.equals(role)) {//医生
			Doctor d = new Doctor();
    		d.setDid(userName);
    		d.setDpassword(password);
    		Doctor doctor = userService.doctorLogin(d);
            if(null != doctor){
                //放入到session
            	UserVO uv = new UserVO();
            	uv.setLoginname(doctor.getDid());
            	uv.setPwd(doctor.getDpassword());
            	uv.setRealname(doctor.getDname());
            	uv.setType(SysConstant.USER_TYPE_DOCTOR);
                WebUtils.getHttpSession().setAttribute("user", uv);
                WebUtils.getHttpSession().setAttribute("userInfoPage","doctorInfo.html");
                WebUtils.getHttpSession().setAttribute("rolename","医生");
                return "system/main/index";
            }else {
                model.addAttribute("error", SysConstant.USER_LOGIN_ERROR_MSG);
                return "system/main/login";
            }
		}else if (SysConstant.USER_TYPE_USER.equals(role)) {//体检人员
			User u = new User();
    		u.setUid(userName);
    		u.setUpassword(password);
    		User user = userService.userLogin(u);
            if(null != user){
                //放入到session
            	UserVO uv = new UserVO();
            	uv.setLoginname(user.getUid());
            	uv.setPwd(user.getUpassword());
            	uv.setRealname(user.getUname());
            	uv.setType(SysConstant.USER_TYPE_USER);
                WebUtils.getHttpSession().setAttribute("user",uv);
                WebUtils.getHttpSession().setAttribute("userInfoPage","userInfo.html");
                WebUtils.getHttpSession().setAttribute("rolename","体检人员");
                return "system/main/index";
            }else {
                model.addAttribute("error", SysConstant.USER_LOGIN_ERROR_MSG);
                return "system/main/login";
            }
		}else {
			model.addAttribute("error", SysConstant.USER_LOGIN_ERROR_MSG);
            return "system/main/login";
		}
            
            
    }

    @RequestMapping("getCode")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        //定义图形验证码的长和宽
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(116,36,4,5);
        session.setAttribute("code",lineCaptcha.getCode());
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(lineCaptcha.getImage(),"JPEG",outputStream);

    }
    
    @RequestMapping("toregister")
    public String toregister() {
    	return "system/main/register";
    }


}
