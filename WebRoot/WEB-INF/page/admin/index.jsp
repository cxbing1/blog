<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="wrap">
				<!--头部-->
		<div id="header">
			<c:import url="header.jsp"></c:import>
		</div>
		
		<!-- 左侧菜单和主体内容 -->
		<div class="grid-1-7" style="flex: 1;margin:0;">
			<!-- 左侧菜单 -->
			<div class="menu">
			<c:import url="menu.jsp"></c:import>
			</div>
			
			
			
		</div>
		
	</div>
</body>
	<script>
		javaex.menu({
			id : "menu",
			isAutoSelected:true
		});
	</script>
</html>