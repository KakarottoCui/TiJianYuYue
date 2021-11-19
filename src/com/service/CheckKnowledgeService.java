package com.service;

import com.entity.CheckKnowledge;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface CheckKnowledgeService {

    public DataGridView queryAllCheckKnowledge(CheckKnowledge checkKnowledge);

    public void addCheckKnowledge(CheckKnowledge checkKnowledge);

    public void updateCheckKnowledge(CheckKnowledge checkKnowledge);

    public void deleteCheckKnowledge(String id);
    
    public CheckKnowledge viewCheckKnowledge(Integer id);


}
