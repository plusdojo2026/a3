<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 事案詳細</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mT.css">
</head>
<body id="index-top">
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<div class="layout">
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>
<main class="main">
  <div>
    <p>事案詳細</p>
    <div>
      <p>${trouble.situation}</p>
    </div>
  </div>

  <label>件名</label>
  <input type="text" value="${trouble.title}" readonly><br>

  <label>事案内容</label>
  <input type="text" value="${trouble.contents}" readonly><br>

  <label>関係者</label>
  <input type="text" value="${trouble.members}" readonly><br>

  <input type="radio" id="ok" name="confirm">
  <label for="ok">確認しました</label><br>

  <a href="SelectIncidentMenuServlet">一覧へ戻る</a>
</main>
 </div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>

</html>