<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
  
  <style>
  /* =====================================
     ★ 基本リセット（必須・安全版）
  ===================================== */
  *, *::before, *::after { box-sizing: border-box; }
  body, h1, h2, h3, h4, h5, p, ul, li { margin: 0; padding: 0; }
  ul { list-style: none; }
  a { text-decoration: none; color: inherit; }
  img { max-width: 100%; display: block; }
  button { font: inherit; }

  /* =====================================
     ★ 全体設定
  ===================================== */
  body {
    font-family: sans-serif;
    background-color: #f5f7f7;
    color: #333;
  }

  /* =====================================
     ★ レイアウト（header / aside / main）
  ===================================== */
  header, main, footer {
    max-width: 1200px;
    margin: 0 auto;
  }
  aside {
    float: left;
    width: 200px;
    background: #e6f2f2;
    padding: 20px 10px;
    min-height: 100vh;
  }
  main {
    margin-left: 220px;
    padding: 20px 30px;
  }
  footer {
    clear: both;
  }

  /* =====================================
     ★ header
  ===================================== */
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
  }
  header img { height: 40px; }
  header nav { display: flex; gap: 15px; }
  header button {
    background: none;
    border: none;
    border-bottom: 2px solid #2aa198;
    padding: 5px 10px;
    cursor: pointer;
  }

  /* =====================================
     ★ サイドバー
  ===================================== */
  aside > nav > ul > li { margin-bottom: 20px; }
  aside > nav > ul > li > a {
    display: block;
    font-size: 18px;
    font-weight: bold;
    color: #2aa198;
    margin-bottom: 8px;
  }
  aside ul ul li a {
    display: block;
    padding: 6px 10px;
    margin-bottom: 5px;
    border-radius: 6px;
    color: #333;
    border: 1px solid #2aa198;
  }
  aside ul ul li a:hover {
    background: #2aa198;
    color: #fff;
  }

  /* =====================================
     ★ main タイトル
  ===================================== */
  main h2 { font-size: 22px; margin-bottom: 15px; }

  /* =====================================
     ★ カード（超重要）
  ===================================== */
  main > div {
    background: #f7f1f3;
    border: 1px solid #e8ccd5;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
  }
  main > .no-card {
    background: none;
    border: none;
    padding: 0;
  }

  /* =====================================
     ★ 一覧（行レイアウト）
  ===================================== */
  main > div > div {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 0;
  }

  /* =====================================
     ★ 入力欄 / ボタン
  ===================================== */
  input[type="text"] {
    padding: 8px 12px;
    border-radius: 20px;
    border: 1px solid #2aa198;
    width: 250px;
  }
  button {
    padding: 6px 14px;
    border-radius: 20px;
    border: none;
    cursor: pointer;
  }
  button[type="submit"], button[type="button"] {
    background-color: #44c2a8;
    color: #fff;
  }
  .btn-delete {
    background-color: #e9a6b5;
    color: #fff;
  }
  main p { margin: 6px 0; }

  /* =====================================
     ★ フッター
  ===================================== */
  footer {
    text-align: center;
    padding: 10px;
    font-size: 12px;
    color: #999;
  }
  </style>
</head>

<body>

  <!-- ヘッダーエリア -->
  <header>
    <div>
      <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
    </div>
    
    <c:if test="${empty sessionScope.user}">
      <nav>
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
          <button type="submit">ログイン</button>
        </form>
      </nav>
    </c:if>

    <c:if test="${not empty sessionScope.user}">
      <nav>
        <button type="button">ようこそ ${sessionScope.user.name} さん</button>
        <form action="${pageContext.request.contextPath}/SigninServlet" method="post">
          <button type="submit">サインイン（新規作成）</button>
        </form>
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
          <button type="submit">ログアウト</button>
        </form>
      </nav>
    </c:if>
  </header>

  <!-- 左側サイドナビ -->
  <aside>
    <nav>
      <ul>
        <li>
          <a href="#">生徒</a>
          <ul>
            <li><a href="SelectMypageServlet">生徒管理</a></li>
            <li><a href="SelectMypageServlet">点数管理</a></li>
            <li><a href="SelectDiaryServlet?dialog_id=${user.user_id}">日記</a></li>
          </ul>
        </li>
        <li><a href="">成績</a></li>
        <li><a href="">報告</a></li>
        <li><a href="">海外支援</a></li>
      </ul>
    </nav>
  </aside>

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

  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
  
</body>
</html>
