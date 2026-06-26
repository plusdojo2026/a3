<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記作成｜Classcare</title>
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/diaryEdit.css">
</head>

<body>
  <!--ヘッダー-->
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

  <!--コンテンツ-->
  <main>
   
   <!--テーマ-->
	<div>
      <h2>/ 日記作成​</h2>
    </div>
    
	<!--生徒の情報欄 -->
	<section>
	   <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
	   <h2>${user.name}</h2>
	   <p>生徒ID：${user.user_id}</p>
	</section>
	    
    <!--日記の内容-->
    <form action ="${pageContext.request.contextPath}/InsertDialogsServlet" method="post">
  
        <p>日記</p>
        
        <!-- 日記作成のエリア -->
        
		<input type="date" class="w120" value="<fmt:formatDate value="${mealCancel.mealCancelDate}" pattern="yyyy-MM-dd" />">
		<br>
        <textarea name="dialogs_area" id="" rows="15" cols="80">
ここに日記を入力します。​
      	</textarea>
      	
        <a href="${pageContext.request.contextPath}/SelectDialogsServlet">
        	<input type="submit" name ="dialog_id" value="${dialog.dialogId}">保存
        </a>
    </form>
  </main>
  
  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>