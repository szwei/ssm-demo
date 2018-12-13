/*
package ssm.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import ssm.bean.Employee;

import com.github.pagehelper.PageInfo;

*/
/**
 * 使用Spring测试模块提供的测试请求,测试CRUD 的正确性
 * 使用@WebAppConfiguration注解可以@Autowire Spring 容器自己的类
 * @author szw
 *
 *//*

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:ssm/applicationContext.xml","classpath:ssm/sprinmvc.xml"})
public class MvcTest {
	//传入Spring mvc的IOC
	@Autowired
	WebApplicationContext context;
	
	//虚拟MVC请求，得到处理结果
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build(); 
	}
	
	@Test
	public void testPage() throws Exception {
		//使用perform 来模拟请求,并拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "56")).andReturn();
		
		//请求成功以后，请求域中会有 pageInfo ，我们可以取出来进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码："+pi.getPageNum());
		System.out.println("总页码："+pi.getPages());
		System.out.println("总记录数："+pi.getTotal());
		System.out.println("在页面需要连续显示的页码：");
		int[] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" "+i);
		}
		
		//获取员工数据
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println("ID :"+employee.getdId()+"===> Name:"+employee.getEmpName());;
		}
	}
	
}
*/
