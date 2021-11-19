package com.mapper;

import java.util.List;

import com.entity.CheckKnowledge;

/**
 * 
 * @date 2021/9/10
 */
public interface CheckKnowledgeMapper {

    int deleteCheckKnowledge(String id);

    int addCheckKnowledge(CheckKnowledge pack);

    List<CheckKnowledge> queryAllCheckKnowledge(CheckKnowledge checkKnowledger);
    
    List<CheckKnowledge> queryAllCheckKnowledgeById(String id);

    int updateCheckKnowledge(CheckKnowledge checkKnowledge);
    
    CheckKnowledge getCheckKnowledgeById(Integer id);
}