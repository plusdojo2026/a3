<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Get:MTResultServlet -->
<!-- Post:mTScoreMenu -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>心理テスト一覧</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

<!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">
  
    <!-- ===== sidebar ===== -->
 
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

    <!-- ===== main ===== -->
   <main class="main">

    <h2 class="page-title">心理テスト一覧</h2>

    <div class="card">

        <form action="MTResultServlet" method="post">

            <c:forEach var="date" items="${dateSet}">
                <div class="list__item">
                    <button class="btn btn-green"
                            name="date"
                            value="${date}">
                        ${date}心理テスト
                    </button>
                </div>
            </c:forEach>

        </form>

    </div>

</main>


</div>

<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>