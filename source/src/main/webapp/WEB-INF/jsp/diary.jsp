<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
<link rel="stylesheet" href="css/diary.css">
</head>
<!-- ヘッダーエリア、bodyの下に置いてください -->

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


  <main>

    <div>
      <h2>student name / 日記</h2>
    </div>
    <!--生徒の情報欄 -->
    <div>
      <img src="" alt="">
      <div>生徒氏名</div>
    </div>
    <!--日記の内容-->
    <div class="diary-section">
      <p>日記</p>
      <a href="">戻る</a>
      <textarea name="diary" id="diary">

      </textarea>
    </div>
  </main>
  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>