package ssm.mapper;

import ssm.bean.Employee;
import ssm.bean.EmployeeExample;
import ssm.dao.EmployeeMapper;

import java.util.List;

/**
 * @Author: szwei
 * @date : 2019/1/2 21:15
 */
public interface EmployeeMapperExt extends EmployeeMapper {

    /**
     * 在查询的时候把部门信息查询出来
     * @param example
     * @return
     */
    List<Employee> selectByExampleWithDept(EmployeeExample example);

    Employee selectByPrimaryKeyWithDept(Integer empId);
}
