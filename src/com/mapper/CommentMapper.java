package com.mapper;

import com.entity.Comment;
import java.util.*;

/**
 * 
 * @date 2021/9/10
 */
public interface CommentMapper {

    int addComment(Comment comment);
    
    List<Comment> queryAllComment();
    
    List<Comment> queryAllParentComment();
    
    List<Comment> queryAllParentCommentByUserId(String userId);
    
    List<Comment> queryAllChildComment();
    
}