<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 事案報告</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/common.css">
</head>
<body id="index-top">

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<div class="layout">
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>


<main class="main">
    <div>
        <p>事案報告</p>

        <form action="${pageContext.request.contextPath}/InsertTroubleServlet" method="post">

            <label>件名</label>
            <input type="text" name="title"><br>

            <label>事案内容</label><br>
            <textarea name="contents"></textarea><br>

            <label>関係者</label>
            <input type="text" name="members"><br>

            <input type="submit" value="保存">

        </form>
    </div>
</main>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
 </body>

</html>