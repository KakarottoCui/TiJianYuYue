package com.service;

import com.entity.Package;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface PackageService {

    public DataGridView queryAllPackage(Package pack);

    public void addPackage(Package pack);

    public void updatePackage(Package pack);

    public void deletePackage(String pid);


}
