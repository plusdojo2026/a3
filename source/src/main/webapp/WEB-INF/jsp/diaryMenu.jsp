<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>日記一覧</title>
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



  <!-- 個人情報 -->
  <img src="./img/画像1.png" alt="" width="100px" height="125px">
  <h2>xxxx xxxx</h2>
  <h2>xx xx</h2>

  <!--日記一覧-->
  <h2>日記一覧</h2>

  <form>
    <input type="checkbox" name="" id=""><button>2021年1回目</button>​</input><br>
    <input type="checkbox" name="" id=""><button>2021年2回目</button>​</input><br>
    <input type="checkbox" name="" id=""><button>2021年3回目</button>​</input>


    <a href="">新規作成</a>
    <a href="">削除</a>
  </form>
  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>