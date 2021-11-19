package com.entity;


public class Order1 {
    private String oid;

    private String uname;

    private String usex;
    
    private String uphone;

    private String birthday;
    
    private String odatetime;
    
    private String pid;
    
    private String pname;
    
    private String id;
    
    private String packagename;
    
    private String allproject;
    
    private String type;
    
    private String adduser;
    
    private String addtime;
    
    private String status;

    private Integer page;
    
    private Integer limit;



	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getOdatetime() {
		return odatetime;
	}

	public void setOdatetime(String odatetime) {
		this.odatetime = odatetime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPackagename() {
		return packagename;
	}

	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAllproject() {
		return allproject;
	}

	public void setAllproject(String allproject) {
		this.allproject = allproject;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAdduser() {
		return adduser;
	}

	public void setAdduser(String adduser) {
		this.adduser = adduser;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public Order1(Order1 order1){
		this.oid = order1.oid;

		this.uname = order1.uname;

		this.usex = order1.usex;
	    
		this.uphone = order1.uphone;

		this.birthday = order1.birthday;
	    
		this.odatetime = order1.odatetime;
	    
		this.pid = order1.pid;
	    
		this.pname = order1.pname;
	    
		this.id = order1.id;
	    
		this.packagename = order1.packagename;
	    
		this.allproject = order1.allproject;
	    
		this.type = order1.type;
	    
		this.adduser = order1.adduser;
	    
		this.addtime = order1.addtime;
	}

	public Order1() {
		// TODO Auto-generated constructor stub
	}
	  

    
}
