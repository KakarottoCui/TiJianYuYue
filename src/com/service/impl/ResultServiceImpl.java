package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Doctor;
import com.entity.Order1;
import com.entity.Result;
import com.mapper.Order1Mapper;
import com.mapper.PackageMapper;
import com.mapper.ProjectMapper;
import com.mapper.ResultMapper;
import com.service.ResultService;
import com.utils.DataGridView;
import com.utils.DateUtils;

/**
 *  体检预约管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class ResultServiceImpl implements ResultService {

    
    @Autowired
    private PackageMapper packageMapper;
    
    @Autowired
    private ProjectMapper projectMapper;
    
    @Autowired
    private ResultMapper resultMapper;
    
    @Autowired
    private Order1Mapper order1Mapper;

    @Override
    public void updateProjectResult(Result result,Doctor doct) {
    	result.setUname(DateUtils.getCurrnetDate());
    	if ("0".equals(doct.getDepartment())) {
    		resultMapper.updateFinalResult(result);
    		//更新预约单的状态为2
        	Order1 order1 = new Order1();
        	order1.setOid(result.getOid());
        	order1.setStatus("9");
        	order1Mapper.updateOrder1Status(order1);
    	}else {
    		resultMapper.updateProjectResult(result);
//    		//更新预约单的状态为2
//        	Order1 order1 = new Order1();
//        	order1.setOid(result.getOid());
//        	order1.setStatus("2");
//        	order1Mapper.updateOrder1Status(order1);
    	}
    	
    }
    @Override
    public void updateFinalResult(Result result) {
    	resultMapper.updateFinalResult(result);		
    }
    
    @Override
    public DataGridView queryResult(Result result) {
    	List<Result> resultList = resultMapper.queryResult(result);
    	return new DataGridView(resultList);
    }
    
    @Override
    public DataGridView queryAnalyseResult(Result result) {
    	//查询所有的疾病
    	List<String> diseaseList = resultMapper.queryDisease();
    	//查询每个疾病的人数
    	
    	Map<String,List<String>> map = new HashMap<String,List<String>>();
    	List<String> maleList = new ArrayList<String>();
    	List<String> femaleList = new ArrayList<String>();
    	if (diseaseList != null && diseaseList.size() > 0) {
    		map.put("xAxis", diseaseList);
			for (int i = 0; i < diseaseList.size(); i ++) {
				String dis = diseaseList.get(i);
				List<String>  maleCount = resultMapper.queryDiseaseCount(dis, "男");
				if (maleCount != null && maleCount.size() > 0) {
					String cou = maleCount.get(0);
					maleList.add(cou);
				}
				List<String>  femaleCount = resultMapper.queryDiseaseCount(dis, "女");
				if (femaleCount != null && femaleCount.size() > 0) {
					String cou = femaleCount.get(0);
					femaleList.add(cou);
				}
			}
			map.put("male", maleList);
			map.put("female", femaleList);
    	}else {
    		map.put("xAxis", new ArrayList<String>());
    		map.put("male", new ArrayList<String>());
			map.put("female", new ArrayList<String>());
    	}
    	return new DataGridView(map);
    }
	@Override
	public Result getResultByOid(String oid) {
		// TODO Auto-generated method stub
		return resultMapper.getResultByOid(oid);
	}
    
    
    
}
