package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.bean.Department;
import ssm.dao.DepartmentMapper;
import ssm.service.DepartmentService;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	/**
	 * 查询所有部门
	 * @return
	 */
	@Override
	public List<Department> getDepts(){
		return departmentMapper.selectByExample(null);
	}
}
