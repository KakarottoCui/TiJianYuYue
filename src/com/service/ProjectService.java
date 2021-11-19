package com.service;

import com.entity.Project;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface ProjectService {

    public DataGridView queryAllProject(Project project);

    public void addProject(Project project);

    public void updateProject(Project project);

    public void deleteProject(String pid);


}
