<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<meta name="keywords" content="个人博客模板,博客模板,响应式" />
<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。" />
<link href="/Blog/static/portal/css/base.css" rel="stylesheet">
<link href="/Blog/static/portal/css/index.css" rel="stylesheet">
<link href="/Blog/static/portal/css/media.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<!--[if lt IE 9]-->
<script src="/Blog/static/portal/js/modernizr.js"></script>
<!--[endif]-->
</head>
<body>
<div class="ibody">
  <header>
    <h1>程玄彬的个人博客</h1>
    <h2>影子是一个会撒谎的精灵，它在虚空中流浪和等待被发现之间;在存在与不存在之间....</h2>
   <!-- <div class="logo"><a href="/"></a></div> --> 
    <nav id="topnav"><a href="${pageContext.request.contextPath }/portal/index.action">首页</a><a href="${pageContext.request.contextPath }/portal/aboutMe.action">关于我</a><a href="${pageContext.request.contextPath }/portal/articleList.action">文章列表</a></nav>
  </header>
  <article>
    <div class="banner">
      <ul class="texts">
        <p>The best life is use of willing attitude, a happy-go-lucky life. </p>
        <p>最好的生活是用心甘情愿的态度，过随遇而安的生活。</p>
      </ul>
    </div>
    <div class="bloglist">
      <h2>
        <p><span>推荐</span>文章</p>
      </h2>
      
      <c:forEach items="${atQueryVoList}" var="entity" varStatus="status" end="4">
		<div class="blogs">
	        <h3><a href="${pageContext.request.contextPath }/portal/articleContent.action?id=${entity.article.id}">${entity.article.title}</a></h3>
	        <figure><img src="/upload/${entity.article.cover}" ></figure>
	        <ul>
	          <p>${entity.article.contentText}</p>
	          <a href="${pageContext.request.contextPath }/portal/articleContent.action?id=${entity.article.id}" class="readmore">阅读全文&gt;&gt;</a>
	        </ul>
	        <p class="autor"><span>作者：程玄彬</span><span>分类：【<a href="${pageContext.request.contextPath }/portal/articleList.action?typeId=${entity.type.id}">${entity.type.name}</a>】</span><span>浏览（<a href="#">${entity.article.viewCount}</a>）</span><span>评论（<a href="#">30</a>）</span></p>
	        <div class="dateview">${entity.article.date}</div>
     	 </div>			
	</c:forEach>
      
       
      
     
    </div>
  </article>
  <aside>
    <div class="avatar"><a href="${pageContext.request.contextPath }/portal/aboutMe.action"><span>关于程玄彬</span></a></div>
    <div class="topspaceinfo">
      <h1>程玄彬的个人博客</h1>
      <p>于千万行代码之中，我遇到了想遇到的bug....</p>
    </div>
    <div class="about_c">
      <p>网名：玄冰寒城</p>
      <p>职业：学生 </p>
      <p>籍贯：江西省—婺源县</p>
      <p>电话：15871491302</p>
      <p>邮箱：xuanbin2019@163.com</p>
    </div>
    
    <div class="tj_news">
      <h2>
        <p class="tj_t1">最新文章</p>
      </h2>
      <ul> 
      <c:forEach items="${atQueryVoList}" var="entity" varStatus="status"  end="8">
      	<li><a href="${pageContext.request.contextPath }/portal/articleContent.action?id=${entity.article.id }">${entity.article.title}</a></li>
      </c:forEach>
        
      </ul>
      <h2>
        <p class="tj_t2">文章分类</p>
      </h2>
      <ul>
      	
       	<c:forEach items="${typeList}" var="entity" varStatus="status" end="8" >
      		<li><a href="${pageContext.request.contextPath }/portal/articleList.action?typeId=${entity.id}">【${entity.name}】</a></li>
      	</c:forEach>
       
      </ul>
    </div>
    <div class="links">
      <h2>
        <p>友情链接</p>
      </h2>
      <ul>
        <li><a href="#">程玄彬个人博客</a></li>
        <li><a href="https://github.com/cxbing1">技术社区</a></li>
      </ul>
    </div>
    <div class="copyright">
      <ul>
        <p> Design by <a href="#">XuanBin</a></p>
        <p><a href="${pageContext.request.contextPath }/admin/index.action">后台管理</a></p>
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