<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記｜Classcare</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary.css">
</head>
<!-- ヘッダーエリア、bodyの下に置いてください -->

<body>
  <header>
   
    <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
  </header>


  <!-- 左側サイドナビ -->
	<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>


  <main class="main">
  
  <!--テーマ-->
      <h2>日記​</h2>
    
	<!--生徒の情報欄 -->
	<section class="diary-profile">
	   <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
	   <h2>${user.name}</h2>
	</section>
	
    <!--日記の内容-->

	 <!-- 日付を表示 -->
   

     <!-- 学生の場合：編集できる -->
	  <c:if test="${user.state == 1}">
	    <form action="${pageContext.request.contextPath}/UpdateDialogsServlet" method="post">
	
	      <input type="hidden" name="dialog_id" value="${dialog.dialog_id}">
	      <input type="hidden" name="date" value="${dialog.date}">
	
	 	  <p>日付：${dialog.date}</p>
	      <textarea name="contain" rows="15" cols="80" required>${dialog.contain}</textarea>
	      <br>
	      <button type="submit">保存</button>
	    </form>
	  </c:if>
	
	  <!-- 教師の場合：閲覧だけ -->
	  <c:if test="${user.state == 0}">
	    <textarea rows="15" cols="80" readonly>${dialog.contain}</textarea>
	  </c:if>
	
	  <a href="${pageContext.request.contextPath}/SelectDialogsServlet">
	    <button type="button">一覧へ戻る</button>
	  </a>
  </main>
  
  <!-- 一番最後に置いてください -->
  <footer>
     <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
  </footer>
</body>

</html>