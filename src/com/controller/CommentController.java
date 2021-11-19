package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Comment;
import com.entity.Order1;
import com.service.CommentService;
import com.utils.DataGridView;
import com.utils.DateUtils;
import com.utils.ResultObj;
import com.utils.WebUtils;
import com.vo.UserVO;

@RestController
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    
    @RequestMapping("addComment")
    public ResultObj addComment(Comment comment) {
        try {
        	UserVO userVO =  (UserVO)WebUtils.getHttpSession().getAttribute("user");
        	comment.setAddtime(DateUtils.getCurrnetDate());
        	comment.setNickName(userVO.getRealname());
//        	comment.setParentId(-1);
        	comment.setRole(userVO.getType());
        	comment.setUserId(userVO.getLoginname());
            this.commentService.addComment(comment);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }
    
    @RequestMapping("loadAllComment")
    public DataGridView loadAllComment(Comment comment) {
        return this.commentService.loadAllComment();
    }
    
    @RequestMapping("loadAllCommentByUserId")
    public DataGridView loadAllCommentByUserId(Comment comment) {
    	//设置当前登录用户，只查询当前用户的体检单
    	UserVO userVO =  (UserVO)WebUtils.getHttpSession().getAttribute("user");
        return this.commentService.loadAllParentCommentByUserId(userVO.getLoginname());
    }
    
}
