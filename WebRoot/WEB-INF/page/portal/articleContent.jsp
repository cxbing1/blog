<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details</title>
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
<style>

.imgadapt{

width:600px;

height:400px;
height:auto;
margin:0 auto;

border:1px solid white;

}

.imgadapt img{width:100%;height:100%;}

</style>

<div class="ibody">
  <header>
    <h1>文章详情</h1>
    <h2>影子是一个会撒谎的精灵，它在虚空中流浪和等待被发现之间;在存在与不存在之间....</h2>
    <div class="logo"><a href="/"></a></div>
   <nav id="topnav"><a href="index.action">首页</a><a href="aboutMe.action">关于我</a><a href="articleList.action">文章列表</a></nav>
  </header>
 <article>
    <h2 class="about_h">您现在的位置是：<a href="index.action">首页</a><a href="#">文章详情</a></h2>
    <div class="index_about">
      <h2 class="c_titile">${atQueryVo.article.title}</h2>
      <p class="box_c"><span class="d_time">发布时间：${atQueryVo.article.creatTime}</span><span>编辑：程玄彬</span><span>分类【${atQueryVo.type.name}】</span><span>浏览（${atQueryVo.article.viewCount}）</span></p>
      <ul class="infos">
      
    
      ${atQueryVo.article.content}
     
      
      	
      </ul>
      <div class="keybq">
        <p><span>关键字词</span>：黑色,个人博客,时间轴,响应式</p>
      </div>
      <div class="nextinfo">
        <p>上一篇：<a href="#">程序员应该如何高效的工作学习</a></p>
        <p>下一篇：<a href="#">柴米油盐的生活才是真实</a></p>
      </div>
      <div class="otherlink">
        <h2>相关文章</h2>
        <ul>
        	<c:forEach items="${articleByView}" var="entity" varStatus="status"  end="5">
	      			<li><a href="articleContent.action?id=${entity.article.id }" title="${entity.article.title}">${entity.article.title}</a></li>
      		</c:forEach>
          
        </ul>
      </div>
    </div>
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
        <li><a href="#">计算机科学就是有关计算机的，天文学就是有关望远镜的</a></li>
        <li><a href="#">励志人生-要做一个潇洒的programmer</a></li>
        <li><a href="#">真实是人生的命脉，是一切价值的根基</a></li>
        <li><a href="#">真理惟一可靠的标准就是永远自相符合。</a></li>
        <li><a href="#">世界上一成不变的东西只有真理</a></li>
        <li><a href="#">劳动和人，人和劳动，这是所有真理的父母亲</a></li>
        <li><a href="#">人生必有风险，所以引人入胜亦在于此</a></li>
        <li><a href="#">持续不断地劳动是人生的铁律，也是艺术的铁律</a></li>
        <li><a href="#">剽悍的人生不需要解释</a></li>
        <li><a href="#">物理是宇宙的操作系统</a></li>
      </ul>
      
    </div>
    
    <div class="links">
     
     
    <div class="copyright">
      <ul>
        <p> Design by <a href="#">DanceSmile</a></p>
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
