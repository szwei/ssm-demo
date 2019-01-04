package ssm.mapper;

import ssm.dao.DepartmentMapper;

/**
 * @Author: szwei
 * @date : 2019/1/2 21:22
 */
public interface DepartmentMapperExt extends DepartmentMapper {

    /**
     * 部门数量+1
     * @param deptId
     * @return
     */
    int addDeptNum(String deptId);

    /**
     * 部门数量-1
     * @param deptId
     * @return
     */
    int reduceDeptNum(String deptId);

}
