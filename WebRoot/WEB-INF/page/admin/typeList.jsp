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
						<span>分类管理</span>
						<span class="divider">/</span>
						<span class="active">文章分类</span>
					</div>
				</div>
				<!--全部主体内容-->
				<div class="list-content">
					<!--块元素-->
					<div class="block">
						<!--页面有多个表格时，可以用于标识表格-->
						<h2>文章分类列表</h2>
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
									<button id="add" class="button blue"><span class="icon-plus"></span> 添加</button>
									<button id="save" class="button blue"><span class="icon-check"></span> 保存</button>
									<button id="delete" class="button red"><span class="icon-minus"></span> 删除</button>
								</div>
							</div>
							<table id="table" class="table color2">
								<thead>
									<tr>
										<th><input type="checkbox" class="fill listen-1"/> </th>
										<th>排序</th>
										<th>分类名称</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${typeList}" var="entity" varStatus="status" >
										<tr>
											<td><input type="checkbox" name="id" class="fill listen-1-2" value="${entity.id}"/> </td>
											<td><input type="text" class="text" name="sort" data-type="正整数" placeholder="请输入排序" value="${entity.sort}" /></td>
											<td><input type="text" class="text" name="name" data-type="必填" placeholder="请输入分类名称" value="${entity.name}" /></td>
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
	</script>
	
	<script >
	
		var idArr= new Array();
		var sortArr= new Array();
		var nameArr= new Array();
		
		$("#add").click(function(){
			
			var html='';
			html+='<tr>';
			html+='<td><input type="checkbox" name="id" class="fill listen-1-2""/> </td>';
			html+='<td><input type="text" class="text" name="sort" data-type="正整数" placeholder="请输入排序" error-msg="请输入正整数"  /></td>';
			html+='<td><input type="text" class="text" name="name" data-type="必填" placeholder="请输入分类名称" /></td>';
			html+='</tr>';
			
			
			$("#table tbody").append(html);
			javaex.render();
			
		});
		
		
		
		$("#save").click(function(){
			idArr=[];
			sortArr=[];
			nameArr=[];
			
			$(':checkbox[name="id"]').each(function(){
				idArr.push($(this).val())
				
			});
			
			$(':text[name="sort"]').each(function(){
				sortArr.push($(this).val())
				
			})
			
			$(':text[name="name"]').each(function(){
				nameArr.push($(this).val())
				
			});
			
			

			if(javaexVerify()){
			$.ajax({
				url : "${pageContext.request.contextPath }/admin/typeSave.json",
				type : "POST",
				dataType : "json",
				traditional:true,
				data : {
					"idArr":idArr,
					"sortArr":sortArr,
					"nameArr":nameArr
				},
				success : function(rtn) {
					javaex.optTip({content:"操作成功!"});
					setTimeout(function(){location.reload();},1000);
							
			
				},
				error : function(rtn) {
			
				}
				
			});
			
			}
			
		});
		
		var idCheckArr= new Array();
		$("#delete").click(function(){
			idCheckArr=[];
			$(':checkbox[name="id"]:checked').each(function(){
				var idCheck=$(this).val();
				if(idCheck!="on")
					idCheckArr.push(idCheck);
				
			});
			if(idCheckArr.length>0){
				if(javaexVerify()){
					
					$.ajax({
						url : "${pageContext.request.contextPath }/admin/typeDelete.json",
						type : "POST",
						dataType : "json",
						traditional:true,
						data : {
							"idCheckArr":idCheckArr,
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
				
			
			
		});
		
		
	</script>
</html>