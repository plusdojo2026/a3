<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>事案報告｜Classcare</title>
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
    <div>
     
        <p>事案報告</p>

        <label>件名</label> <input type="text" name="title"><br>

        <label>事案内容
        </label>
         <textarea name="contents"></textarea>

        <label>関係者</label> <input type="text" name="user_id" ><br>
		 <form action="SelectMypageServlet" method="post">
        <input type="submit" value="保存">
      	</form>
    </div>
  </main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</div>
</main>
</body>

</html>