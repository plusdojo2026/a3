<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>日記一覧｜Classcare</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary.css">
</head>

<body>
  <header>
   <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
  </header>
  
  <!-- 左側サイドナビ -->
	<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

  <main class="main">
	
	 
	  <!--日記一覧-->
	  	<h2>日記一覧</h2>

	<!-- 生徒情報を表示 -->

		  <section class="diary-profile">
		    <img src="${pageContext.request.contextPath}/img/画像1.png" alt="生徒画像" width="100" height="125">
		    <h2>${user.name}</h2>
		  </section>

		<!-- 削除処理：削除対象のdialog_idをDeleteDialogsServletへ送信する -->
	<form action="${pageContext.request.contextPath}/DeleteDialogsServlet" method="post">
	
	<!-- 日記がない場合 -->
	  <c:if test="${empty dialogList}">
	    <p>登録されている日記はありません。</p>
	  </c:if>
	
	  <!-- 日記一覧を表示 -->
	  
		  <c:if test="${not empty dialogList}">
		    <c:forEach var="dialog" items="${dialogList}">
		    
		      <div>
		        <!-- 削除したい日記を選択する -->
		        <c:if test="${user.state == 1}">
				  <input type="radio" name="dialog_id" value="${dialog.dialog_id}">
				</c:if>
		
		        <!-- 日記詳細画面へ移動する -->
		        <a href="${pageContext.request.contextPath}/SelectDiaryServlet?dialog_id=${dialog.dialog_id}">
		          <button type="button">${dialog.date}</button>
		        </a>
		      </div>
		      <br>
		    </c:forEach>
			
		    <!-- 学生だけ削除ボタンを表示 -->
		    <c:if test="${user.state == 1 }">
		    	<button type="submit">削除</button>
		    </c:if>
		  </c:if>
	
	</form>
				
		<!-- 学生だけ新規作成画面へ移動 -->
		<c:if test="${user.state == 1 }">
		    <a href="${pageContext.request.contextPath}/AddDialogsServlet">
		    	<button type="submit">新規作成</button>
		    </a>
	    </c:if>

  </main>
  
  <!-- フッター -->
  <footer>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
  </footer>
</body>

</html>