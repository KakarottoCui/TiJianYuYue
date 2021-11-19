package com.mapper;

import java.util.List;

import com.entity.Admin;
import com.entity.Department;
import com.entity.Doctor;
import com.entity.User;

/**
 * 
 * @date 2021/9/10
 */
public interface UserMapper {
	 /**
     * 管理员登录
     * @param userVo
     * @return
     */
    Admin adminLogin(Admin admin);
    /**
     * 医生登录
     * @param userVo
     * @return
     */
    Doctor doctorLogin(Doctor doctor);
    /**
     * 体检人员登录
     * @param userVo
     * @return
     */
    User userLogin(User user);
    
    /**
     * 添加体检人员
     * @param userVo
     */
     void addUser(User user);
     /**
      * 查询所有体检人员
      * @param userVo
      */
     List<User> queryAllUser(User user);
     
     int updateByPrimaryKeySelective(User record);
     
     int deleteByPrimaryKey(String uid);
     
     /**
      * 添加医生
      * @param userVo
      */
     void addDoctor(Doctor doctor);
     
     /**
      * 查询所有医生
      * @param userVo
      * @return
      */
     List<Doctor> queryAllDoctor(Doctor doctor);
     
     /**
      * 修改医生
      * @param userVo
      */
     void updateDoctor(Doctor doctor);
     
     /**
      * 根据id删除医生
      * @param userid
      */
     void deleteDoctor(String did);
     /**
      * 查询所有科室
      * @param userVo
      */
     List<Department> queryAllDepartment(Department department);
     
     
     Admin queryAdmin(String id);
     
     Doctor queryDoctor(String id);
     
     User queryUser(String id);
     
     void updateAdmin(Admin admin);

}
