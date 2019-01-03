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
}
