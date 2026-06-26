<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>個人情報</title>
  <link rel="stylesheet" href="css/common.css">
  <style>
  

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

 
  }
  </style>
</head>

<body>

  <!-- ヘッダーエリア -->
  <header>
    <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">

    <!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

<!-- ===== main ===== -->
   <main class="main">
    <h3>${myUsers.name} / 個人情報</h3>

    <!-- 生徒写真・基本情報カード -->
    <div style="display: flex; align-items: center; gap: 20px;">
      <img src="${myUsers.image_url}" name="image_url" alt="生徒写真" style="width: 100px; height: 125px; object-fit: cover; border-radius: 8px; border: 1px solid #e8ccd5;">
      <h2>${myUsers.name}</h2>
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
          <div class="form-group">
            <label>親のメール</label>
            <input type="text" name="parents_mail" value="${myUsers.parents_mail}" required>
          </div>
           <div class="form-group">
            <label>備用</label>
            <input type="text" name="preparation" value="${myUsers.preparation}" required>
          </div>
          <div class="form-group">
            <label>写真url</label>
            <input type="text" name="image_url" value="${myUsers.image_url}">
          </div>
        </div>

        <!-- 右側項目群 -->
        
        <div style="display: flex; flex-direction: column; gap: 15px;">
        <div class="form-group">
            <label>名前</label>
            <input type="text" name="name" value="${myUsers.name}">
          </div>
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
          <div class="form-group">
            <label>パスワード</label>
            <input type="text" name="password" value="${myUsers.password}">
          </div>
          
          
        </div>

      </div>

      <!-- 提出ボタンエリア -->
      <div style="margin-top: 20px; text-align: right;">
        <input type="submit" value="情報を更新する" class="btn-submit">
      </div>
    </form>
  </main>

</div>
<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>
