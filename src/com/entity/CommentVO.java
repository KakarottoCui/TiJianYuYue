package com.entity;

import java.util.*;

public class CommentVO extends Comment{
   
    private List<Comment> children;

	public List<Comment> getChildren() {
		return children;
	}

	public void setChildren(List<Comment> children) {
		this.children = children;
	}
    
    
    
}
