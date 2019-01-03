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
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">批量删除</button>
			</div>
		</div>
		<!-- 表格显示内容 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-striped">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Department</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.gender=="M" ? "男" : "女" }</td>
							<td>${emp.email }</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 分页显示信息 -->
		<div class="row">
			<!-- 显示分页文字信息 -->
			<div class="col-md-6">
				当前页:${pageInfo.pageNum }, 共有${pageInfo.pages }页， 总记录数：${pageInfo.total }
			</div>
			<!-- 显示分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
				    <c:if test="${pageInfo.hasPreviousPage }">
					    <li>
					      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
				    	<c:if test="${page_num == pageInfo.pageNum }">
				    		<li class="active"><a href="#">${page_num }</a></li>
				    	</c:if>
				    	<c:if test="${page_num != pageInfo.pageNum }">
				    		<li><a href="${APP_PATH}/emps?pn=${page_num }">${page_num }</a></li>
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum +1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				      <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>