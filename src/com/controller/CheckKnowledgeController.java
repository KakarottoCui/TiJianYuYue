package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entity.CheckKnowledge;
import com.service.CheckKnowledgeService;
import com.utils.DataGridView;
import com.utils.DateUtils;
import com.utils.ResultObj;
import com.utils.WebUtils;
import com.vo.UserVO;

@RestController
@RequestMapping("checkknowledge")
public class CheckKnowledgeController {

    @Autowired
    private CheckKnowledgeService checkKnowledgeService;

    @RequestMapping("loadAllCheckKnowledge")
    public DataGridView loadAllCheckKnowledge(CheckKnowledge checkKnowledge) {
        return this.checkKnowledgeService.queryAllCheckKnowledge(checkKnowledge);
    }

    @RequestMapping("addCheckKnowledge")
    public ResultObj addCheckKnowledge(CheckKnowledge checkKnowledge) {
        try {
        	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
        	checkKnowledge.setAuthorid(user.getLoginname());
        	checkKnowledge.setAuthorname(user.getRealname());
        	checkKnowledge.setAddtime(DateUtils.getCurrnetDate());
            this.checkKnowledgeService.addCheckKnowledge(checkKnowledge);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateCheckKnowledge")
    public ResultObj updateCheckKnowledge(CheckKnowledge checkKnowledge) {
        try {
        	UserVO user = (UserVO) WebUtils.getHttpSession().getAttribute("user");
        	checkKnowledge.setAuthorid(user.getLoginname());
        	checkKnowledge.setAuthorname(user.getRealname());
        	checkKnowledge.setAddtime(DateUtils.getCurrnetDate());
            this.checkKnowledgeService.updateCheckKnowledge(checkKnowledge);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }


    @RequestMapping("deleteCheckKnowledge")
    public ResultObj deleteCheckKnowledge(CheckKnowledge checkKnowledge) {
        try {
            this.checkKnowledgeService.deleteCheckKnowledge(checkKnowledge.getId().toString());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    
    @RequestMapping("viewCheckKnowledge")
    public DataGridView viewCheckKnowledge() {
    	String id = WebUtils.getHttpSession().getAttribute("checkKnowledgeId").toString();
        return new DataGridView(this.checkKnowledgeService.viewCheckKnowledge(Integer.parseInt(id)));
    }


}
