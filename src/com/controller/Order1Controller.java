package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.hutool.json.JSONObject;

import com.entity.Doctor;
import com.entity.Order1;
import com.entity.User;
import com.service.Order1Service;
import com.service.UserService;
import com.utils.DataGridView;
import com.utils.DateUtils;
import com.utils.FileUtil;
import com.utils.ResultObj;
import com.utils.WebUtils;
import com.vo.UserVO;

@RestController
@RequestMapping("order1")
public class Order1Controller {

    @Autowired
    private Order1Service order1Service;
    
    @Autowired
    private UserService userService;

    @RequestMapping("loadAllOrder1")
    public DataGridView loadAllOrder1(Order1 order1) {
        return this.order1Service.queryAllOrder1(order1);
    }
 
    
    @RequestMapping("loadAllOrderForUser")
    public DataGridView loadAllOrderForUser(Order1 order1) {
    	//设置当前登录用户，只查询当前用户的体检单
    	UserVO userVO =  (UserVO)WebUtils.getHttpSession().getAttribute("user");
    	order1.setUname(userVO.getLoginname());
        return this.order1Service.queryAllOrderForUser(order1);
    }

    @RequestMapping("addOrder1")
    public ResultObj addOrder1(Order1 order1) {
        try {
        	UserVO userVO =  (UserVO)WebUtils.getHttpSession().getAttribute("user");
        	order1.setType("个人");
        	order1.setAdduser(userVO.getRealname());
        	order1.setAddtime(DateUtils.getCurrnetDate());
        	order1.setUname(userVO.getLoginname());
            this.order1Service.addOrder1(order1);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }
    
    /**
     * 团队体检预约
     * @param order1
     * @return
     */
    @RequestMapping("addOrderTeam")
    public ResultObj addOrderTeam(Order1 order1) {
        try {
        	if (order1 != null) {
        		String unameString = order1.getUname();
        		if (unameString != null && !"".equals(unameString)) {
        			String[] idStrings = order1.getUname().split(";");
        			if (idStrings != null && idStrings.length > 0) {
        				UserVO userVO =  (UserVO)WebUtils.getHttpSession().getAttribute("user");
        				for (String s: idStrings) {
        					Order1 order12 = new Order1(order1);
        					//根据用户账号查询用户信息
        					User u = userService.queryUser(s);
        					if (u != null && userVO != null) {
        						order12.setUname(s);
            					order12.setAddtime(DateUtils.getCurrnetDate());
            					order12.setAdduser(userVO.getRealname());
            					order12.setBirthday(u.getBirthday());
            					order12.setUsex(u.getUsex());
            					order12.setUphone(u.getUphone());
            					order12.setType("团体");
            					this.order1Service.addOrder1(order12);
        					}
        				}
        			}
        		}
        	}
           
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateOrder1")
    public ResultObj updateOrder1(Order1 order1) {
        try {
            this.order1Service.updateOrder1(order1);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }


    @RequestMapping("deleteOrder1")
    public ResultObj deleteOrder1(Order1 order1) {
        try {
            this.order1Service.deleteOrder1(order1.getOid());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    @RequestMapping("allowOrder1")
    public ResultObj allowOrder1(Order1 order1) {
    	try {
    		this.order1Service.allowOrder1(order1.getOid());
    		return ResultObj.ORDER1_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.STATUS_FALSE;
    	}
    }
    @RequestMapping("forbidOrder1")
    public ResultObj forbidOrder1(Order1 order1) {
    	try {
    		this.order1Service.forbidOrder1(order1.getOid());
    		return ResultObj.ORDER1_ERROR;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.STATUS_FALSE;
    	}
    }
    
    @RequestMapping("loadAllOrder")
    public DataGridView loadAllOrder(Order1 order1) {
        return this.order1Service.queryAllOrder1(order1);
    }
    /**
     * 获取所有待审批的订单
     * @param order1
     * @return
     */
    @RequestMapping("getAllApproveOrder")
    public DataGridView getAllApproveOrder(Order1 order1) {
    	return this.order1Service.getAllApproveOrder(order1);
    }
    @RequestMapping("loadAllOrder1ForDoctor")
    public DataGridView loadAllOrder1ForDoctor(Order1 order1) {
    	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
    	Doctor doctor = new Doctor();
    	doctor.setDid(user.getLoginname());
    	doctor.setDpassword(user.getPwd());
    	Doctor doc = userService.doctorLogin(doctor);
        return this.order1Service.queryAllOrder1ForDoctor(order1, doc);
    }
    @RequestMapping("getOrder1Detail")
    public Order1 getOrder1Detail(HttpServletRequest request) {
    	String oid = request.getParameter("oid");
    	Order1 order1 = new Order1();
    	order1.setOid(oid);
    	return this.order1Service.getOrder1Detail(order1);
    }
    @RequestMapping("loadAllOrder1ForFDoctor")
    public DataGridView loadAllOrder1ForFDoctor(Order1 order1) {
    	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
    	Doctor doctor = new Doctor();
    	doctor.setDid(user.getLoginname());
    	doctor.setDpassword(user.getPwd());
    	Doctor doc = userService.doctorLogin(doctor);
        return this.order1Service.queryAllOrder1ForDoctor(order1, doc);
    }
    @RequestMapping("uploadFile")
    public JSONObject uploadFile(HttpServletRequest request) throws IOException {
    	
    	JSONObject json = new JSONObject();
        try {

//        	 String urlString = request.getServletContext().getRealPath("/");
//             urlString = urlString + "\\upload";
             
//             String urlString = uploadpath;

//            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        
//            // 获取上传的文件
//            MultipartFile multiFile = multipartRequest.getFile("file");
//            File file = multipartFileToFile(multiFile, urlString);
//            
//            String filenameString = file.getName();
//            String filepath = file.getPath();
//           

            // 对文件路径进行处理
//            String dbFileUrl = fileUrl.substring(0, fileUrl.indexOf("?"));
//            json.put("url", dbFileUrl);
           
            json.put("url", "dddddd");
           
        } catch (Exception e) {
            e.printStackTrace();
        }

        return json;
    }
    
}
