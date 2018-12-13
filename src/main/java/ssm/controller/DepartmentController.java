package ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Department;
import ssm.bean.Msg;
import ssm.service.DepartmentService;

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;

	/**
	 * 返回所有部门信息
	 * @return
	 */
	@RequestMapping(value="/depts")
	@ResponseBody
	public Msg getDepts() {
		List<Department> list = departmentService.getDepts();
		return Msg.success().add("depts",list).add("legend", "部门信息");
	}
	

}
