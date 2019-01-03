package ssm.service;

import ssm.bean.Employee;

import java.util.List;

/**
 * @Author: szwei
 * @date : 2019/1/2 20:59
 */
public interface EmployeeService {
    /**
     * 得到所有列表
     * @return
     */
    List<Employee> getALL();

    /**
     * 保存
     * @param employee
     */
    void saveEmp(Employee employee);

    /**
     * 检查用户名是否合法
     * @param empName
     * @return
     */
    boolean checkUser(String empName);

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    Employee getEmp(Integer id);

    /**
     * 更新
     * @param employee
     */
    void updateEmp(Employee employee);

    /**
     * 删除
     * @param id
     */
    void deleteEmp(Integer id);

    /**
     * 批量删除
     * @param ids
     */
    void deleteBatch(List<Integer> ids);
}
