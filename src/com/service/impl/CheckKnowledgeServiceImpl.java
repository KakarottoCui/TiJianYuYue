package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.CheckKnowledge;
import com.mapper.CheckKnowledgeMapper;
import com.mapper.ProjectMapper;
import com.service.CheckKnowledgeService;
import com.utils.DataGridView;

/**
 *  体检小知识管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class CheckKnowledgeServiceImpl implements CheckKnowledgeService {

    @Autowired
    private CheckKnowledgeMapper checkKnowledgeMapper;
    
    @Autowired
    private ProjectMapper projectMapper;

	@Override
	public DataGridView queryAllCheckKnowledge(CheckKnowledge checkKnowledge) {
		List<CheckKnowledge> checkKnowledgeList = checkKnowledgeMapper.queryAllCheckKnowledge(checkKnowledge);
	    return new DataGridView(checkKnowledgeList);
	}

	@Override
	public void addCheckKnowledge(CheckKnowledge pack) {
		checkKnowledgeMapper.addCheckKnowledge(pack);		
	}

	@Override
	public void updateCheckKnowledge(CheckKnowledge pack) {
		checkKnowledgeMapper.updateCheckKnowledge(pack);		
	}

	@Override
	public void deleteCheckKnowledge(String pid) {
		checkKnowledgeMapper.deleteCheckKnowledge(pid);		
	}

	@Override
	public CheckKnowledge viewCheckKnowledge(Integer id) {
		return checkKnowledgeMapper.getCheckKnowledgeById(id);
	}


}
