<%--
  Created by IntelliJ IDEA.
  User: jueon
  Date: 9/7/22
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Company name</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse"
            data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search"
           aria-label="Search">
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="#">Sign out</a>
        </div>
    </div>
</header>

<h2>Section title</h2>
<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">BNO</th>
            <th scope="col">Title</th>
            <th scope="col">Content</th>
            <th scope="col">Writer</th>
            <th scope="col">regDate</th>
            <th scope="col">updateDate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="board">
            <tr>
                <td><c:out value="${board.bno}"/></td>
                <td><c:out value="${board.title}"/></td>
                <td><c:out value="${board.content}"/></td>
                <td><c:out value="${board.writer}"/></td>
                <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
<script src="/resources/js/dashboard.js"></script>

</body>


<%@include file="/WEB-INF/views/include/footer.jsp" %>