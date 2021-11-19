package com.service;

import java.util.List;

import com.entity.Comment;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface CommentService {

	int addComment(Comment comment);
	    
    List<Comment> queryAllParentComment();
    
    List<Comment> queryAllParentCommentByUserId(String userId);
    
    DataGridView loadAllParentCommentByUserId(String userId);
    
    List<Comment> queryAllChildComment();
    
    DataGridView loadAllComment();

}
