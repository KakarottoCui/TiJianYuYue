package com.entity;


public class Project {
    private String pid;

    private String pname;

    private String ptype;
    
    private String ptypename;

    private String psex;
    
    private String department;
    
    private String departmentname;

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

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPsex() {
		return psex;
	}

	public void setPsex(String psex) {
		this.psex = psex;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
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

	public String getPtypename() {
		return ptypename;
	}

	public void setPtypename(String ptypename) {
		this.ptypename = ptypename;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}    

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (obj instanceof Project) {
			Project project = (Project) obj;
            return this.pid.equals(project.pid) 
                    && this.pname.equals(project.pname);
        }
        return super.equals(obj);
	}
}
