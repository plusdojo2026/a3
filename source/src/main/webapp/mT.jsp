<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>心理テスト｜Classcare</title>
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
    <h2>${mental_tests.mt_test_date} 心理テスト</h2>
    <p>1/5</p>

    <form action="SelectMypageServlet" method="post">

        <div>
            <p>${mental_tests.question}</p>
        </div>

        <div>
            <label>
                <input type="radio" name="answer" value="A">
                A.${mental_tests.choiceA_descript}
            </label><br>

            <label>
                <input type="radio" name="answer" value="B">
                B.${mental_tests.choiceB_descript}
            </label><br>

            <label>
                <input type="radio" name="answer" value="C">
                C.${mental_tests.choiceC_descript}
            </label><br>

            <label>
                <input type="radio" name="answer" value="D">
                D.${mental_tests.choiceD_descript}
            </label>
        </div>

        <div>
            <img src="${mental_tests.mt_img_url}" alt="写真">
        </div>

        <div>
            <button type="button" onclick="history.back()">戻る</button>

            <button type="submit" name="action" value="next">
                次へ
            </button>

            <button type="submit" name="action" value="submit">
                提出
            </button>
        </div>

    </form>
</main>
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>

</html>