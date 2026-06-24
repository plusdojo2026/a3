<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>ホーム｜Classcare</title>
</head>
<meta charset="UTF-8">

<body>
  <header>
    <!-- ここからテンプレート -->
    <div>
      <!-- ロゴ写真 -->
      <span><img></span>

    </div>
    <nav>
    	<form action = "${pageContext.request.contextPath}/LoginServlet">
      		<button type="submit">ログイン</button>
      	</form>
    </nav>
   <c:if test="${not empty sessionScope.user}">
   	<nav>
      <button type="button">ようこそ${sessionScope.user.name}さん</button>
      
      <form action = "${pageContext.request.contextPath}/LoginServlet">
      	<button type="submit">ログアウト</button>
      </form>
    </nav>
    </c:if>
    <!-- テンプレート終了 -->
  </header>




  <!-- 左側サイドナビ -->
  <aside>
    <nav>
      <ul>
        <li>
          <a href="${pageContext.request.contextPath}/SelectClassesServlet">生徒</a>
          <ul>
            <li><a href="${pageContext.request.contextPath}/SelectClassesServlet"> 生徒管理</a></li>
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
    <h2>ホーム / 週間スケジュール設定​</h2>
    <div><img src="" alt="いじめ警戒"></div>
    <!-- スケジュール-->
    <div>
      <!--スケジュール用フォーム-->
      <form action="">
        <!-- スケジュール開始 -->
        <div>
          <label>スケジュール</label><br>
          <input type="text"> <!--スケジュールの仮置き-->
        </div>
      </form>
    </div>
  </main>
  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>


</html>