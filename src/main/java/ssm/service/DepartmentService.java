package ssm.service;

import ssm.bean.Department;

import java.util.List;

/**
 * @Author: szwei
 * @date : 2019/1/2 21:00
 */
public interface DepartmentService {
    /**
     * 得到所有的部门
     * @return
     */
    List<Department> getDepts();

    /**
     * 部门员工数量+1
     * @param deptId
     * @return
     */
    boolean addDeptNum(String deptId);

    /**
     * 部门员工数量-1
     * @param deptId
     * @return
     */
    boolean reduceDeptNum(String deptId);

    /**
     * 得到部门员工数量
     * @param deptId
     * @return
     */
    String getDeptNum(String deptId);

    /**
     * 根据部门id获取部门信息
     * @param id
     * @return
     */
    Department getDept(Integer id);

    /**
     * 部门保存
     * @param department
     */
    void saveDept(Department department);

    /**
     * 部门删除
     * @param parseInt
     */
    void deleteEmp(int parseInt);

    /**
     * 部门更新
     * @param department
     */
    void updateDept(Department department);
}
