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

            <form action="/board/modify" method="post">
                <div class="form-signin w-100 m-auto">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="title" class="form-label">BNO</label>
                            <input type="text" class="form-control" id="bno" name="bno"
                                   value='<c:out value="${board.bno}" />' readonly>

                        </div>
                        <div class="col-12">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" class="form-control" id="title" name="title"
                                   value='<c:out value="${board.title}" />'>

                        </div>

                        <div class="col-12">
                            <label for="floatingTextarea2" class="form-label">Content</label>

                            <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a content here" id="floatingTextarea2"
                                  style="height: 100px" name="content"><c:out
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


                    <button class=" btn btn-secondary btn-lg" data-oper="modify" type="submit"> MODIFY</button>
                    <button class=" btn btn-secondary btn-lg" data-oper="remove" type="submit"> REMOVE</button>
                    <button class="btn btn-primary btn-lg" data-oper="list" type="submit">
                        LIST
                    </button>
                </div>
            </form>
        </div>

    </main>
</div>


<%@include file="/WEB-INF/views/include/scriptTag.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form");
        $("button").on("click", function (e){
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);

            if (operation === 'remove') {
                formObj.attr("action", "/board/remove");

            }else if (operation === 'list'){
                formObj.attr("action", "/board/list").attr("method", "get");
                formObj.empty();

            }
            formObj.submit();
        });
    });
</script>

</body>

</html>
