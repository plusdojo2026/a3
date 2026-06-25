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
  <title>Class Care - 事案詳細</title>
  <link rel="stylesheet" href="/css/common.css">
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
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>