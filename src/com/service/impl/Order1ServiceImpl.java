package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Doctor;
import com.entity.Order1;
import com.entity.Package;
import com.entity.Project;
import com.entity.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mapper.Order1Mapper;
import com.mapper.PackageMapper;
import com.mapper.ProjectMapper;
import com.mapper.ResultMapper;
import com.service.Order1Service;
import com.utils.DataGridView;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;

/**
 *  体检预约管理的服务接口
 * 
 * @date 2021/9/10
 */
@Service
public class Order1ServiceImpl implements Order1Service {

    @Autowired
    private Order1Mapper order1Mapper;
    
    @Autowired
    private PackageMapper packageMapper;
    
    @Autowired
    private ProjectMapper projectMapper;
    
    @Autowired
    private ResultMapper resultMapper;

	@Override
	public DataGridView queryAllOrder1(Order1 order1) {
		if (order1.getPage() != null && order1.getLimit() != null) {
			Page<Object> page = PageHelper.startPage(order1.getPage(), order1.getLimit());
	        List<Order1> data = this.order1Mapper.queryAllOrder1(order1);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Order1 p = data.get(i);
	        		Package pack = new Package();
	        		pack.setId(p.getId());
	        		List<Package> dep = packageMapper.queryAllPackage(pack);
	        		if (dep != null && dep.size() > 0) {
	        			p.setPackagename(dep.get(0).getPackagename());
	        		}
	        	}
	        }
	        return new DataGridView(page.getTotal(),data);
		}else {
			List<Order1> data = this.order1Mapper.queryAllOrder1(order1);
	        if (data != null && data.size() > 0) {
	        	for (int i = 0; i < data.size(); i ++) {
	        		Order1 p = data.get(i);
	        		Package pack = new Package();
	        		pack.setId(p.getId());
	        		List<Package> dep = packageMapper.queryAllPackage(pack);
	        		if (dep != null && dep.size() > 0) {
	        			p.setPackagename(dep.get(0).getPackagename());
	        		}
	        	}
	        }
	        return new DataGridView(data);
		}
		
	}
	@Override
	public DataGridView getAllApproveOrder(Order1 order1) {
		List<Order1> data = null;
//		order1.setStatus("0");
		data = this.order1Mapper.getAllApproveOrder("0");
		return new DataGridView(data);
	}
	@Override
	public DataGridView queryAllOrderForUser(Order1 order1) {
		if (order1.getPage() != null && order1.getLimit() != null) {
			Page<Object> page = PageHelper.startPage(order1.getPage(), order1.getLimit());
			List<Order1> data = this.order1Mapper.getOrderByUserId(order1.getUname());
			if (data != null && data.size() > 0) {
				for (int i = 0; i < data.size(); i ++) {
					Order1 p = data.get(i);
					Package pack = new Package();
					pack.setId(p.getId());
					List<Package> dep = packageMapper.queryAllPackage(pack);
					if (dep != null && dep.size() > 0) {
						p.setPackagename(dep.get(0).getPackagename());
					}
				}
			}
			return new DataGridView(page.getTotal(),data);
		}else {
			List<Order1> data = this.order1Mapper.getOrderByUserId(order1.getUname());
			if (data != null && data.size() > 0) {
				for (int i = 0; i < data.size(); i ++) {
					Order1 p = data.get(i);
					Package pack = new Package();
					pack.setId(p.getId());
					List<Package> dep = packageMapper.queryAllPackage(pack);
					if (dep != null && dep.size() > 0) {
						p.setPackagename(dep.get(0).getPackagename());
					}
				}
			}
			return new DataGridView(data);
		}
		
	}
	@Override
	public DataGridView queryAllOrder1ForDoctor(Order1 order1, Doctor doctor) {
		if (order1.getPage() != null && order1.getLimit() != null) {
			//判断属于哪个部门的医生
			List<Order1> data = null;
//			if ("0".equals(doctor.getDepartment())) {
//				//属于体检科的医生，查询要输入最后的预约单
//				order1.setStatus("2");
//			}else {
//				//属于其他科的医生，查询要检验的预约单
//				order1.setStatus("1");
//			}
			//医生不区分有没有体检完成
//			order1.setStatus("1");
			data = this.order1Mapper.queryAllOrder1ByStatus(order1);
			Page<Object> page = PageHelper.startPage(order1.getPage(), order1.getLimit());
			
			//根据医生所在的部门查询该部门下的所有项目
			List<Project> projectList = projectMapper.queryAllProjectByDepartment(doctor.getDepartment());
			if (data != null && data.size() > 0) {
				for (int i = data.size() - 1; i >= 0; i --) {
					Boolean flag = false;
					Order1 p = data.get(i);
					//判断order里面的项目是否有projectList里面的项目，如果没有，则删除掉。
					//先获取到order里面的所有项目（包括单选的项目和基本套餐里面的项目）
					String pid = p.getAllproject();
					if (pid != null && !"".equals(pid)) {
						JSONArray objar = new JSONArray(pid);
						if (objar != null && objar.size() > 0) {
							//objar里面存放的是该体检单的所有项目
							for (int j = 0; j < objar.size(); j ++) {
								JSONObject jb = (JSONObject) objar.get(j);
								for (int k = 0; k < projectList.size(); k ++) {
									Project project = projectList.get(k);
									if (project.getPid().equals(jb.get("pid").toString())) {
										flag = true;
										break;
									}
								}
								if (flag) {
									break;
								}
							}
						}
					}
//					if ("0".equals(doctor.getDepartment())) {
//						Package pack = new Package();
//						pack.setId(p.getId());
//						List<Package> dep = packageMapper.queryAllPackage(pack);
//						if (dep != null && dep.size() > 0) {
//							p.setPackagename(dep.get(0).getPackagename());
//						}
//					}else {
//						//循环完了没有对应的项目，则将此预约删除
//						if (!flag) {
//							data.remove(i);
//						}else {
//							Package pack = new Package();
//							pack.setId(p.getId());
//							List<Package> dep = packageMapper.queryAllPackage(pack);
//							if (dep != null && dep.size() > 0) {
//								p.setPackagename(dep.get(0).getPackagename());
//							}
//						}
//					}
					//2021.3.3修改为了医生给体检人员审批预约，此处只要是医生，查询出来的都一样。
					Package pack = new Package();
					pack.setId(p.getId());
					List<Package> dep = packageMapper.queryAllPackage(pack);
					if (dep != null && dep.size() > 0) {
						p.setPackagename(dep.get(0).getPackagename());
					}
					
				}
			}
			return new DataGridView(page.getTotal(),data);
		}else {
			List<Order1> data = this.order1Mapper.queryAllOrder1(order1);
			if (data != null && data.size() > 0) {
				for (int i = 0; i < data.size(); i ++) {
					Order1 p = data.get(i);
					Package pack = new Package();
					pack.setId(p.getId());
					List<Package> dep = packageMapper.queryAllPackage(pack);
					if (dep != null && dep.size() > 0) {
						p.setPackagename(dep.get(0).getPackagename());
					}
				}
			}
			return new DataGridView(data);
		}
		
	}

	@Override
	public void addOrder1(Order1 order1) {
		//根据选择的项目和套餐，查询出所有的项目来
		
		String id = order1.getId();
		List<Project> proList = new ArrayList<Project>();
		//根据id查询套餐下的所有项目
		List<Package> packageList = packageMapper.queryAllPackageById(id);
		if (packageList != null && packageList.size() > 0) {
			Package pack = packageList.get(0);
			String pid = pack.getPid();
			JSONArray objar = new JSONArray(pid);
			if (objar != null && objar.size() > 0) {
				for (int j = 0; j < objar.size(); j ++) {
					JSONObject jb = (JSONObject) objar.get(j);
					Project pro = new Project();
					pro.setPid(jb.getStr("pid"));
					pro.setPname(jb.getStr("pname"));
					proList.add(pro);
				}
			}
		}
		//把单独选择的项目，添加到list中
		String prId = order1.getPid();
		JSONArray objar = new JSONArray(prId);
		if (objar != null && objar.size() > 0) {
			for (int j = 0; j < objar.size(); j ++) {
				JSONObject jb = (JSONObject) objar.get(j);
				Project pro = new Project();
				pro.setPid(jb.getStr("pid"));
				pro.setPname(jb.getStr("pname"));
				//判断list中是否包含了此对象
				if (!proList.contains(pro)) {
					proList.add(pro);
				}
				
			}
		}
		JSONArray jsonArray=new JSONArray(proList);
		order1.setAllproject(jsonArray.toString());
		order1Mapper.addOrder1(order1);		
	}

	@Override
	public void updateOrder1(Order1 order1) {
		String id = order1.getId();
		List<Project> proList = new ArrayList<Project>();
		//根据id查询套餐下的所有项目
		List<Package> packageList = packageMapper.queryAllPackageById(id);
		if (packageList != null && packageList.size() > 0) {
			Package pack = packageList.get(0);
			String pid = pack.getPid();
			JSONArray objar = new JSONArray(pid);
			if (objar != null && objar.size() > 0) {
				for (int j = 0; j < objar.size(); j ++) {
					JSONObject jb = (JSONObject) objar.get(j);
					Project pro = new Project();
					pro.setPid(jb.getStr("pid"));
					pro.setPname(jb.getStr("pname"));
					proList.add(pro);
				}
			}
		}
		//把单独选择的项目，添加到list中
		String prId = order1.getPid();
		JSONArray objar = new JSONArray(prId);
		if (objar != null && objar.size() > 0) {
			for (int j = 0; j < objar.size(); j ++) {
				JSONObject jb = (JSONObject) objar.get(j);
				Project pro = new Project();
				pro.setPid(jb.getStr("pid"));
				pro.setPname(jb.getStr("pname"));
				//判断list中是否包含了此对象
				if (!proList.contains(pro)) {
					proList.add(pro);
				}
				
			}
		}
		JSONArray jsonArray=new JSONArray(proList);
		order1.setAllproject(jsonArray.toString());
		order1Mapper.updateOrder1(order1);		
	}

	@Override
	public void deleteOrder1(String pid) {
		order1Mapper.deleteOrder1(pid);		
	}
	
	@Override
	public void allowOrder1(String pid) {
		order1Mapper.allowOrder1(pid);	
		Order1 order1 = new Order1();
		order1.setOid(pid);
		List<Order1> order1List = order1Mapper.getOrder1Detail(order1);
		if (order1List != null && order1List.size() > 0) {
			Order1 order = order1List.get(0);
			//预约通过以后，在结果表中存一条数据
			Result result = new Result();
			result.setOid(order1.getOid());
			result.setUname(order.getUname());
			if ("0".equals(order.getUsex())) {
				result.setUsex("女");
			}else {
				result.setUsex("男");
			}
			result.setProjectresult(order.getAllproject());
			resultMapper.addResult(result);
		}
		
	}
	
	@Override
	public void forbidOrder1(String pid) {
		order1Mapper.forbidOrder1(pid);		
	}
	@Override
	public Order1 getOrder1Detail(Order1 order1) {
        List<Order1> data = this.order1Mapper.getOrder1Detail(order1);
        Order1 p = new Order1();
        if (data != null && data.size() > 0) {
        	for (int i = 0; i < data.size(); i ++) {
        		 p = data.get(0);
        	}
        }
        return p;
	}


}
