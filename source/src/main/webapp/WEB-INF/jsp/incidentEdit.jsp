<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="dto.Tests" %>   
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 事案報告</title>
</head>
<body id="index-top">
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
      <li><a href="SelectMypageServlet">生徒管理</a></li>
      <li><a href="SelectMypageServlet">点数管理</a></li>
      <li>
        <a href="SelectDiaryServlet?dialog_id=${user.user_id}">
          日記
        </a>
      </li>
    </ul>
  </li>

  <li>
    <a href="UpdateStuScoreServlet">成績</a>
    <ul>
      <li>
        <a href="SelectStuScoreServlet?score_id=${user.user_id}">
          得点
        </a>
      </li>
      <li>
        <a href="MTResultServlet">
          心理テスト
        </a>
      </li>
    </ul>
  </li>

  <li>
    <a href="#">報告</a>
    <ul>
      <li><a href="InsertTroubleServlet">事案</a></li>
      <li><a href="SelectMTServlet">心理テスト</a></li>
    </ul>
  </li>

  <li>
    <a href="jsp/Support.jsp">海外支援</a>
  </li>
	</ul>
  </nav>
</aside>
<main>
    <div>
        <p>事案報告</p>

        <form action="SelectMypageServlet" method="post">

            <label>件名</label>
            <input type="text" name="title"><br>

            <label>事案内容</label><br>
            <textarea name="contents"></textarea><br>

            <label>関係者</label>
            <input type="text" name="user_id"><br>

            <input type="submit" value="保存">

        </form>
    </div>
</main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>

</html>