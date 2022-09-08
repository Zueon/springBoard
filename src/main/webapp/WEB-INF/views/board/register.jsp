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
            <h2>Register form</h2>
            <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form
                group has
                a validation state that can be triggered by attempting to submit the form without completing it.</p>
        </div>

        <div class="row g-5">

            <div class="form-signin w-100 m-auto">
                <form class="needs-validation" action="/board/register" method="post">
                    <div class="row g-3">

                        <div class="col-12">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" class="form-control" id="title" name="title">

                        </div>

                        <div class="col-12">
                            <label for="floatingTextarea2" class="form-label">Content</label>

                            <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a content here" id="floatingTextarea2"
                                  style="height: 100px" name="content"></textarea>
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="writer" class="form-label">Writer</label>
                            <input type="text" class="form-control" id="writer" name="writer">
                        </div>

                    </div>

                    <br>
                    <button class="w-100 btn btn-primary btn-lg" type="submit">REGISTER</button>
                </form>
            </div>
        </div>
    </main>
</div>


<%--<form action="/board/register" method="post">--%>
<%--    <input type="text" name="title">--%>
<%--    <input type="text" name="content">--%>
<%--    <input type="text" name="writer">--%>
<%--    <input type="submit">--%>
<%--</form>--%>
<%@include file="/WEB-INF/views/include/scriptTag.jsp" %>

</body>

</html>
