<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="dto.Tests" %>   
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
  
<link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/common.css">
</head>
<body id="index-top">

 <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">
    
<!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

  <!-- メインコンテンツ -->
  <main>
    <!-- プロフィールカード -->
    <div>
      <div>
        <span>ユーザー</span>
        <span id="username"><strong>${user.name}</strong> さん</span>
      </div>
    </div>

    <!-- 各種メニューカード -->
    <div>
      <!-- 点数行 -->
      <div>
        <span>score</span>
        <a href="StuScoreMenuServlet?user_id=${myUsers.user_id}">
          <button type="button">点数確認</button>
        </a>
      </div>
      
      <!-- 個人情報行 -->
      <div>
        <span>profile</span>
        <a href="UpdateUsersServlet?user_id=${myUsers.user_id}">
          <button type="button">個人情報変更</button>
        </a>
      </div>

      <!-- 日記行 -->
      <div>
        <span>dialog</span>
        <a href="SelectDialogsServlet?user_id=${myUsers.user_id}">
          <button type="button">日記を見る</button>
        </a>
      </div>
    </div>
  </main>
</div>
  <!-- フッター -->

<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>
