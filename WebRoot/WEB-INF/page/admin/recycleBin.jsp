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
		<!-- 头部 -->
		<div id="header">
			<c:import url="header.jsp"></c:import>
		</div>
		<!-- 左侧菜单和主体内容 -->
		<div class="grid-1-7" style="flex: 1;margin:0;">
			<!-- 左侧菜单 -->
			<div class="menu">
				<c:import url="menu.jsp"></c:import>
			</div>
			<!-- 面包屑导航和主体内容 -->
			<div class="content">
				<!--面包屑导航-->
				<!--面包屑导航-->
				<div class="content-header">
					<div class="breadcrumb">
						<span>文章管理</span>
						<span class="divider">/</span>
						<span class="active">回收站</span>
					</div>
				</div>
				<!--全部主体内容-->
				<div class="list-content">
					<!--块元素-->
					<div class="block">
						<!--页面有多个表格时，可以用于标识表格-->
						<h2>回收站</h2>
						<!--右上角的返回按钮-->
						<a href="javascript:history.back();">
							<button class="button wathet" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
						</a>
						
						<!--正文内容-->
						<div class="main-20">
							<!--表格上方的搜索操作-->
							<div style="text-align:right;margin-bottom:10px;">
								<!-- 标题检索 -->
								<input type="text" class="text" id="title" value="" placeholder="检索标题" />
								<!-- 点击查询按钮 -->
								<button class="button blue" style="margin-top: -3px;" onclick="search()"><span class="icon-search"></span></button>
							</div>
							
							<!--表格上方的操作元素，添加、删除等-->
							<div class="operation-wrap">
								<div class="buttons-wrap">
									
									<button id="recovery" class="button blue"><span class="icon-plus"></span> 还原</button>
									<button id="delete" class="button red"><span class="icon-minus"></span> 彻底删除</button>
								</div>
							</div>
							<table id="table" class="table color2">
								<thead>
									<tr>
										<th><input type="checkbox" class="fill listen-1"/> </th>
										<th>标题</th>
										<th>创建时间</th>
										<th>删除时间</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${articleRecycleList}" var="entity" varStatus="status" >
										<tr>
											<td><input type="checkbox" name="id" class="fill listen-1-2" value="${entity.id}"/> </td>
											<td>${entity.title}</td>
											<td>${entity.creatDate}</td>
											<td>${entity.updateDate}</td>	
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!--块元素-->
					<div class="block">
						<!--修饰块元素名称-->
						<div class="banner">
							<p class="tab fixed">块元素<span class="hint">block</span></p>
						</div>
						<!--正文内容-->
						<div class="main-20">
							内容
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script>
		javaex.menu({
			id : "menu",
			isAutoSelected:true
		});
			var idArr=new Array();
		$("#delete").click(function(){
			
			idArr=[];
			$(':checkbox[name="id"]:checked').each(function(){
				var id=$(this).val();
				if(id!="on")
					idArr.push(id);
				
			});
			if(idArr.length>0){
				if(javaexVerify()){
					console.log(idArr)
					$.ajax({
						url : "${pageContext.request.contextPath }/admin/articleDelete.json",
						type : "POST",
						dataType : "json",
						traditional:true,
						data : {
							"idArr":idArr,
						},
						success : function(rtn) {
							javaex.optTip({content:"操作成功!"});
							setTimeout(function(){location.reload();},1000);
									
					
						},
						error : function(rtn) {
					
						}
						
					});
					
				}
			
			
			}
			
			else
				location.reload();
			
		})
		
		
		$("#recovery").click(function(){
			
			idArr=[];
			$(':checkbox[name="id"]:checked').each(function(){
				var id=$(this).val();
				if(id!="on")
					idArr.push(id);
				
			});
			if(idArr.length>0){
				if(javaexVerify()){
					console.log(idArr)
					$.ajax({
						url : "${pageContext.request.contextPath }/admin/articleRecovery.json",
						type : "POST",
						dataType : "json",
						traditional:true,
						data : {
							"idArr":idArr,
						},
						success : function(rtn) {
							javaex.optTip({content:rtn.message});
							setTimeout(function(){location.reload();},1000);
									
					
						},
						error : function(rtn) {
					
						}
						
					});
					
				}
			
			
			}
			
			else
				location.reload();
			
		})
	</script>
	
	
</html>