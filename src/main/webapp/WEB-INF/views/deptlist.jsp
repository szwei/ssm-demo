<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
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

<!-- 修改部门模态框 -->
<div class="modal fade" id="deptUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">部门修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">部门编号</label>
						<div class="col-sm-10">
							<p class="form-control-static" id="deptId_update_static"></p>
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="deptName" id="deptName_update_input">
							<span class="help-block"></span>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				<button type="button" class="btn btn-primary" id="dept_update_btu">更新</button>
			</div>
		</div>
	</div>
</div>


<!-- 添加员工模态框 -->
<div class="modal fade" id="deptAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">部门添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">部门名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="deptName" id="deptName_add_input"
								   placeholder="部门名称">
							<span class="help-block"></span>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				<button type="button" class="btn btn-primary" id="dept_save_btu">保存</button>
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
				<button class="btn btn-warning" id="to_emp_btn">员工管理</button>
			</div>
			<div class="col-md-9 col-md-pull-3">
				<button class="btn btn-primary" id="add_dept_modal_btn">新增</button>
			</div>
		</div>
		<!-- 表格显示内容 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-striped" id="depts_table">
					<thead>
					<tr>
						<th>#</th>
						<th>部门编号</th>
						<th>部门名称</th>
						<th>员工数量</th>
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
            url: "${APP_PATH}/dept/getAll",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
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
        $("#depts_table tbody").empty();
        var depts = result.extend.pageInfo.list;
        var i = result.extend.pageInfo.startRow;
        $.each(depts, function (index, item) {
            //alert(item.empName);
            var numTd = $("<td></td>").append(i++);
            var deptIdTd = $("<td></td>").append(item.deptId);
            var deptNameTd = $("<td></td>").append(item.deptName);
            var deptNumTd = $("<td></td>").append(item.deptNum);

            var editBtu = $("<button></button>").addClass("btn btn-info btn-sm edit_btu")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前的员工id
            editBtu.attr("edit-id", item.deptId);
            var delBtu = $("<button></button>").addClass("btn btn-danger btn-sm delete_btu")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            //为删除按钮添加一个自定义的属性，来表示当前的员工id
            delBtu.attr("delete-id", item.deptId);
            var btuTd = $("<td></td>").append(editBtu).append(" ").append(delBtu);
            //append方法执行完后仍返回原来的元素
            $("<tr></tr>").append(numTd)
                .append(deptIdTd)
                .append(deptNameTd)
                .append(deptNumTd)
                .append(btuTd)
                .appendTo("#depts_table tbody");
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
    $("#add_dept_modal_btn").click(function () {
        //初始化模态框
        //也可以这么做
        //$("#empAddModal")[0].reset();
        initEmpAddModal("#deptName_add_input");
        //弹出模态框
        $("#deptAddModal").modal({
            backdrop: "static"
        });
    });

    //初始化模态框，每次加载清空里面的数据
    function initEmpAddModal(ele) {
        $(ele).val("");
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
    }


    //为删除按钮绑定单击事件
    $(document).on("click", ".delete_btu", function () {
        //1.弹出是否确认删除对话框
        //获取empName的方法，获取到他的所有的父元素，找到tr,然后再在tr中找到第一个td,获取到第一个td的值
        var deptName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【" + deptName + "】吗？")) {
            //确认，发送ajax请求，删除
            $.ajax({
                url: "${APP_PATH}/dept/" + $(this).attr("delete-id"),
                type: "DELETE",
                success: function (result) {
                    if(result.code == 200){
                        alert("该部门员工数量不为空，不可删除！");
                    }else{
                        alert(result.msg);
                    }
                    //回到当前页
                    to_page(currentPage);
                }
            });
        }
    });

    //为编辑按钮绑定事件
    $(document).on("click", ".edit_btu", function () {
        //alert("edit");

        //2.查出员工信息，显示员工信息
        getDept($(this).attr("edit-id"));
        //3.把员工的id传递给模态框的更新按钮
        $("#dept_update_btu").attr("edit-id", $(this).attr("edit-id"));
        //弹出模态框
        //初始化
        initEmpAddModal("#deptName_update_input");
        $("#deptUpdateModal").modal({
            backdrop: "static"
        });
    });
    //获取员工信息
    function getDept(id) {
        $.ajax({
            url: "${APP_PATH}/dept/" + id,
            type: "GET",
            success: function (result) {
               // console.log(result);
                var deptData = result.extend.dept;
                $("#deptId_update_static").text(deptData.deptId);
                $("#deptName_update_input").val(deptData.deptName);
            }
        });

    }

    $("#to_emp_btn").click(function () {
        window.open('${APP_PATH}/index.jsp','_self');
    });

    //点击保存事件
    $("#dept_save_btu").click(function () {
        $.ajax({
            url: "${APP_PATH}/dept",
            type: "POST",
            data: $("#deptAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    alert(result.msg);
                    //员工保存成功
                    //1.关闭模态框
                    $("#deptAddModal").modal('hide');
                    //2.跳转到最后一页
                    to_page(totalRecord);
                } else {
                    //显示错误信息
                    console.log(result);
                }
            }
        });
    });

    //点击更新，更新员工信息
    $("#dept_update_btu").click(function () {
            //发送ajax请求，更新员工信息
            $.ajax({
                url: "${APP_PATH}/dept/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#deptUpdateModal form").serialize(),
                success: function (result) {
                    //alert(result.msg);
                    if (result.code == 100) {
                        //1.关闭模态框
                        $("#deptUpdateModal").modal('hide');
                        //2.回到当前页面
                        to_page(currentPage);
                    }
                }
            });
    });

</script>
</body>
</html>