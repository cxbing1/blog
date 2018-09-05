<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div id="menu" class="menu" style="width: 260px;">
		<div class="menu-title">
			<h1><i>菜单</i></h1>
		</div>
		<ul>
			<li class="menu-item">
				<a href="javascript:;"><span>分类管理</span><i class="my-icon menu-more"></i></a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/typeList.action"><span>文章分类</span></a></li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:;"><span>文章管理</span><i class="my-icon menu-more"></i></a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/articleList.action"><span>文章列表</span></a></li>
					<li><a href="${pageContext.request.contextPath }/admin/recycleBin.action"><span>回收站</span></a></li>
				</ul>
			</li>
		</ul>
	</div>