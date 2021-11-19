package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Package;
import com.service.PackageService;
import com.utils.DataGridView;
import com.utils.ResultObj;

@RestController
@RequestMapping("package")
public class PackageController {

    @Autowired
    private PackageService packService;

    @RequestMapping("loadAllPackage")
    public DataGridView loadAllPackage(Package pack) {
        return this.packService.queryAllPackage(pack);
    }

    @RequestMapping("addPackage")
    public ResultObj addPackage(Package pack) {
        try {
            this.packService.addPackage(pack);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updatePackage")
    public ResultObj updatePackage(Package pack) {
        try {
            this.packService.updatePackage(pack);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }


    @RequestMapping("deletePackage")
    public ResultObj deletePackage(Package pack) {
        try {
            this.packService.deletePackage(pack.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }


}
