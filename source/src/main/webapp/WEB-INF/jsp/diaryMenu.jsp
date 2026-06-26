<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記一覧｜Classcare</title>
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/diary.css">
</head>

<body>
  <header>
    <!-- ここからテンプレート -->
    <div>
      <!-- ロゴ写真 -->
      <span><img></span>

    </div>
    <!-- 
    <nav>
    	<form action = "${pageContext.request.contextPath}/LoginServlet">
      		<button type="submit">ログイン</button>
      	</form>
    </nav>
     -->
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
        <a href="">生徒</a>
        <ul>
          <li><a href="SelectMypageServlet"> 生徒管理</a></li>
          <li><a href="SelectMypageServlet"> 点数管理</a></li>
          <li><a href="SelectDiaryServlet?dialog_id=${user.user_id}"> 日記</a></li>
        </ul>
      </li>
      <li><a href="">成績</a></li>
      <ul>
        <li><a href="SelectScoreServlet?score_id=${user.user_id}">得点</a></li>
        <li><a href="MTResultServlet">心理テスト</a></li>
      </ul>
      <li><a href="">報告</a></li>
      <ul>
        <li><a href="InsertTroubleServlet">事案</a></li>
        <li><a href="SelectMTServlet">心理テスト</a></li>
      </ul>
      <li><a href="jsp/Support.jsp">海外支援</a></li>
    </ul>
  </nav>
</aside>


  <main>
	
	   <!-- 生徒情報を表示 -->
	  <section>
	    <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
	    <h2>${user.name}</h2>
	    <!-- 
	    <p>生徒ID：${user.user_id}</p>
	     -->
	  </section>
	
	  <!--日記一覧-->
	  <div>
	  	<h2>日記一覧</h2>
	  </div>
	  	
		<!-- 日記日付を表示　-->
		<c:forEach var="dialog" items="${dialogList}">
	       <input type="checkbox" name="dialog_id" value="${dialog.dialog_id}">
	       <button type="button">${dialog.date}</button>
	       <br>
	   	</c:forEach>	
	   	 
    	<!-- 削除処理 -->
	  	<form action ="${pageContext.request.contextPath}/DeleteDialogsServlet" method="post">
			<span>${dialog.date}</span>
        	<input type="hidden" name="dialog_id" value="${dialog.dialog_id}">
        	<button type="submit">削除</button>
   	  	</form>
				
		<!-- 新規作成画面へ移動 -->
	    <a href="${pageContext.request.contextPath}/AddDialogsServlet">新規作成</a>

  </main>
  
  <!-- フッター -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>