package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Project;
import com.entity.Role;

/**
 * 
 * @date 2021/9/10
 */
public interface ProjectMapper {

    int deleteProject(String id);

    int addProject(Project project);

    List<Project> queryAllProject(Project project);
    
    List<Project> queryAllProjectByDepartment(String department);

    int updateProject(Project project);
}