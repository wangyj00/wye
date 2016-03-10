<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="vuserinfo" value="${userinfo}" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>user</title>
</head>
<body>
<table align="center">
<c:choose>
	<c:when test="${empty userinfo}">
		<tr>
			<td>名字：</td>
			<td>暂无</td>
		</tr>
		<tr>
			<td>登录手机号：</td>
			<td>暂无</td>
		</tr>
	</c:when>
	<c:otherwise>
	<tr>
			<td>名字：</td>
			<td>${userinfo.customername}</td>
		</tr>
		<tr>
			<td>登录手机号：</td>
			<td>${userinfo.loginmobile}</td>
		</tr>
	</c:otherwise>
</c:choose>


</table>
</body>
</html>