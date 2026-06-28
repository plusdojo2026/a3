<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <title>心理テスト</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/mT.css">
</head>

<body>

<!-- ヘッダー -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<div class="layout">

  <!-- サイドバー -->
  <jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

  <main>
    <h2>心理テスト</h2>

    <form action="SelectMTServlet" method="post" id="mtForm">

      <c:forEach var="test" items="${todayMTlist}" varStatus="status">

        <div class="question-block" data-index="${status.index}">

          <h3>問題 ${status.count}</h3>

          <p>${test.question}</p>

          <img src="${test.mt_img_url}"
               alt="心理テスト画像"
               class="question-image">

          <!-- ✅ mt_id（配列で送る） -->
          <input type="hidden" name="mt_id" value="${test.mt_id}">

          <!-- ✅ 開始時間 -->
          <input type="hidden" class="start-time">

          <!-- ✅ 回答時間（送信用） -->
          <input type="hidden" name="time" class="time-input">

          <!-- ✅ 各問題（indexで分離） -->
          <div>
            <label>
              <input type="radio"
                     name="score[${status.index}]"
                     value="${test.choiceA_score}"
                     required>
              A. ${test.choiceA_descript}
            </label>
          </div>

          <div>
            <label>
              <input type="radio"
                     name="score[${status.index}]"
                     value="${test.choiceB_score}">
              B. ${test.choiceB_descript}
            </label>
          </div>

          <div>
            <label>
              <input type="radio"
                     name="score[${status.index}]"
                     value="${test.choiceC_score}">
              C. ${test.choiceC_descript}
            </label>
          </div>

          <div>
            <label>
              <input type="radio"
                     name="score[${status.index}]"
                     value="${test.choiceD_score}">
              D. ${test.choiceD_descript}
            </label>
          </div>

        </div>

      </c:forEach>

      <div style="margin-top: 20px;">
        <button type="submit">送信</button>
      </div>

    </form>
  </main>

</div>

<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

<!-- ✅ JS：時間計測 -->
<script>
document.addEventListener("DOMContentLoaded", () => {

    const blocks = document.querySelectorAll(".question-block");

    blocks.forEach(block => {

        const startInput = block.querySelector(".start-time");
        const timeInput  = block.querySelector(".time-input");

        // 開始時間
        startInput.value = Date.now();

        const radios = block.querySelectorAll("input[type=radio]");

        // 選択時に時間記録
        radios.forEach(radio => {
            radio.addEventListener("change", () => {
                const start = parseInt(startInput.value);
                const now = Date.now();
                timeInput.value = now - start;
            });
        });
    });

    // ✅ 送信前の安全処理（重要）
    const form = document.getElementById("mtForm");

    form.addEventListener("submit", () => {
        document.querySelectorAll(".question-block").forEach(block => {

            const start = parseInt(block.querySelector(".start-time").value);
            const timeInput = block.querySelector(".time-input");

            // 未選択でも時間入れる
            if (!timeInput.value) {
                timeInput.value = Date.now() - start;
            }
        });
    });

});
</script>

</body>
</html>
