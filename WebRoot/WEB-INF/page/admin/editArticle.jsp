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
				
				<div class="content-header">
					<div class="breadcrumb">
						<span>文章管理</span>
						<span class="divider">/</span>
						<span class="active">文章编辑</span>
					</div>
				</div>
				<!--全部主体内容-->
				<div class="list-content">
					<!--块元素-->
					<div class="block">
						<!--修饰块元素名称-->
						<div class="banner">
							<p class="tab fixed">文章编辑<span class="hint">Article edit</span></p>
						</div>
						<!--正文-->
						<div class="main">
							<!--表单-->
							<form id="form">
								
								<input type="hidden" name="id" value="${article.id}"/>
								<input type="hidden" name="viewCount" value="${article.viewCount}"/>
								<input type="text" style="visibility:hidden" id="contentText" name="contentText" value="${article.contentText}"/>
								<!--输入框-->
								<div class="unit">
									<div class="left">
										<p class="subtitle">标题：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</div>
									
									<input type="text" class="text" name="title" data-type="必填" value="${article.title}" placeholder="请输入标题"  />
									
									<!--清浮动-->
									<span class="clearfix"></span>
								</div>
								
								
								
								
								<!--分割线-->
								<p class="divider"></p>
								
								<!--下拉选择框-->
								<div class="unit">
									<div class="left">
										<p class="subtitle">所属分类：</p>&nbsp;&nbsp;&nbsp;
									</div>
									
										<select id="typeId" name="typeId">
											<c:forEach items="${typeList }" var="type" varStatus="status">
												<option value="${type.id}"	<c:if test="${article.typeId==type.id}">selected="selected"</c:if>>${type.name}</option>
											</c:forEach>
										</select>
											
									<!--清浮动-->
									<span class="clearfix"></span>
								</div>
								
								<!--分割线-->
								<p class="divider"></p>
								<div class="unit">
									<div class="left">
										<p class="subtitle">上传封面：</p>&nbsp;&nbsp;&nbsp;
									</div>
									<!-- 图片承载容器 -->
									<label id="container2" for="upload2" style="display: inline-block; width:132px;height:74px;">
									
										<c:choose>
											<c:when test="${empty article.cover }">
												<img src="${pageContext.request.contextPath}/static/javaex/pc/images/default.png" width="100%" height="100%" />	
											</c:when>
											<c:otherwise>
												<img src="/upload/${article.cover }" width="100%" height="100%"/>
											</c:otherwise>
										</c:choose>
										
									</label>
									<!-- 上传按钮 -->
									<input type="file" class="hide" id="upload2" accept="image/gif, image/jpeg, image/jpg, image/png" />
									
									<!--清浮动-->
									<span class="clearfix"></span>
								</div>
								<input type="hidden" id="cover" name="cover" value="${article.cover}"/>
								<!--分割线-->
								<p class="divider"></p>
								
								<!--文本域-->
								<div class="unit">
									<div class="left">
										<p class="subtitle">文章内容：</p>
									</div>
									<div class="right">
										<div id="edit"  class="edit-container" placeholder="请填写文章内容"></div>
										
									</div>
									
									
									<!--清浮动-->
									<span class="clearfix"></span>
								</div>
								<!--分割线-->
								<p class="divider"></p>
								
								<!--提交按钮-->
								<div class="unit">
									<div style="margin-left: 200px;">
										<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
										<input type="button" id="return" class="button no" value="返回" />
										<input type="button" id="submit" class="button yes" value="保存" />
									</div>
									<!--清浮动-->
									<span class="clearfix"></span>
								</div>
								
								
								<input type="text" style="display:none" id="content" name="content" value='${article.content}'/>
								
							</form>
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
	
	<script>
	
	javaex.select({
		id : "typeId",
		// 选择后的回调函数
		callback: function (rtn) {
			console.log("selectValue:" + rtn.selectValue);
			console.log("selectName:" + rtn.selectName);
		}
	});
	
	
	javaex.upload({
		type : "image",
		url : "upload.json",	// 请求路径
		id : "upload2",	// <input type="file" />的id
		param : "file",			// 参数名称，SSM中与MultipartFile的参数名保持一致
		dataType : "url",		// 返回的数据类型：base64 或 url
		callback : function (rtn) {
			// 后台返回的数据
			
			if (rtn.code=="000000") {
				$("#container2 img").attr("src", "/upload/"+rtn.data.imgUrl);
				$("#cover").val(rtn.data.imgUrl)
			} else {
				javaex.optTip({
					content : rtn.message,
					type : "error"
				});
			}
		}
	})
	
	
	
	
	javaex.edit({
		id : "edit",
			image : {
				url : "upload.json",	// 请求路径
				param : "file",		// 参数名称，SSM中与MultipartFile的参数名保持一致
				dataType : "url",	// 返回的数据类型：base64 或 url
				rtn : "rtnData",	// 后台返回的数据对象，在前面页面用该名字存储
				imgUrl : "data.imgUrl",	// 根据返回的数据对象，获取图片地址。  例如后台返回的数据为：{code: "000000", message: "操作成功！", data: {imgUrl: "1.jpg"}}
				prefix : "/upload/"
			},
			content : '${article.content}',	// 这里必须是单引号，因为html代码中都是双引号，会产生冲突
			callback : function(rtn) {
				
				console.log(rtn.html);
				$("#content").val(rtn.html);
				$("#contentText").val(rtn.text.substring(0,200));
			}
	
		
	});
	
	
	$("#return").click(function(){
		history.back();
		
	});
	
	$("#submit").click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/articleSave.json",
			type : "POST",
			dataType : "json",
			data : $("#form").serialize(),
				
			
			success : function(rtn) {
				console.log(rtn);
					if(rtn.code=="000000"){
						javaex.optTip({content:rtn.message});
						setTimeout(function(){location.href="${pageContext.request.contextPath }/admin/articleList.action";},1000);
					}else{
						javaex.optTip({context:rtn.message,type:"error"});
					}
			}
		})
	})
	
	
</script>
	
	
</html>