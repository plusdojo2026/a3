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

   
<form method="GET" action="${pageContext.request.contextPath}/SelectTestsServlet">
    <!-- 科目の選択部分（動的ループ） -->
    <c:forEach var="subject" items="${subjectList}">
        <label style="display: block; margin-bottom: 5px;">
            <input type="checkbox" name="selectedSubject" value="${subject.subjectName}">
            ${subject.subjectName}
        </label>
    </c:forEach>
    
    <!-- 作成・削除のボタン -->
    <div style="margin-top: 15px;">
        <a href="InsertTestServlet">新規作成</a>
        <a href="DeleteTestServlet">削除</a>
    </div>
</form>

</div> 
<div>
    <h3>日付選択</h3>
    <ul>
        <!-- 日付・回数の一覧部分 -->
        <c:forEach var="test" items="${testList}">
            <li>
                <!-- テスト一覧から選択したときに、test_id を次のサーブレットに渡せるよう -->
                <a href="SelectTestsServlet?test_id=${test.test_id}">
                    ${test.test_date} (${test.test_id}回目)
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
   
  </main>




  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>