<%--
  Created by IntelliJ IDEA.
  User: jueon
  Date: 9/7/22
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/register" method="post">
    <input type="text" name="title">
    <input type="text" name="content">
    <input type="text" name="writer">
    <input type="submit">
</form>
</body>
</html>
