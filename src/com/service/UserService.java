package com.service;

import com.entity.Admin;
import com.entity.Department;
import com.entity.Doctor;
import com.entity.User;
import com.utils.DataGridView;

/**
 * 用户服务接口
 * 
 * @date 2021/9/10
 */
public interface UserService {

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
      * @return
      */
      DataGridView queryAllUser(User user);
      
      /**
       * 修改体检人员
       * @param userVo
       */
       void updateUser(User userVo);

      /**
       * 根据id删除体检人员
       * @param userid
       */
       void deleteUser(String uid);

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
       DataGridView queryAllDoctor(Doctor doctor);
       
       /**
        * 修改医生
        * @param userVo
        */
       void updateDoctor(Doctor userVo);
       
       /**
        * 根据id删除医生
        * @param userid
        */
       void deleteDoctor(String uid);
       
       /**
        * 查询所有科室
        * @param userVo
        * @return
        */
        DataGridView queryAllDepartment(Department department);
        /**
         * 查询个人信息
         * @param userVo
         * @return
         */
         DataGridView queryOneUserInfo(String type, String loginname);
        
         void updateAdmin(Admin admin);
         
         void changePwd(String type, String loginname, String pwd);
         
         /**
          * 体检人员登录
          * @param userVo
          * @return
          */
         User queryUser(String id);
       
}
