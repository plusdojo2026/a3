<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
  
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

  
 <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">
    
<!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

  <!-- メインコンテンツエリア -->
  <main>
    <!-- 生徒情報ヘッダーカード -->
    <div>
     <h2>${myUsers.name} さんの点数</h2>
     
      <div>
        <span>img</span>
        <span id="username"><strong>${user.name}</strong> </span>
      </div>
    </div>

    

  </main>

</div>
<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
