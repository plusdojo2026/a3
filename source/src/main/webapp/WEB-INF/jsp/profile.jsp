<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="jp">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>個人情報</title>
</head>

<body>
  <header>
    <div>
      <span><img></span>

    </div>
    <nav>
      <button type="button">ログイン</button>
      <button type="button">サインイン</button>
    </nav>
    <nav style="display: none;">
      <button type="button">ようこそxxxさん</button>
      <button type="button">ログアウト</button>
    </nav>
  </header>


  <!-- 左側サイドナビ -->
  <aside>
    <nav>
      <ul>
        <li>
          <a href="#">生徒</a>
          <ul>
            <li><a href="#"> 生徒管理</a></li>
            <li><a href="#"> 点数管理</a></li>
            <li><a href="#"> 日記</a></li>
          </ul>
        </li>
        <li><a href="#">成績</a></li>
        <ul>
          <li><a href="#">得点</a></li>
          <li><a href="#">心理テスト</a></li>
        </ul>
        <li><a href="">報告</a></li>
        <ul>
          <li><a href="#">事案</a></li>
          <li><a href="#">心理テスト</a></li>
        </ul>
        <li><a href="#">海外支援</a></li>
      </ul>
    </nav>
  </aside>

  <!-- ここからの編集 -->
  <!-- 個人情報 -->
  <main>
    <h3>XXX XXX (usersname)/ 個人情報</h3>

    <!-- 生徒写真 -->
    <div>
      <img src="./img/画像1.png" alt="" width="100px" height="125px">
      <h2>山田 太郎</h2>
    </div>
    <!-- 個人情報 -->
    <form>
      <div class="contents1">
        <ul>
          <li>
            学生番号（変更不可）<br>
           <input type="text" value="${myUsers.user_id}" disabled>
          <input type="hidden" name="user_id" value="${myUsers.user_id}">
          </li>
          <li>
            年齢<br>
            <input type="number" name="age" value="${myUsers.age}" required>
          </li>
          <li>
            郵便番号<br>
            <input type="text" name="post_code" value="${myUsers.post_code}">
          </li>
          <li>
            生年月日<br>
            <input type="date" name="birthday" value="${myUsers.birthday}" required>
          </li>
        </ul>
      </div>

      <!-- contents2 -->
      <div class="contents2">
        <ul>
          <li>
            性別<br>
            <input type="text" name="gender" value="${myUsers.gender}">
          </li>
          <li>
            メールアドレス<br>
            <input type="email" name="mail" value="${myUsers.mail}" required>
          </li>
          <li>
            住所<br>
            <input type="text" name="address" value="${myUsers.address}">
          </li>
          <li>
            電話番号<br>
            <input type="tel" name="tel" value="${myUsers.tel}">
          </li>
        </ul>
      </div>
      <!--提出ボタン-->
      <input type="submit" value=""><img src="" alt="">
    </form>
  </main>

  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>