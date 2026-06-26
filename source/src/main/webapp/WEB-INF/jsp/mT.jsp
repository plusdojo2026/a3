<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 心理テスト</title>
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mT.css">
</head>

<body id="index-top">
<!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">
  
    <!-- ===== sidebar ===== -->
 
<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>
<main>

<h2>心理テスト</h2>

<form action="SelectMTServlet" method="post">

    <c:forEach var="test" items="${todayMTlist}" varStatus="status">

        <div>
            <h3>問題 ${status.count}</h3>

            <p>${test.question}</p>

            <img src="${test.mt_img_url}"
     		alt="心理テスト画像"
     		class="question-image">

            <div>
                <label>
                    <input type="radio"
                           name="score${test.test_id}"
                           value="${test.choiceA_score}"
                           required>
                    A. ${test.choiceA_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score${test.test_id}"
                           value="${test.choiceB_score}">
                    B. ${test.choiceB_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score${test.test_id}"
                           value="${test.choiceC_score}">
                    C. ${test.choiceC_descript}
                </label>
            </div>

            <div>
                <label>
                    <input type="radio"
                           name="score${test.test_id}"
                           value="${test.choiceD_score}">
                    D. ${test.choiceD_descript}
                </label>
            </div>


            <input type="hidden" name="time" value="3000">

        </div>

        <hr>

    </c:forEach>

    <input type="hidden"
           name="mt_id">


    <input type="submit" value="提出">

</form>

</main>

</div>

<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>


</html>