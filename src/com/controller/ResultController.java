package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.hutool.core.lang.UUID;
import cn.hutool.json.JSONObject;

import com.entity.Doctor;
import com.entity.Result;
import com.service.ResultService;
import com.service.UserService;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.utils.DataGridView;
import com.utils.FileUtil;
import com.utils.ResultObj;
import com.utils.WebUtils;
import com.vo.UserVO;

@RestController
@RequestMapping("result")
public class ResultController {

    @Autowired
    private ResultService resultService;
    
    @Autowired
    private UserService userService;
    
    
    @Value("${file.path}")
    private String uploadpath;


    @RequestMapping("updateProjectResult")
    public ResultObj updateProjectResult(Result result, HttpServletRequest request) {
        try {
//        	 String urlString = uploadpath;
//             MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//             // 获取上传的文件
//             MultipartFile multiFile = multipartRequest.getFile("file");
//             File file = FileUtil.multipartFileToFile(multiFile, urlString);
//             String filenameString = file.getName();
//             String filepath = file.getPath();
        	
        	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
        	Doctor doctor = new Doctor();
        	doctor.setDid(user.getLoginname());
        	doctor.setDpassword(user.getPwd());
        	Doctor doc = userService.doctorLogin(doctor);
            this.resultService.updateProjectResult(result,doc);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    @RequestMapping("updateFinalResult")
    public ResultObj updateFinalResult(Result result) {
    	try {
    		this.resultService.updateFinalResult(result);
    		return ResultObj.UPDATE_SUCCESS;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return ResultObj.UPDATE_ERROR;
    	}
    }
    @RequestMapping("queryResult")
    public DataGridView queryResult(Result result) {
    	return this.resultService.queryResult(result);
    }
    @RequestMapping("queryAnalyseResult")
    public DataGridView queryAnalyseResult(Result result) {
    	return this.resultService.queryAnalyseResult(result);
    }
    
    /**
     * 上传文件
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("uploadFile")
    public JSONObject uploadFile(HttpServletRequest request, String oid) throws IOException {
    	
    	JSONObject json = new JSONObject();
        try {
        	if (oid != null && !"".equals(oid)) {
        		String urlString = uploadpath;
                MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
                System.out.println(oid);
                // 获取上传的文件
                MultipartFile multiFile = multipartRequest.getFile("file");
                urlString = urlString + "\\" + oid;
                File file = FileUtil.multipartFileToFile(multiFile, urlString);
                String filenameString = file.getName();
                String filepath = file.getPath();
                String uuid = UUID.randomUUID().toString().replace("-", "");
                Result result = new Result();
                //如果要区分上传报告的权限，在这个地方区分
                result.setDoctor(null);
                result.setFileId(uuid);
                result.setFileName(filenameString);
                result.setFilePath(filepath);
                result.setFinalresult(null);
                result.setOid(oid);
                this.resultService.updateFinalResult(result);
                json.put("url", "报告上传成功");
        	}else {
        		 json.put("url", "数据有误，报告上传失败");
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return json;
    }
    
    @RequestMapping("downloadFile")
    @ResponseBody
    public String downloadFile(HttpServletResponse response, String id) throws IOException {
    	  try {
              //根据文件id查询文件路径
    		  Result r = new Result();
    		  r.setOid(id);
    		  Result result = this.resultService.getResultByOid(id);
    		  if (result != null) {
    			  String filePath = result.getFilePath();
                  //根据文件路径下载文件信息
                  FileUtil.down(response, filePath);
                  response.setContentType("text/html;charset=utf-8");
                  response.setCharacterEncoding("utf-8");
                  return "下载成功";
    		  }
             return "下载失败";
          } catch (IOException e) {
              e.printStackTrace();
          }
          return "下载失败";
    	
    }
   
    
}
