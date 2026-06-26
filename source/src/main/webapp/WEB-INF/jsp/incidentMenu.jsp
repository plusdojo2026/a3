<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 事案一覧</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mT.css">
</head>
<body id="index-top">
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<div class="layout">
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>



  <!--コンテンツ-->
  <main class="main">
  
    <p>事案一覧</p>
    <!--事案内容-->
    <c:forEach var="trouble" items="${trouble}">
    <div>
        <form action="SelectIncidentServlet" method="get">

            <input type="hidden"
                   name="trouble_id"
                   value="${trouble.trouble_id}">

            <button type="submit">
                <p>${trouble.tr_date}</p>
                <p>件名：${trouble.title}</p>
                <p>関係者：${trouble.user_id}</p>
                <p>${trouble.situation}</p>
            </button>

        </form>
        
    </div>
</c:forEach>

  </main>
  </div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>

</html>