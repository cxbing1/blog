<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ArticleList</title>
<meta name="keywords" content="个人博客模板,博客模板,响应式" />
<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。" />
<link href="/Blog/static/portal/css/base.css" rel="stylesheet">
<link href="/Blog/static/portal/css/style.css" rel="stylesheet">
<link href="/Blog/static/portal/css/media.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<div class="ibody">
  <header>
    <h1>文章列表</h1>
    <h2>影子是一个会撒谎的精灵，它在虚空中流浪和等待被发现之间;在存在与不存在之间....</h2>
    <div class="logo"><a href="/"></a></div>
    <nav id="topnav"><a href="index.action">首页</a><a href="aboutMe.action">关于我</a><a href="articleList.action">文章列表</a>
  </header>
  <article>
  
   
  
    <h2 class="about_h">您现在的位置是：<a href="index.action">首页</a>><a href="articleList.action">文章列表</a>><a><c:forEach items="${typeList }" var="type" varStatus="status"><c:if test="${type.id==param['typeId']}">${type.name}</c:if> </c:forEach> </a></h2>
   
    
    <div class="bloglist">
    
     <c:forEach items="${pageInfo.list}" var="entity" varStatus="status" >
		<div class="newblog">
        <ul>
         <h3><a href="articleContent.action?id=${entity.article.id}">${entity.article.title}</a></h3>
          <div class="autor"><span>作者：程玄彬</span><span>分类：[<a href="articleList.action?typeId=${entity.type.id}">${entity.type.name}</a>]</span><span>浏览（${entity.article.viewCount}）</span><span>评论（<a href="#">30</a>）</span></div>
          <p> ${entity.article.contentText}<a href="articleContent.action?id=${entity.article.id}" class="readmore">全文</a></p>
        </ul>
        <figure><img src="/upload/${entity.article.cover}" ></figure>
        <div class="dateview">${entity.article.date}</div>
      </div>
	</c:forEach>
	
    </div>
    	<!-- 分页的实现 -->
    	<c:if test="${pageInfo.pages>1}">
    		<div class="page">
	    	<a title="Total record"><b>${pageInfo.pages}</b></a>
	    	<a href="articleList.action?typeId=${typeId}&pageNum=1">首页</a>

	    	<c:forEach  begin="1" end="${pageInfo.pages}" varStatus="page">
		    	<c:choose>
		    		<c:when test="${page.index==pageInfo.pageNum}"><b>${page.index}</b>
		    		</c:when>
		    		<c:otherwise>
		    		<a href="articleList.action?typeId=${param['typeId']}&pageNum=${page.index}">${page.index}</a>
		    	</c:otherwise>
		    	</c:choose>
	    	</c:forEach>
	    	<a href="articleList.action?typeId=${param['typeId']}&pageNum=${pageInfo.pages}">末页</a>
	   		 </div>
    	</c:if>
   		 
     
   
    
    
     
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="#">日记</a></li>
      <li class="rnav2 "><a href="#">欣赏</a></li>
      <li class="rnav3 "><a href="#">程序人生</a></li>
      <li class="rnav4 "><a href="#">经典语录</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
      <c:forEach items="${articleByView}" var="entity" varStatus="status"  end="8">
      		<c:choose>
      			<c:when test="${status.index<3 }">
      				<li><span class="num1">${status.index+1}</span><a href="articleContent.action?id=${entity.article.id }">${entity.article.title}</a></li>
      			</c:when>
      			<c:otherwise>
      				<li><span>${status.index+1}</span><a href="articleContent.action?id=${entity.article.id }">${entity.article.title}</a></li>
      			</c:otherwise>
      		</c:choose>
      		
      </c:forEach>
      	
      </ul>
      <h2>
        <p>人生格言</p>
      </h2>
      <ul>
        <li><a href="#">计算机科学就是有关计算机的，正如天文学就是有关望远镜的</a></li>
        <li><a href="#">励志人生-要做一个潇洒的programmer</a></li>
        <li><a href="#">真实是人生的命脉，是一切价值的根基</a></li>
        <li><a href="#">真理惟一可靠的标准就是永远自相符合。</a></li>
        <li><a href="#">世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理</a></li>
        <li><a href="#">劳动和人，人和劳动，这是所有真理的父母亲</a></li>
        <li><a href="#">人生必有风险，所以引人入胜亦在于此</a></li>
        <li><a href="#">持续不断地劳动是人生的铁律，也是艺术的铁律</a></li>
        <li><a href="#">剽悍的人生不需要解释</a></li>
        <li><a href="#">物理是宇宙的操作系统</a></li>
      </ul>
      <h2>
        
    </div>
    
    
    <div class="copyright">
      <ul>
        <p> Design by <a href="#">XuanBin</a></p>
        <p>我的博客</p>
        </p>
      </ul>
    </div>
  </aside>
  <script src="/Blog/static/portal/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
