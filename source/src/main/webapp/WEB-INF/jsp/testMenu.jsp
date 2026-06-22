<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="jp">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>テスト一覧 / 新規作成・削除​</title>
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
  <!-- タイトル -->
  <main>
    <h2>テスト一覧/新規作成・削除</h2>
    <p>
      <small>新規作成で件数が増えるため、日付選択は下部へ配置</small>
    </p>

    <form>
      <!-- 科目の選択 -->
      <input type="checkbox" name="" id="">
      <button>数学</button>

      <input type="checkbox" name="" id="">
      <button>国語</button>

      <input type="checkbox" name="" id="">
      <button>英語</button>
      <!-- 作成・削除のボタン -->
      <a href="">新規作成</a>
      <a href="">削除</a>
    </form>
    <!-- 日付の一覧 -->
    <div>
      <h3>日付選択</h3>

      <li>
        <ui><a href="">2021年1回目</a></ui>
        <ui><a href="">2021年2回目</a></ui>
        <ui><a href="">2021年3目</a></ui>
        <ui><a href="">2021年4回目</a></ui>
      </li>
    </div>
  </main>




  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>