package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.bean.Employee;
import ssm.bean.EmployeeExample;
import ssm.bean.EmployeeExample.Criteria;
import ssm.dao.EmployeeMapper;
import ssm.mapper.EmployeeMapperExt;
import ssm.service.EmployeeService;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private EmployeeMapperExt employeeMapperExt;
	
	/**
	 * 显示员工列表
	 * @return
	 */
	@Override
	public List<Employee> getALL() {
		return employeeMapperExt.selectByExampleWithDept(null);
	}

	/**
	 * 员工保存
	 * @param employee
	 */
	@Override
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
			
	}

	/**
	 * 校验用户名是否可用
	 * @param empName count==0 可用，否则不可用
	 * @return
	 */
	@Override
	public boolean checkUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 
	 * 按照员工id查询
	 * @param id
	 * @return
	 */
	@Override
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapperExt.selectByPrimaryKeyWithDept(id);
		return employee;
	}

	/**
	 * 员工更新
	 * @param employee
	 */
	@Override
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 删除单个员工
	 * @param id
	 */
	@Override
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}

	/**
	 * 批量删除员工
	 * @param ids
	 */
	@Override
	public void deleteBatch(List<Integer> ids) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where id in(ids)
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}
	
	
}
