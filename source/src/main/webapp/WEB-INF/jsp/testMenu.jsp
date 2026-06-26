<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>テスト一覧 / 新規作成・削除</title>
  
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
  input[type="text"], input[type="submit"].btn-submit-input {
    padding: 8px 12px;
    border-radius: 20px;
    border: 1px solid #2aa198;
  }
  button, .btn-link {
    display: inline-block;
    padding: 6px 14px;
    border-radius: 20px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    text-align: center;
  }
  button[type="submit"], button[type="button"], .btn-link-submit {
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
        <li>
          <a href="">成績</a>
          <ul>
            <li><a href="SelectScoresServlet?score_id=${user.user_id}">得点</a></li>
            <li><a href="MTResultServlet">心理テスト</a></li>
          </ul>
        </li>
        <li>
          <a href="">報告</a>
          <ul>
            <li><a href="InsertTroubleServlet">事案</a></li>
            <li><a href="SelectMTServlet">心理テスト</a></li>
          </ul>
        </li>
        <li><a href="">海外支援</a></li>
      </ul>
    </nav>
  </aside>

  <!-- メインコンテンツエリア -->
  <main>
    <h2>テスト一覧 / 新規作成・削除</h2>
    <p style="margin-bottom: 20px;">
      <small style="color: #666;">新規作成で件数が増えるため、日付選択は下部へ配置</small>
    </p>

    <!-- 科目選択＆操作カード -->
    <div>
      <p style="font-weight: bold; color: #2aa198; margin-bottom: 15px;">対象科目の選択</p>
      <form method="GET" action="${pageContext.request.contextPath}/SelectTestsServlet">
        <!-- 科目の選択部分（動的ループ） -->
        <div style="display: flex; flex-direction: column; gap: 8px; margin-bottom: 20px;">
          <c:forEach var="subject" items="${subjectList}">
            <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
              <input type="checkbox" name="selectedSubject" value="${subject.subjectName}">
              <span>${subject.subjectName}</span>
            </label>
          </c:forEach>
        </div>
        
        <!-- 作成・削除のボタン -->
        <div style="display: flex; gap: 10px;">
          <a href="InsertTestServlet" class="btn-link btn-link-submit">新規作成</a>
          <a href="DeleteTestServlet" class="btn-link btn-delete">削除</a>
        </div>
      </form>
    </div>

    <!-- 日付選択カード -->
    <div>
      <h3 style="font-size: 18px; color: #2aa198; margin-bottom: 15px;">日付選択</h3>
      <form action="SelectTestsServlet" method="get">
        <ul style="display: flex; flex-wrap: wrap; gap: 15px; margin-bottom: 20px;">
          <!-- 日付・回数の一覧部分 -->
          <c:forEach var="test" items="${testList}">
            <li style="background: #fff; padding: 8px 15px; border-radius: 8px; border: 1px solid #e8ccd5;">
              <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                <input type="radio" name="test_id" value="${test.test_id}">
                <span>${test.test_date} (${test.test_id}回目)</span>
              </label>
            </li>
          </c:forEach>
        </ul>
        <div>
          <button type="submit">確認する</button>
        </div>
      </form>
    </div>

  </main>

  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>
</html>
