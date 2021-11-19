package com.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Comment;
import com.entity.CommentVO;
import com.mapper.CommentMapper;
import com.service.CommentService;
import com.utils.DataGridView;

/**
 *  体检预约管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class CommentServiceImpl implements CommentService {
	
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private CommentMapper commentMapper;

	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentMapper.addComment(comment);
	}

	@Override
	public List<Comment> queryAllParentComment() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> queryAllParentCommentByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> queryAllChildComment() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGridView loadAllComment() {
		//查询所有的父节点
		List<Comment> parentList = commentMapper.queryAllParentComment();
		List<Comment> childList = commentMapper.queryAllChildComment();
		List<CommentVO> list = new ArrayList<>();
		try {
			for (Comment comment: parentList) {
				CommentVO vo = new CommentVO();
				vo.setAddtime(fmt.format(fmt.parse(comment.getAddtime())));
				vo.setContent(comment.getContent());
				vo.setId(comment.getId());
				vo.setNickName(comment.getNickName());
				vo.setParentId(comment.getParentId());
				vo.setRole(comment.getRole());
				vo.setUserId(comment.getUserId());
				List<Comment> tlist = new ArrayList<>();
				for (Comment item: childList) {
					if (comment.getId() == item.getParentId()) {
						tlist.add(item);
					}
				}
				vo.setChildren(tlist);
				list.add(vo);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new DataGridView(list);
	}

	@Override
	public DataGridView loadAllParentCommentByUserId(String userId) {
		//查询所有的父节点
		List<Comment> parentList = commentMapper.queryAllParentCommentByUserId(userId);
		List<Comment> childList = commentMapper.queryAllChildComment();
		List<CommentVO> list = new ArrayList<>();
		try {
			for (Comment comment: parentList) {
				CommentVO vo = new CommentVO();
				vo.setAddtime(fmt.format(fmt.parse(comment.getAddtime())));
				vo.setContent(comment.getContent());
				vo.setId(comment.getId());
				vo.setNickName(comment.getNickName());
				vo.setParentId(comment.getParentId());
				vo.setRole(comment.getRole());
				vo.setUserId(comment.getUserId());
				List<Comment> tlist = new ArrayList<>();
				for (Comment item: childList) {
					if (comment.getId() == item.getParentId()) {
						tlist.add(item);
					}
				}
				vo.setChildren(tlist);
				list.add(vo);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new DataGridView(list);
	}
}
