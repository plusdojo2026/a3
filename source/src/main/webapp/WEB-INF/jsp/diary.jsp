<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記｜Classcare</title>
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"href="${pageContext.request.contextPath}/css/diaryMenu.css">
</head>
<!-- ヘッダーエリア、bodyの下に置いてください -->

<body>
  <header>
   
    <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
  </header>


  <!-- 左側サイドナビ -->
	<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>


  <main>
  
  <!--テーマ-->
	<div>
      <h2>日記​</h2>
    </div>
    
	<!--生徒の情報欄 -->
	<section>
	   <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
	   <h2>${user.name}</h2>
	</section>
	
    <!--日記の内容-->

	 <!-- 日付を表示 -->
    <p>日付：${dialog.date}</p>

    <!-- 日記内容を表示 -->
    <textarea rows="15" cols="80" readonly>${dialog.contain}</textarea>

    <br>

    <!-- 一覧画面へ戻る -->
    <a href="${pageContext.request.contextPath}/SelectDialogsServlet">
      <button type="button">戻る</button>
    </a>
    
    </div>
  </main>
  
  <!-- 一番最後に置いてください -->
  <footer>
     <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
  </footer>
</body>

</html>