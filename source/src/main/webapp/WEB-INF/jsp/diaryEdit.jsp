<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記作成｜Classcare</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary.css">
</head>

<body>
  <!--ヘッダー-->
  <header>
    <!-- ここからテンプレート -->
    <div>
      <!-- ロゴ写真 -->
      <span><img></span>

    </div>
    <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    <!-- テンプレート終了 -->
  </header>


  <!-- 左側サイドナビ -->
 	<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>
  <!--コンテンツ-->
  <main class="main">
   
   <!--テーマ-->
      <h2>日記作成​</h2>

	<!--生徒の情報欄 -->
	<section class="diary-profile">
	   <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
	   <h2>${user.name}</h2>
	</section>
	    
    <!--日記の内容-->
    <form action ="${pageContext.request.contextPath}/AddDialogsServlet" method="post">
          
        <!-- 日記作成のエリア -->
        
		<input type="date" name="date" class="w120" required>
		<br>
        <textarea name="contain" rows="15" cols="80" required placeholder="ここに日記を入力します。"></textarea>
      	
        <button type="submit">保存</button>
    </form>
  </main>
  
  <!-- 一番最後に置いてください -->
  <footer>
   	<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
  </footer>
</body>

</html>