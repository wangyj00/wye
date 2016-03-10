<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%response.setStatus(200);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>error</title>
<link href="${ctx}/static/styles/error.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon" />
<link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/evaluating.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/error.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/layer/skin/layer.css" type="text/css" rel="stylesheet" />
<c:choose>
<c:when test="${userinfo.sysName == 'tjboc'}">
<link href="${ctx}/static/styles/bocpension/public.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/bocpension/key.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/styles/bocpension/index.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/bocpension/login.css" type="text/css" rel="stylesheet" />
</c:when>
<c:otherwise>
<link href="${ctx}/static/styles/public.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/key.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/styles/index.css" type="text/css" rel="stylesheet" />
</c:otherwise>
</c:choose>
</head>
<body>
<div class="container">
<!--location-->
<!--location-->
<div class="deal_content mar_top2 pad0_v2">

<dl class="pastdue">
<dt><img src="${ctx}/static/images/timeout3_v2.gif" /></dt>
<dd class="error_fontv2">${errormessage }</dd>
</dl>
<table border="0" cellspacing="0" cellpadding="0" class="main_auto clear">
  <tr>
    <td>
    	  <div class="mar_top2" id = "errURLNeedId">
              
              <c:if test="${errURLNeed=='N'}">
                  <c:choose>
                		<c:when test="${account.sysname=='tjboc'}">
                		<div class="but">
               				<div class="gray_left"></div>
                			<div class="gray_middle" ><a href="${ctx}/bocpension/">返回登录页面</a></div>
                			<div class="gray_right"></div>
                        </div>
                		</c:when>
                		<c:otherwise>
                		
                			<div class="gray_middle" ><a href="${ctx}/">返回登录页面</a></div>
                			
                		</c:otherwise>
        	       </c:choose>
              </c:if>
              <c:if test="${errURLNeed=='Y'}">
              <div class="but">
              <div class="gray_left"></div>
                <div class="gray_middle" ><a href="${ctx}${userinfo.custInfo.firstPageURL}">返回首页</a></div>
                <div class="gray_right"></div>
                </div>
              </c:if>
              
              </div>
    </td>
  </tr>
</table>
<div align="right" class="redfont mar_top2"><strong>客服热线：400-600-8800</strong>&nbsp;&nbsp;&nbsp;&nbsp;</div>
<input type = "hidden" value = "${errURLNeed}" id = "errURLNeed"/>
<!-- 登陆类型 -->
<input type = "hidden" value = "${custtype}" id = "custtype"/>
<input type = "hidden" id = "${ctx}"/>
</div>
</div>
</body>
</html>