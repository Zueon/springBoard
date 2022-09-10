<%--
  Created by IntelliJ IDEA.
  User: jueon
  Date: 9/7/22
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<%@include file="/WEB-INF/views/include/head.jsp" %>

<body>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="container-fluid">
    <%@include file="/WEB-INF/views/include/sidebar.jsp" %>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <h2>Section title</h2>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">BNO</th>
                    <th scope="col">Title</th>
                    <%--                    <th scope="col">Content</th>--%>
                    <th scope="col">Writer</th>
                    <th scope="col">regDate</th>
                    <th scope="col">updateDate</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="board">
                    <tr>
                        <td><c:out value="${board.bno}"/></td>
                        <td><a href='/board/get?bno=<c:out value="${board.bno}"/> '>
                            <c:out value="${board.title}"/></a>
                        </td>

                            <%--                        <td><c:out value="${board.content}"/></td>--%>
                        <td><c:out value="${board.writer}"/></td>
                        <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageMarker.prev}">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageMarker.startPage}" end="${pageMarker.endPage}">
                        <li class="page-item"><a class="page-link" href="#">${num}</a></li>
                    </c:forEach>
                    <c:if test="${pageMarker.next}">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <div class="modal" tabindex="-1" role="dialog"
                 id="modal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header border-bottom-0">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body py-0">
                            처리가 완료되었습니다.
                        </div>
                        <div class="modal-footer flex-column border-top-0">
                            <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2">Save changes</button>
                            <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal">Close
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<%@include file="/WEB-INF/views/include/scriptTag.jsp" %>
</body>


</html>