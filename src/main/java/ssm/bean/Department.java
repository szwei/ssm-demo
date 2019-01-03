package ssm.bean;

public class Department {
    private Integer deptId;

    private String deptName;
    
    private String deptNum;
    
 
	public String getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(String deptNum) {
		this.deptNum = deptNum;
	}

	public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }


	public Department(Integer deptId, String deptName, String deptNum) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptNum = deptNum;
	}

	public Department() {
		super();
	}

	
    
}