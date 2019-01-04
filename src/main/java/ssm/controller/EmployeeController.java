package ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import ssm.bean.Employee;
import ssm.bean.Msg;
import ssm.service.EmployeeService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD 请求
 * @author szw
 *
 */
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 删除单个员工,批量删除员工
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			
			employeeService.deleteBatch(del_ids);
		}else {
			employeeService.deleteEmp(Integer.parseInt(ids));
		}
		return Msg.success();
	}
	
	/**
	 * 更新员工信息
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			//检验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorsFields", map);
		}else {
			employeeService.updateEmp(employee);
			return Msg.success();
		}
		
	}
	
	//ajax 请求通过id获取员工信息
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName") String empName) {
		//当前端判断失效的情况下，后端校验才会发挥作用
		//先判断用户名是否是合法的表达式
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "后台校验：用户名可以是2-5位中文或者是6-16位英文和数字的组合");
		}
		
		//数据库用户名重复校验
		boolean b = employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名已存在");
		}
	}
	
	
	/**
	 * 员工数据保存
	 * 1.支持JSR303校验
	 * 2.导入Hibernate-Validator
	 * 3.后台检验，防止不合法数据传入
	 * 
	 * @return
	 */
	@RequestMapping(value="/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmps(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			//检验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorsFields", map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
	
	
	/**
	 * 需要导入 JackSon 包
	 * @param pn
	 * @return
	 */
	@RequestMapping(value="/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn) {
		// 引入 PageHelper 分页插件
		/**
		 * 在查询之前只需要调用，传入要显示的页码，以及每页显示的数量 startPage 后紧跟的查询就是分页查询
		 */
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getALL();
		// 使用pageinfo 包装查询之后的结果，我们只需要把pageInfo交给页面就好了
		// 封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的数据
		PageInfo page = new PageInfo(emps, 5);

		return Msg.success().add("pageInfo", page);
		
	}
	
	
	/*@RequestMapping(value="/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,
			Model model) {
		//引入 PageHelper 分页插件
		*//**
		 * 在查询之前只需要调用，传入要显示的页码，以及每页显示的数量
		 * startPage 后紧跟的查询就是分页查询
		 *//*
		PageHelper.startPage(pn,5);
		List<Employee> emps = employeeService.getALL();
		//使用pageinfo 包装查询之后的结果，我们只需要把pageInfo交给页面就好了
		//封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的数据
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}*/
}
