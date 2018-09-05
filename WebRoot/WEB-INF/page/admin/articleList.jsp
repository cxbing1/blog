<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<span class="active">文章列表</span>
					</div>
				</div>
				<!--全部主体内容-->
				
				
					<!--块元素-->
					<div class="block">
					
						<!--页面有多个表格时，可以用于标识表格-->
						<h2>文章列表</h2>
						<!--右上角的返回按钮-->
						<a href="javascript:history.back();">
							<button class="button wathet" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
						</a>
						
						<!--正文内容-->
						<div class="main-20">
							<!--表格上方的搜索操作-->
							
									
									
							<div style="text-align:right;margin-bottom:10px;">
								<!-- 文章分类 -->
								<select id="typeId" name="typeId" class="no-shadow">
												<option value=''>请选择文章类型</option>
												<c:forEach items="${typeList}" var="type" varStatus="status">
													<option value="${type.id}" <c:if test="${param['typeId']==type.id}">selected="selected"</c:if>>${type.name}</option>
												</c:forEach>
								</select>
								<!-- 日期范围 -->
								<input type="text" id="date2" class="date" style="width: 300px;" value="" readonly/>
								<!-- 标题检索 -->
								<input type="text" class="text" id="title" value="${param['title']}" placeholder="检索标题" />
								<!-- 点击查询按钮 -->
								<button class="button blue" style="margin-top: -3px;" onclick="search()"><span class="icon-search"></span></button>
							</div>
							
							<!--表格上方的操作元素，添加、删除等-->
							<div class="operation-wrap">
								<div class="buttons-wrap">
									<a href="editArticle.action">
									<button id="add" class="button blue"><span class="icon-plus"></span> 添加</button>
									</a>
									<button id="delete" class="button red"><span class="icon-minus"></span> 删除</button>
								</div>
							</div>
							<table id="table" class="table color2">
								<thead>
									<tr>
										<th><input type="checkbox" class="fill listen-1"/> </th>
										<th>标题</th>
										<th>创建时间</th>
										<th>更新时间</th>
										<th>类型</th>
										<th>操作</th>
										
										
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(pageInfo.list)==0}">
											<tr>
												<td colspan="7" style="text-align:center">暂无记录</td>
											</tr>
										</c:when>
										
									<c:otherwise>
									<c:forEach items="${pageInfo.list}" var="entity" varStatus="status" >
									
										<tr>
											<td><input type="checkbox" name="id" class="fill listen-1-2" value="${entity.article.id}"/> </td>
											<td>${entity.article.title}</td>
											<td>${entity.article.creatDate}</td>
											<td>${entity.article.updateDate}</td>
											<td>${entity.type.name}</td>
											<td>
												<a href="editArticle.action?id=${entity.article.id}">
													<button id="edit" class="button green"><span class="icon-edit"></span>编辑 </button>
												</a>
											</td>
											
											
										</tr>
									</c:forEach>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!--分页 -->
							<div class="page">
								<ul id="page" class="pagination"></ul>
							</div>			
							
						</div>
					</div>
					<!--块元素-->
					
				</div>
			</div>
		</div>
	</div>
</body>
	<script>
	
		javaex.select({
			id:"typeId"
		});
		
		var startDate="${param['startDate']}";
		var endDate="${param['endDate']}";
		javaex.date({
			id : "date2",		// 承载日期组件的id
			monthNum : 2,	// 2代表选择范围日期
			alignment:"right",
			startDate: startDate,	// 开始日期
			endDate: endDate,		// 结束日期
			// 重新选择日期之后返回一个时间对象
			callback: function (rtn) {
				startDate=rtn.startDate;
				endDate=rtn.endDate;
			}
		});
		
		
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
						url : "${pageContext.request.contextPath }/admin/articleRecycle.json",
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
		
		var pageCount =${pageInfo.pages}
		var currentPage=${pageInfo.pageNum};
		
		
		
			javaex.page({
				id : "page",
				pageCount : pageCount,	// 总页数
				currentPage :currentPage ,// 默认选中第几页
				position : "right",
				// 返回当前选中的页数
				callback:function(rtn) {
					search(rtn.pageNum)
				}
			});
			
			
		function search(pageNum){
			
			if(pageNum==undefined)
				pageNum=1;
			
			var typeId = $("#typeId").val();
			var title = $("#title").val();
			
			location.href="${pageContext.request.contextPath }/admin/articleList.action?pageNum="+pageNum
					+"&typeId="+typeId
					+"&startDate="+startDate
					+"&endDate="+endDate
					+"&title="+title
					;
		}

		
	</script>
	
	
</html>




