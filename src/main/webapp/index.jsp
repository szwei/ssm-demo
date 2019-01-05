<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--
        web 路径
        不以/开头的相对路径，找资源，会以当前资源的路径为基准，经常出问题
        以/开头的相对路径，找资源，会以服务器路径为基准，不会出问题
     -->
    <!-- 引入jQuery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <!-- 引入样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 修改员工模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static">email@example.com</p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="empEmail_update_input"
                                   placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" id="emp_update_btu">更新</button>
            </div>
        </div>
    </div>
</div>


<!-- 添加员工模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="empEmail_add_input"
                                   placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" id="emp_save_btu">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-3 col-md-push-9">
            <button class="btn btn-warning" id="to_dept_btn">部门管理</button>
        </div>
        <div class="col-md-9 col-md-pull-3">
            <button class="btn btn-primary" id="add_emp_modal_btn">新增</button>
            <button class="btn btn-danger" id="delete_emp_all_btu">批量删除</button>
        </div>
    </div>
    <!-- 表格显示内容 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 分页显示信息 -->
    <div class="row">
        <!-- 显示分页文字信息 -->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!-- 显示分页条信息 -->
        <div class="col-md-4 col-md-offset-2" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord, currentPage;
    // 1. 页面加载成功之后直接发送 ajax 请求得到 分页数据
    //页面加载完成之后，直接发送ajax 请求，去首页
    $(function () {
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //console.log(result);
                // 1. 解析并显示员工数据
                build_emp_table(result);
                // 2. 解析并显示分类信息
                buid_page_info(result);
                // 3. 解析并显示分页条信息
                build_page_nav(result);
            }
        });
    }

    //解析显示员工信息
    function build_emp_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        var i = result.extend.pageInfo.startRow;
        $.each(emps, function (index, item) {
            //alert(item.empName);
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var numTd = $("<td></td>").append(i++);
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);

            var editBtu = $("<button></button>").addClass("btn btn-info btn-sm edit_btu")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前的员工id
            editBtu.attr("edit-id", item.empId);
            var delBtu = $("<button></button>").addClass("btn btn-danger btn-sm delete_btu")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            //为删除按钮添加一个自定义的属性，来表示当前的员工id
            delBtu.attr("delete-id", item.empId);
            var btuTd = $("<td></td>").append(editBtu).append(" ").append(delBtu);
            //append方法执行完后仍返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(numTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btuTd)
                .appendTo("#emps_table tbody");
        })
    }

    //解析显示分页信息
    function buid_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前页:" + result.extend.pageInfo.pageNum +
            ", 共有页:" + result.extend.pageInfo.pages +
            ", 总记录数：" + result.extend.pageInfo.total);
        totalRecord = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析显示分页条信息
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            prePageLi.addClass("disabled");
        } else {
            //添加单击事件
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
        } else {
            //添加单击事件
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        //添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            //添加每一个遍历出来的页码
            if (item == result.extend.pageInfo.pageNum) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加最后一页和末页
        ul.append(nextPageLi).append(lastPageLi);
        //把 ul 添加到 navElv 中去
        var navElv = $("<nav></nav>").append(ul);

        navElv.appendTo("#page_nav_area");
    }

    //点击新增按钮弹出模态框
    $("#add_emp_modal_btn").click(function () {
        //初始化模态框
        //也可以这么做
        //$("#empAddModal")[0].reset();
        initEmpAddModal("#empName_add_input");
        initEmpAddModal("#empEmail_add_input");
        //发送ajax 请求，查出部门信息，显示下拉列表
        getDepts("#empAddModal select");

        //弹出模态框
        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    //初始化模态框，每次加载清空里面的数据
    function initEmpAddModal(ele) {
        $(ele).val("");
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
    }

    //查询所有的部门信息并显示在下拉列表中
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                //console.log(result);
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    //用户名表单校验
    function validate_add_form_empName() {
        //1. 拿到要验证的数据，使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            //alert("用户名可以是2-5位中文或者是6-16位英文和数字的组合");
            show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者是6-16位英文和数字的组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        return true;
    }

    //邮箱表单校验
    function validate_add_form_empEmail() {
        //1. 拿到要验证的数据，使用正则表达式

        var email = $("#empEmail_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //alert("邮箱不合法.......");
            show_validate_msg("#empEmail_add_input", "error", "邮箱不合法");
            return false;
        } else {
            show_validate_msg("#empEmail_add_input", "success", "可以使用");
        }
        return true;
    }

    //显示校验的提示信息
    function show_validate_msg(ele, status, msg) {
        //每次弹出模态框之前，清空里面的内容
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if (status == "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //检验用户名是否合法
    $("#empName_add_input").change(function () {
        var empName = this.value;
        //表单用户名前台校验
        if (validate_add_form_empName()) {

            //发送ajax请求，校验用户名是否可用
            $.ajax({
                url: "${APP_PATH}/checkuser",
                type: "POST",
                data: "empName=" + empName,
                success: function (result) {
                    if (result.code == 100) {
                        show_validate_msg("#empName_add_input", "success", "用户名可用");
                        $("#emp_save_btu").attr("ajax_validate", "success");
                    } else {
                        show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                        $("#emp_save_btu").attr("ajax_validate", "error");
                    }
                }
            });
        } else {
            return false;
        }
    });

    //检验邮箱是否合法
    $("#empEmail_add_input").change(function () {
        if (!validate_add_form_empEmail()) {
            $("#emp_save_btu").attr("ajax_validate2", "error");
            return false;
        }
        ;
        $("#emp_save_btu").attr("ajax_validate2", "success");
    });

    //点击保存事件
    $("#emp_save_btu").click(function () {
        //1.模态框中的表单数据提交给数据库进行保存
        //2.发送ajax请求保存员工数据
        //alert($("#empAddModal form").serialize());

        //1.判断之前的用户名校验是否成功，否则就不往下走
        if ($(this).attr("ajax_validate") == "error") {
            return false;
        }
        //2.判断之前的邮箱校验是否成功，否则就不往下走
        if ($(this).attr("ajax_validate2") == "error") {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    //alert(result.msg);
                    //员工保存成功
                    //1.关闭模态框
                    $("#empAddModal").modal('hide');
                    //2.跳转到最后一页
                    to_page(totalRecord);
                } else {
                    //显示错误信息
                    console.log(result);
                    if (undefined != result.extend.errorsFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorsFields.empName);
                    }
                    //alert(result.extend.errorsFields.email);
                    if (undefined != result.extend.errorsFields.email) {
                        show_validate_msg("#empEmail_add_input", "error", result.extend.errorsFields.email);
                    }
                }
            }
        });
    });

    //为编辑按钮绑定事件
    $(document).on("click", ".edit_btu", function () {
        //alert("edit");

        //1.查出部门信息，显示部门信息
        getDepts("#empUpdateModal select");
        //2.查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        //3.把员工的id传递给模态框的更新按钮
        $("#emp_update_btu").attr("edit-id", $(this).attr("edit-id"));
        //弹出模态框
        //初始化
        initEmpAddModal("#empName_update_input");
        initEmpAddModal("#empEmail_update_input");
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    //获取员工信息
    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#empEmail_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });

    }

    //点击更新，更新员工信息
    $("#emp_update_btu").click(function () {
        //验证邮箱是否合法
        var email = $("#empEmail_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#empEmail_update_input", "error", "邮箱不合法");
            return false;
        } else {

            //发送ajax请求，更新员工信息

            $.ajax({
                url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#empUpdateModal form").serialize(),
                success: function (result) {
                    //alert(result.msg);
                    if (result.code == 100) {
                        //1.关闭模态框
                        $("#empUpdateModal").modal('hide');
                        //2.回到当前页面
                        to_page(currentPage);
                    } else {
                        //显示错误信息
                        console.log(result);
                        if (undefined != result.extend.errorsFields.email) {
                            show_validate_msg("#empEmail_update_input", "error", result.extend.errorsFields.email);
                        }
                    }
                }
            });
        }
    });

    //为删除按钮绑定单击事件
    $(document).on("click", ".delete_btu", function () {
        //1.弹出是否确认删除对话框
        //获取empName的方法，获取到他的所有的父元素，找到tr,然后再在tr中找到第一个td,获取到第一个td的值
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        //alert(empName);
        if (confirm("确认删除【" + empName + "】吗？")) {
            //确认，发送ajax请求，删除
            $.ajax({
                url: "${APP_PATH}/emp/" + $(this).attr("delete-id"),
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到当前页
                    to_page(currentPage);
                }
            });
        }
    });

    //完成全选/全不选功能
    $("#check_all").click(function () {
        //prop修改和读取原生dom属性的值
        //attr获取自定义属性的值
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //单个的选择框全选，顶上的也选择
    $(document).on("click", ".check_item", function () {
        //判断当前选中的元素是否是全部的元素
        var flag = ($(".check_item:checked").length == $(".check_item").length)
        $("#check_all").prop("checked", flag);

    });

    //为多选删除框绑定单击事件
    $("#delete_emp_all_btu").click(function () {
        var empNames = "";
        var delidstr = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            delidstr += $(this).parents("tr").find("td:eq(2)").text() + "-";
        });
        //alert(delidstr);
        //去除empNames多余的，
        empNames = empNames.substring(0, empNames.length - 1);
        //去除delidstr的多余的-
        delidstr = delidstr.substring(0, delidstr.length - 1);
        if (confirm("确认删除【" + empNames + "】吗？")) {
            //发送ajax请求并删除
            $.ajax({
                url: "${APP_PATH}/emp/" + delidstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    $("#to_dept_btn").click(function () {
        window.open('${APP_PATH}/dept/toDeptPage','_self');
    });
</script>
</body>
</html>