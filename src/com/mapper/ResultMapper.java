package com.mapper;

import java.util.List;

import com.entity.Result;

/**
 * 
 * @date 2021/9/10
 */
public interface ResultMapper {

	int updateProjectResult(Result result);
	
	int updateFinalResult(Result result);
	
	List<Result> queryResult(Result result);
	
	List<String> queryDisease();
	
	List<String> queryDiseaseCount(String disease, String sex);
	
	
	
	
    int deleteResult(String id);
    
    int allowResult(String id);
    
    int forbidResult(String id);

    int addResult(Result result);

    List<Result> queryAllResult(Result result);
    
    List<Result> queryAllResultByStatus(Result result);

    
    List<Result> getResultDetail(Result result);
    
    Result getResultByOid(String oid);
}