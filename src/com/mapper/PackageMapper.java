package com.mapper;

import java.util.List;

import com.entity.Package;

/**
 * 
 * @date 2021/9/10
 */
public interface PackageMapper {

    int deletePackage(String id);

    int addPackage(Package pack);

    List<Package> queryAllPackage(Package pack);
    
    List<Package> queryAllPackageById(String id);

    int updatePackage(Package pack);
}