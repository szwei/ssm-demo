import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.bean.Employee;
import ssm.dao.DepartmentMapper;
import ssm.dao.EmployeeMapper;
import ssm.mapper.DepartmentMapperExt;
import ssm.mapper.EmployeeMapperExt;

import java.util.UUID;
/*
 *
 * 测试 Dao 层的工作
 * @author szw
 *推荐： Spring 的项目就可以使用Spring的单元测试，可以自动的注入我们需要的组件
 * 1. 导入Spring Test 模块
 * 2. @ContextConfiguration，指定Spring配置文件的位置
 * 3. 直接 AutuWire 要使用的组件
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ssm/applicationContext.xml"})
public class MapperTest {

    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession SqlSession;
    @Autowired
    private EmployeeMapperExt employeeMapperExt;
    @Autowired
    private DepartmentMapperExt departmentMapperExt;

    /*
     *
     * 测试 DepartmentMapper
     */
    @Test
    public void testCRUD() {
        //传统方法
        // 1.创建 SpringIOC 容器
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:ssm/applicationContext.xml");
        // 2.从容器中获取mapper
      /*  DepartmentMapper bean = context.getBean(DepartmentMapper.class);

        System.out.println(bean);*/

    /*    System.out.println(departmentMapper);*/

        //1.插入部门
//        departmentMapper.insertSelective(new Department(null, "开发部", null));
//        departmentMapper.insertSelective(new Department(null, "财务部", null));

        //2.生成员工数据，插入员工信息

//        employeeMapper.insertSelective(new Employee(null, "Tom", "M", "Tom@qq.com", 1));

        //3.批量插入员工数据，使用可以批量操作的SqlSession
        EmployeeMapper employeeMapper = SqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 600; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
            if(i %2 ==0) {
                employeeMapper.insertSelective(new Employee(null, uuid, "M", uuid + "@qq.com", 1));
                departmentMapperExt.addDeptNum("1");
            }else{
                employeeMapper.insertSelective(new Employee(null, uuid, "W", uuid + "@qq.com", 2));
                departmentMapperExt.addDeptNum("2");
            }
        }
        System.out.println("批量插入完成");

//		int n = employeeMapper.updateByPrimaryKey(new Employee(3,  "Tom", "M", "Tom@qq.com", 1));
//        List<Employee> list = employeeMapperExt.selectByExampleWithDept(null);
//        for (Employee employee : list) {
//            System.out.println(employee.getEmpName());
//        }


//        List<Department> departments = departmentMapper.selectByExample(null);
//        for (Department department : departments) {
//            System.out.println(department.getDeptNum());
//        }


        //3.批量插入部门数据，使用可以批量操作的SqlSession
//        DepartmentMapper departmentMapper2 = SqlSession.getMapper(DepartmentMapper.class);
//        Random rand = new Random();
//        for (int i = 0; i < 20; i++) {
//            String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
//            departmentMapper2.insertSelective(new Department(null, uuid, rand.nextInt(100) + 1 + ""));
//        }
//        System.out.println("批量插入完成");
    }

    /**
     * 测试增加部门员工数量
     */
    @Test
    public void testAddDeptNum(){
        int i = departmentMapperExt.reduceDeptNum("1");
    }
}
