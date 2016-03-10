
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="vuserinfo" value="${userinfo}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<title>嘉实基金网上交易</title>

<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${ctx}/static/styles/public.css?t=20150703" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/key.css" rel="stylesheet" type="text/css"></link>
<script src="${ctx}/static/js/commom.js?t=20150429" type="text/javascript"></script>
<script src="${ctx}/static/js/login_ctl.js" type="text/javascript"></script>
<script src="${ctx}/static/js/buyfundinfo.js" type="text/javascript"></script>
<script src="${ctx}/static/js/nav.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/static/js/notice_index.js?t=20150429"></script>
</head>

<body>

<%@ include file="/WEB-INF/layouts/header.jsp"%>

<!--ad-->
<div id="full-screen-slider">
	<ul id="slides">
		<c:choose>
			<c:when test="${empty adlist}">
				<li style="background:url(${ctx}/static/images/srcoll01.jpg) no-repeat center top" title="嘉实基金"></li>
				<li style="background:url(${ctx}/static/images/srcoll03.jpg) no-repeat center top" title="嘉实基金" 
				onclick="javascript:window.open('${ctx}/jsp/rate.jsp', '_blank')"></li>
			</c:when>
			<c:otherwise>
				<c:forEach items="${adlist}" var="ad">
						<li style="background:url(${ad.IMG_URL}) no-repeat center top" title="${ad.IMG_DESC}" 
						<c:if test="${not empty ad.IMG_LINK}">onclick="javascript:window.open('${ctx}${ad.IMG_LINK}', '_blank')"</c:if> > </li>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<!--ad-->


<!--notice-->
<div class="notice">
	<div class="main">
		<!--left-->
		<div class="left">
			<img src="${ctx}/static/images/voice.gif" class="left mar_top1" />
			<ul id="marquee" class="left">
			    <li> 
			    	<c:choose>
			    		<c:when test="${empty noticelist}">
			    			无公告信息
			    		</c:when>
			    		<c:otherwise>
				    		<c:forEach items="${noticelist}" var="notice">
					    		<a href='${ctx}/notice/getnoticejspdetail?metaId=${notice.META_ID}' title='${notice.TITLE}'>${notice.TITLE}<span class="mar_left1">${notice.RELEASE_TIME}</span></a>
					    	</c:forEach>
			    		</c:otherwise>
			    	</c:choose>
			    </li>
			</ul>
		</div>
	  	<!--left-->
	  	<!--right-->
	  	<span class="more_a_v2"><a href="${ctx}/notice/allNoticeQuery"> 更多&gt;&gt;</a></span>
	  	<!--right-->
	</div>
</div>
<!--notice-->


