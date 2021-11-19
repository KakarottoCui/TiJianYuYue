package com.mapper;

import java.util.List;

import com.entity.Order1;

/**
 * 
 * @date 2021/9/10
 */
public interface Order1Mapper {

    int deleteOrder1(String id);
    
    int allowOrder1(String id);
    
    int forbidOrder1(String id);

    int addOrder1(Order1 order1);

    List<Order1> queryAllOrder1(Order1 order1);
    
    List<Order1> queryAllOrder1ByStatus(Order1 order1);
    
    List<Order1> getAllApproveOrder(String status);

    int updateOrder1(Order1 order1);
    
    List<Order1> getOrder1Detail(Order1 order1);
    
    List<Order1> getOrderByUserId(String userid);
    
    int updateOrder1Status(Order1 order1);
}