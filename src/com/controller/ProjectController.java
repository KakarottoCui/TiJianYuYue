package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Project;
import com.service.ProjectService;
import com.utils.DataGridView;
import com.utils.ResultObj;

@RestController
@RequestMapping("project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping("loadAllProject")
    public DataGridView loadAllProject(Project project) {
        return this.projectService.queryAllProject(project);
    }

    @RequestMapping("addProject")
    public ResultObj addProject(Project project) {
        try {
            this.projectService.addProject(project);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateProject")
    public ResultObj updateProject(Project project) {
        try {
            this.projectService.updateProject(project);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }


    @RequestMapping("deleteProject")
    public ResultObj deleteProject(Project project) {
        try {
            this.projectService.deleteProject(project.getPid());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }


}
