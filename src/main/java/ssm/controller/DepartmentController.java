package ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import ssm.bean.Department;
import ssm.bean.Employee;
import ssm.bean.Msg;
import ssm.service.DepartmentService;

import javax.validation.Valid;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 返回所有部门信息
     *
     * @return
     */
    @RequestMapping(value = "/depts")
    @ResponseBody
    public Msg getDepts() {
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("depts", list).add("legend", "部门信息");
    }

    /**
     * 返回所有部门信息分页
     *
     * @return
     */
    @RequestMapping(value = "/dept/getAll")
    @ResponseBody
    public Msg getPageDepts(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Department> list = departmentService.getDepts();
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 跳转到部门管理页面
     *
     * @return
     */
    @RequestMapping(value = "/dept/toDeptPage")
    public String toDeptPage() {
        return "deptlist";
    }


    //ajax 请求通过id获取部门信息
    @ResponseBody
    @RequestMapping(value = "/dept/{id}", method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id) {
        Department dept = departmentService.getDept(id);
        return Msg.success().add("dept", dept);
    }

    /**
     * 部门数据保存
     *
     * @param department
     * @return
     */
    @RequestMapping(value = "/dept", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmps(@Valid Department department) {
        departmentService.saveDept(department);
        return Msg.success();
    }


}
