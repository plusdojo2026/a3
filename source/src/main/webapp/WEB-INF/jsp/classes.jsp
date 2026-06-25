<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
</head>

<body>

  <header>
    <!-- ここからテンプレート -->
    <div>
      <!-- ロゴ写真 -->
      <span><img></span>

    </div>
    <c:if test="${empty sessionScope.user}">
    <nav>
    	<form action = "${pageContext.request.contextPath}/LoginServlet">
      		<button type="submit">ログイン</button>
      	</form>
    </nav>
    </c:if>
   <c:if test="${not empty sessionScope.user}">
   	<nav>
      <button type="button">ようこそ${sessionScope.user.name}さん</button>
      
      <form action = "${pageContext.request.contextPath}/SigninServlet">
      	<button type = "submit">サインイン（新規作成）</button>
      </form>
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
          <a href="#">生徒</a>
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


  <!-- メインコンテンツエリア -->

  <main>
    <!-- 検索バー -->
     <div>
      <form action = "${pageContext.request.contextPath}/SelectClassesServlet" method="get">>
        <input type="search" name = "学籍番号検索" placeholder="検索（学籍番号・名前）">
      </form>
    </div>
     <%-- <h2>👥 1年1組</h2>

    <!-- 生徒リスト -->
    <ul>
      <!-- 生徒1 -->
      <li>
        <span>0001</span>
        <span>山田太郎</span>
        <span>1年1組</span>
        <button type="button">詳細</button>
        <button type="button">削除</button>
      </li>
      <!-- 生徒2 -->
      <li>
        <span>0005</span>
        <span>竈門炭治郎</span>
        <span>1年1組</span>
        <button type="button">詳細</button>
        <button type="button">削除</button>
      </li>
      <!-- 生徒3 -->
      <li>
        <span>0002</span>
        <span>山田二郎</span>
        <span>1年1組</span>
        <button type="button">詳細</button>
        <button type="button">削除</button>
      </li>
      <!-- 生徒4 -->
      <li>
        <span>0099</span>
        <span>山田九十九郎</span>
        <span>1年1組</span>
        <button type="button">詳細</button>
        <button type="button">削除</button>
      </li>
    </ul>
    --%>
    
  	<div>
  		<c:forEach var = "row" items = "${classesList}">
  		
  		<div>
  		<button type = "button" onclick = "showClass('${row.class_name}')">${row.class_name}</button>
  		</div>
  		<div>
  			<!--  -->
  			<div>${row.user_id}</div>
  			<div>${row.class_name}</div>
  			<div>${row.user_name}</div>
  			
  			<form action = "${pageContext.request.contextPath}/SelectMypageServlet" method = "get">
  				<input type = "hidden" name = "user_id" value = "${row.user_id}">
  				<button type = "submit">詳細</button>
  			</form>
  			
  			<form action = "${pageContext.request.contextPath}/DeleteClassesServlet" method = "post">
  				<input type = "hidden" name = "user_id" value = "${row.user_id}">
  				<button type = "submit">削除</button>
  			</form>
  		</div>
  		</c:forEach>
  	</div>
  	
  </main>

  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>

</body>

</html>