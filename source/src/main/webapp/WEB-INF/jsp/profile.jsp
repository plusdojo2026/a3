<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>個人情報</title>
  
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
  main h3 { font-size: 22px; color: #2aa198; margin-bottom: 15px; }

  /* =====================================
     ★ カード（超重要）
  ===================================== */
  main > div, .form-card {
    background: #f7f1f3;
    border: 1px solid #e8ccd5;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
  }

  /* =====================================
     ★ 入力欄 / ボタン調整（各種フォーム対応版）
  ===================================== */
  input[type="text"], input[type="number"], input[type="date"], input[type="email"], input[type="tel"] {
    padding: 8px 12px;
    border-radius: 20px;
    border: 1px solid #2aa198;
    width: 100%; /* カード内で幅いっぱいに広げる */
    max-width: 300px;
    background-color: #fff;
  }
  input:disabled {
    background-color: #e0e0e0;
    border-color: #ccc;
    color: #666;
    cursor: not-allowed;
  }
  
  /* フォーム内のレイアウト調整 */
  .form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-bottom: 20px;
  }
  .form-group {
    display: flex;
    flex-direction: column;
    gap: 6px;
  }
  .form-group label {
    font-size: 14px;
    font-weight: bold;
    color: #2aa198;
  }

  /* 送信ボタン装飾（input[type="submit"]用） */
  input[type="submit"].btn-submit {
    display: inline-block;
    padding: 8px 24px;
    border-radius: 20px;
    border: none;
    background-color: #44c2a8;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
  }
  input[type="submit"].btn-submit:hover {
    background-color: #33a891;
  }

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
          <a href="#">成績</a>
          <ul>
            <li><a href="SelectScoresServlet?score_id=${user.user_id}">得点</a></li>
            <li><a href="SelectMTServlet">心理テスト</a></li>
          </ul>
        </li>
        <li>
          <a href="">報告</a>
          <ul>
            <li><a href="InsertTroubleServlet">事案</a></li>
            <li><a href="SelectMTServlet">心理テスト</a></li>
          </ul>
        </li>
        <li><a href="#">海外支援</a></li>
      </ul>
    </nav>
  </aside>

  <!-- 個人情報メインエリア -->
  <main>
    <h3>${myUsers.name} / 個人情報</h3>

    <!-- 生徒写真・基本情報カード -->
    <div style="display: flex; align-items: center; gap: 20px;">
      <img src="./img/画像1.png" alt="生徒写真" style="width: 100px; height: 125px; object-fit: cover; border-radius: 8px; border: 1px solid #e8ccd5;">
      <h2>山田 太郎</h2>
    </div>

    <!-- 入力フォームカード -->
    <form action="UpdateUsersServlet" method="post" class="form-card">
      <div class="form-grid">
        
        <!-- 左側項目群 -->
        <div style="display: flex; flex-direction: column; gap: 15px;">
          <div class="form-group">
            <label>学生番号（変更不可）</label>
            <input type="text" value="${myUsers.user_id}" disabled>
            <input type="hidden" name="user_id" value="${myUsers.user_id}">
          </div>
          <div class="form-group">
            <label>年齢</label>
            <input type="number" name="age" value="${myUsers.age}" required>
          </div>
          <div class="form-group">
            <label>郵便番号</label>
            <input type="text" name="post_code" value="${myUsers.post_code}">
          </div>
          <div class="form-group">
            <label>生年月日</label>
            <input type="date" name="birthday" value="${myUsers.birthday}" required>
          </div>
        </div>

        <!-- 右側項目群 -->
        <div style="display: flex; flex-direction: column; gap: 15px;">
          <div class="form-group">
            <label>性別</label>
            <input type="text" name="gender" value="${myUsers.gender}">
          </div>
          <div class="form-group">
            <label>メールアドレス</label>
            <input type="email" name="mail" value="${myUsers.mail}" required>
          </div>
          <div class="form-group">
            <label>住所</label>
            <input type="text" name="address" value="${myUsers.address}">
          </div>
          <div class="form-group">
            <label>電話番号</label>
            <input type="tel" name="tel" value="${myUsers.tel}">
          </div>
        </div>

      </div>

      <!-- 提出ボタンエリア -->
      <div style="margin-top: 20px; text-align: right;">
        <input type="submit" value="情報を更新する" class="btn-submit">
      </div>
    </form>
  </main>

  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>
</html>