<!--content-->
<div class="main">
	<!--block1-->
	<div class="index_block">
		<div class="recommend_pro">
			<div class="title">我们推荐给您的基金产品</div>
			
			<c:forEach items="${fundlist}" var="fund" varStatus="status">
				<a href="javascript:void(0);" onclick="loginctl('func==buyfund(\'${fund.fundcode}\')'); return false;" class="pro_block" <c:if test="${status.index gt 1}">style="margin-right:0px;"</c:if>>
					<c:if test="${fund.fundtypename eq '货币基金'}">
						<img src="${ctx}/static/images/huobi.png" class="type" />
					</c:if>
					<c:if test="${fund.fundtypename eq '混合基金'}"> 
						<img src="${ctx}/static/images/hunhe.png" class="type" />
					</c:if>
					<c:if test="${fund.fundtypename eq '指数基金'}"> 
						<img src="${ctx}/static/images/zhishu.png" class="type" />
					</c:if>
					<c:if test="${fund.fundtypename eq '债券基金'}">
			      		<img src="${ctx}/static/images/zhaiquan.png" class="type" />
			      	</c:if>
			      	<c:if test="${fund.fundtypename eq '股票基金'}">
			      		<img src="${ctx}/static/images/gupiao.png" class="type" />
			      	</c:if>
			      	<c:if test="${fund.fundtypename eq 'QDII基金'}">
			      		<img src="${ctx}/static/images/QDII.png" class="type" />
			      	</c:if>
			      	<c:if test="${fund.fundtypename eq '理财基金'}">
			      		<img src="${ctx}/static/images/licai.png" class="type" />
			      	</c:if>
					
					<ul class="pro_date">
						<li class="pro_font1">${fund.fundname}</li>
						
						<c:choose>
							<c:when test="${fund.fundtypename eq '货币基金' || fund.fundtypename eq '理财基金'}">
								<li class="red_big"> ${fund.incomeration}% </li>
								<li class="pro_font2">七日年化收益率</li>
							</c:when>
							<c:otherwise>
								<li class="red_big"> ${fund.sincethisyear}% </li>
								<li class="pro_font2">今年以来收益率</li>
							</c:otherwise>
						</c:choose>
						
						<li class="pro_font1 mar_top2">
							<c:set var="features" value="${fn:split(fund.feature,',')}"></c:set>
							<c:forEach items="${features}" var="feature" varStatus="status">
								<c:if test="${status.index gt 0}">
									<span class="mar_left2">
								</c:if>
								${feature}
								<c:if test="${status.index gt 0}">
									</span>
								</c:if>
							</c:forEach>
						</li>
						
						<li>
							<dl class="advantage">
								<c:set var="propertys" value="${fn:split(fund.property,',')}"></c:set>
								<c:forEach items="${propertys}" var="property" varStatus="status">
									<dd <c:if test="${status.index eq 0}"> class="left0"</c:if>>${property}</dd>
								</c:forEach>
							</dl>
						</li>
					</ul>
				</a>
			</c:forEach>
		</div>
	
		<!--paihangbang-->
		<div class="charts">
			<div class="title">大家都在买</div>
			<div class="charts_block">
				<!--tab-->
				<div class="tabul">
					<ul id="myTab1">
						<li id="n1" onclick="nTabs(this,0);" class="active">热销排行</li>
						<li id="n2" onclick="nTabs(this,1);">定投排行</li>
					</ul>
			    </div>
			    <div id="myTab1_Content0">
				    <ul class="pro_info">
				    	<c:forEach items="${webtranlist.buy}" var="webtran" varStatus="status">
					    	<li <c:if test="${status.index gt 3 }">class="no_border"</c:if>>
					    		<span class="left">${webtran.fundname}</span><span class="right"><input name="" type="button" class="buy_but" value="购买" onclick="loginctl('func==buyfund(\'${webtran.fundcode}\')')"/></span>
					    	</li>
				    	</c:forEach>
				    </ul>
			    </div>
			    <div id="myTab1_Content1" class="hide">
				    <ul class="pro_info">
				    	<c:forEach items="${webtranlist.fixbuy}" var="webtran" varStatus="status">
					    	<li <c:if test="${status.index gt 3 }">class="no_border"</c:if>>
					    		<span class="left">${webtran.fundname}</span><span class="right"><input name="" type="button" class="buy_but" value="购买"  onclick="loginctl('func==aipbuyfund(\'${webtran.fundcode}\')')"/></span>
					    	</li>
				    	</c:forEach>
				    </ul>
			    </div>
				<!--tab-->
			</div>
	</div>
	<!--paihangbang-->
	</div>
	<!--block1-->
	
	<!--block2-->
	<div class="index_block">
		<div class="title">为您开启财富之门</div>
		<div class="plan">
			<dl>
				<dt>16年</dt>
				<dd>嘉实基金已成立16年</dd>
			</dl>
			<dl>
				<dt>300万</dt>
				<dd>在2014年，300万客户选择了嘉实</dd>
			</dl>
			<dl>
				<dt>400亿</dt>
				<dd>在2014年，嘉实已为用户带来400亿收益</dd>
			</dl>
			<div align="center">
				<img src="${ctx}/static/images/step.gif" class="ver" />
				<c:choose>
					<c:when test="${empty vuserinfo}">
						<input name="" type="button" class="plan_but" onclick="javascript:window.location.href='${ctx}/custom/customopenurl?handleflag=openAcco'"/>
					</c:when>
					<c:otherwise>
						<input name="" type="button" class="plan_but" onclick="javascript:window.location.href='${ctx}/trade/jsexclude_fundsupermarket'"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!--block2-->
	
	<!--block3-->
	<c:if test="${empty vuserinfo}">
		<div class="index_block">
			<div class="title">合作渠道激活/查询入口</div>
			<ul class="channel">
				<li><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel01.gif" title="您在京东购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
				<li><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel02.gif" title="您在淘宝购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
				<li><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel03.gif" title="您在百度金融购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
				<li><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel04.gif" title="您在银行渠道购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
				<li><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel05.gif" title="您在证券渠道购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
				<li style="border-right:none;"><a href="${ctx}/custom/customopenurl?handleflag=openAcco"><img src="${ctx}/static/images/channel06.gif" title="您在其他渠道购买过嘉实基金产品，但未在嘉实网上交易平台登录，您可以激活并查询您的交易情况" /></a></li>
			</ul>
		</div>
	</c:if>
	<!--block3-->
	
</div>
<!--content-->


<!--youshi-->
<div class="main">
	<div class="title">砥砺奋进，创造回报</div>
</div>
<div class="youshi">
	<div class="main">
		<dl class="youshi_dl1">
			<dt><img src="${ctx}/static/images/pinpai.gif" /></dt>
			<dd>“远见者稳进”是嘉实核心管理思想的浓缩，是嘉实发展的写照，也是嘉实对未来的自我希骥。</dd>
		</dl>
		<dl class="youshi_dl1 youshi_dl2">
			<dt><img src="${ctx}/static/images/zili.gif" /></dt>
			<dd>创建于1999年，拥有证券投资基金设立与管理、全国社保基金投资、企业年金投资、保险资金投资、境外证券投资管理业务和特定客户资产管理业务资格。</dd>
		</dl>
		<dl class="youshi_dl1">
			<dt><img src="${ctx}/static/images/youshi.gif" /></dt>
			<dd>坚守“研究驱动投资”的投资理念，基本面研究与数量研究相结合，为客户实现资产的长期稳定增值。</dd>
		</dl>
		<dl class="youshi_dl1 youshi_dl2">
			<dt><img src="${ctx}/static/images/anquan.gif" /></dt>
			<dd>在线交易系统全程加密，强大的数据中心保障客户顺畅交易。</dd>
		</dl>
	</div>
</div>
<!--youshi-->
 <form action="" id="pubForm" method="post"></form>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</body>
</html>
