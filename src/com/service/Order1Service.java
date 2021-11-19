package com.service;

import com.entity.Doctor;
import com.entity.Order1;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface Order1Service {

    public DataGridView queryAllOrder1(Order1 order1);
    
    public DataGridView getAllApproveOrder(Order1 order1);
    
    public DataGridView queryAllOrderForUser(Order1 order1);
    
    public DataGridView queryAllOrder1ForDoctor(Order1 order1, Doctor doctor);
    
    public Order1 getOrder1Detail(Order1 order1);

    public void addOrder1(Order1 order1);

    public void updateOrder1(Order1 order1);

    public void deleteOrder1(String pid);
    
    public void allowOrder1(String pid);
    
    public void forbidOrder1(String pid);


}
