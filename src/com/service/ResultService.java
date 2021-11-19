package com.service;

import com.entity.Doctor;
import com.entity.Result;
import com.utils.DataGridView;

/**
 * 
 * @date 2021/9/10
 */
public interface ResultService {


    public void updateProjectResult(Result result,Doctor doctor);
    
    public void updateFinalResult(Result result);
    
    public DataGridView queryResult(Result result);
    
    public DataGridView queryAnalyseResult(Result result);
    
    public Result getResultByOid(String oid);
    
}
