<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.Tests" %>   
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
</head>
<body　id="index-top">
<div>
  <!-- ロゴ写真 -->
  <span><img></span>

</div>
<header>
    <!-- ここからテンプレート -->
    <div>
      <!-- ロゴ写真 -->
      <span><img></span>

    </div>
    <c:if test="${empty sessionScope.user}">
    <nav>
    	<form action = "${pageContext.request.contextPath}/LoginServlet">
      		<button type="submit">ログイン</button>
      	</form>
    </nav>
    </c:if>
   <c:if test="${not empty sessionScope.user}">
   	<nav>
      <button type="button">ようこそ${sessionScope.user.name}さん</button>
      
      <form action = "${pageContext.request.contextPath}/SigninServlet">
      	<button type = "submit">サインイン（新規作成）</button>
      </form>
      <form action = "${pageContext.request.contextPath}/LoginServlet">
      	<button type="submit">ログアウト</button>
      </form>
    </nav>
    </c:if>
    <!-- テンプレート終了 -->
  </header>



<!-- 左側サイドナビ -->
<!-- 左側サイドナビ -->
<aside>
  <nav>
    <ul>
      <li>
        <a href="InsertClassesServlet">生徒</a>
        <ul>
          <li><a href="SelectMypageServlet"> 生徒管理</a></li>
          <li><a href="SelectMypageServlet"> 点数管理</a></li>
          <li><a href="SelectDiaryServlet?dialog_id=${user.user_id}"> 日記</a></li>
        </ul>
      </li>
      <li><a href="UpdateStuScoreServlet">成績</a></li>
      <ul>
        <li><a href="SelectStuScoreServlet?score_id=${user.user_id}">得点</a></li>
        <li><a href="MTResultServlet">心理テスト</a></li>
      </ul>
      <li><a href="">報告</a></li>
      <ul>
        <li><a href="InsertTroubleServlet">事案</a></li>
        <li><a href="SelectMTServlet">心理テスト</a></li>
      </ul>
      <li><a href="jsp/Support.jsp">海外支援</a></li>
    </ul>
  </nav>
</aside>
<!--メインコンテンツ-->
<main>
  <div>
    <!-- 生徒の写真が入る枠 -->
    <span>img</span>
  </div>
  <div>
    
    <span id="username">${user.name}</span>さん

  </div>

  <!-- 点数 -->
  <div>
    <span>score</span>
    <button type="button"><a href="SelectStuScoreServlet">点数</a></button>
  </div>
  <!-- 個人情報 -->
  <div>
    <span>profile</span>
    <button type="button"><a href="SelectMypageServlet">個人情報</a></button>
  </div>
  <!-- 日記 -->
  <div>
    <span>dialog</span>
    <button type="button"><a href="SelectDialogsServlet">日記</a></button>
  </div>
</main>
<!-- 一番最後に置いてください -->
<footer>
  <p>虎視眈々(株)</p>
</footer>