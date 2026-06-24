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
<!-- ログイン、サインイン -->
<div class="loginStatus">
			<c:if test="${empty user or loginStatu == false}">
				<div class="notLogin" id="notLogin">
					<a href="AddUserServlet">サインイン</a> <a href="LoginServlet">ログイン</a>
				</div>
			</c:if>
			<c:if test="${!empty user and loginStatu==true}">
				<div class="isLogin" id="isLogin">
					<p>
						ようこそ <span id="username">${user.name}</span> さん
					</p>
					<a href="/classcare/Forward?page=logout" id="logoutBtn">ログアウト</a>
				</div>
			</c:if>
		</div>



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
          <li><a href="SelectDiaryServlet"> 日記</a></li>
        </ul>
      </li>
      <li><a href="UpdateStuScoreServlet">成績</a></li>
      <ul>
        <li><a href="SelectStuScoreServlet">得点</a></li>
        <li><a href="SelectMTServlet">心理テスト</a></li>
      </ul>
      <li><a href="SelectIncidentServlet">報告</a></li>
      <ul>
        <li><a href="SelectIncidentMenuServlet">事案</a></li>
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
    <span>YAMADA TAROU</span>
    <h2>山田太郎</h2>

  </div>

  <!-- 点数 -->
  <div>
    <span>score</span>
    <button type="button"><a href="">点数</a></button>
  </div>
  <!-- 個人情報 -->
  <div>
    <span>profile</span>
    <button type="button"><a href="">個人情報</a></button>
  </div>
  <!-- 日記 -->
  <div>
    <span>dialog</span>
    <button type="button"><a href="">日記</a></button>
  </div>
</main>
<!-- 一番最後に置いてください -->
<footer>
  <p>虎視眈々(株)</p>
</footer>