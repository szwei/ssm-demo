package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.bean.Department;
import ssm.dao.DepartmentMapper;
import ssm.mapper.DepartmentMapperExt;
import ssm.service.DepartmentService;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private DepartmentMapperExt departmentMapperExt;
	
	/**
	 * 查询所有部门
	 * @return
	 */
	@Override
	public List<Department> getDepts(){
		return departmentMapper.selectByExample(null);
	}

	@Override
	public boolean addDeptNum(String deptId) {
        int i = departmentMapperExt.addDeptNum(deptId);
        if(i > 0){
            return true;
        }else{
            return false;
        }
	}

    @Override
    public boolean reduceDeptNum(String deptId) {
        int i = departmentMapperExt.reduceDeptNum(deptId);
        if(i > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public String getDeptNum(String deptId) {
        Department department = departmentMapper.selectByPrimaryKey(Integer.parseInt(deptId));
        return department.getDeptNum();
    }

    @Override
    public Department getDept(Integer deptId) {
        Department department = departmentMapper.selectByPrimaryKey(deptId);
        return department;
    }

    @Override
    public void saveDept(Department department) {
	    if(department.getDeptId() == null || "".equals(department.getDeptId())) {
            //添加新部门,设置部门员工数量为0
            department.setDeptNum("0");
            departmentMapper.insertSelective(department);
        }else {
	        departmentMapper.updateByPrimaryKeySelective(department);
        }
    }

}
