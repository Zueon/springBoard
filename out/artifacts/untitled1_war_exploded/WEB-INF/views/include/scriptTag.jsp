
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
<script src="/resources/js/dashboard.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var result = '<c:out value="${result}"/> ';
        checkModal(result);
        history.replaceState({}, null, null);
        function checkModal(result) {
            if (result == '' || history.state) {
                return;
            }
            if (parseInt(result) >0 ){
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            }
            $("#modal").modal("show");
        }
    });
</script>