<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>心理テスト｜Classcare</title>
  <link rel="stylesheet" href="css/login.css">
</head>
<meta charset="UTF-8">

<body>
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
 <div class="layout">  
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>
<main class="main">
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
            <button type="button">戻る</button>

            <button type="submit" name="action" value="next">
                次へ
            </button>

            <button type="submit" name="action" value="submit">
                提出
            </button>
        </div>

    </form>
</main>
</div>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>

</html>