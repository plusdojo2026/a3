<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エラーメッセージ</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

 <!-- ヘッダーエリア -->
  <header>
    <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">

    <!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>

<!-- ===== main ===== -->
</div>
</header>
 <!-- メインコンテンツエリア -->
  <main>
${message}
</main>


<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>