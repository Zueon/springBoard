<%--
  Created by IntelliJ IDEA.
  User: jueon
  Date: 9/7/22
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@include file="/WEB-INF/views/include/head.jsp" %>


<body>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="container-fluid">
    <%@include file="/WEB-INF/views/include/sidebar.jsp" %>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

        <div class="py-5 text-center">
            <h2>Board Read Page</h2>
        </div>

        <div class="row g-5">

            <div class="form-signin w-100 m-auto">
                <div class="row g-3">
                    <div class="col-12">
                        <label for="title" class="form-label">BNO</label>
                        <input type="text" class="form-control" name="bno"
                               value='<c:out value="${board.bno}" />' readonly>

                    </div>
                    <div class="col-12">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title"
                               value='<c:out value="${board.title}" />' readonly>

                    </div>

                    <div class="col-12">
                        <label for="floatingTextarea2" class="form-label">Content</label>

                        <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a content here" id="floatingTextarea2"
                                  style="height: 100px" name="content" readonly><c:out
                                value="${board.content}"/> </textarea>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="writer" class="form-label">Writer</label>
                        <input type="text" class="form-control" id="writer" name="writer"
                               value='<c:out value="${board.writer}" />' readonly>
                    </div>

                </div>

                <br>

                <button class=" btn btn-secondary btn-lg" data-oper="modify"> MODIFY
                </button>
                <button class="btn btn-primary btn-lg" data-oper="list">
                    LIST
                </button>

                <form id="operForm" action="/board/modify" method="get">
                    <input type="hidden"  name="bno" value='<c:out value="${board.bno}" />'>
                    <input type="hidden"  name="pageNum" value='<c:out value="${criteria.pageNum}" />'>
                    <input type="hidden"  name="amount" value='<c:out value="${criteria.amount}" />'>
                </form>
            </div>
        </div>
    </main>
</div>


<%@include file="/WEB-INF/views/include/scriptTag.jsp" %>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        var operForm = $("#operForm");
        $("button[data-oper = 'modify']").on("click", () => {
            operForm.attr("action", "/board/modify").submit();
        });

        $("button[data-oper = 'list']").on("click", () => {
            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list").submit();
        });
    });
</script>

</html>
