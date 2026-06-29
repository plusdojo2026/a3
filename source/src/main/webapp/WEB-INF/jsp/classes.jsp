<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/classes.css">

<title>Class Care - 生徒管理</title>
</head>

<body>

<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="layout">

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp" />

<main class="main classes-page">

<!-- ===============================
     ■ クラス操作
================================= -->
<div>

<!-- 新規 -->
<form action="${pageContext.request.contextPath}/InsertClassesServlet" method="post">
    <label>クラス操作</label>
    <input type="text" name="addClassInput" placeholder="新規クラス">
    <button type="submit" class="btn-green">新規</button>
</form>

<!-- 変更 -->
<form action="${pageContext.request.contextPath}/UpdateClassNameServlet" method="post">

    <select name="class_name">
        <c:forEach var="c" items="${classNames}">
            <option value="${c.class_name}">
                ${empty c.class_name ? '未配分' : c.class_name}
            </option>
        </c:forEach>
    </select>

    <input type="text" name="newClassName" placeholder="新しい名前">
    <button type="submit" class="btn-green">変更</button>
</form>

<!-- 削除 -->
<form action="${pageContext.request.contextPath}/DeleteClassesServlet" method="post">

    <select name="class_name">
        <c:forEach var="c" items="${classNames}">
            <option value="${c.class_name}">
                ${empty c.class_name ? '未配分' : c.class_name}
            </option>
        </c:forEach>
    </select>

    <button type="submit" class="btn-red"
        onclick="return confirm('削除してよろしいですか？')">
        削除
    </button>
</form>

</div>

<!-- ===============================
     ■ クラス表示（ここ重要！）
================================= -->
<div>

<c:forEach var="c" items="${classNames}">
    <form action="${pageContext.request.contextPath}/SelectClassesServlet" method="get" style="display:inline;">
        <input type="hidden" name="className" value="${c.class_name}">
        <button class="btn-green">
            ${empty c.class_name ? '未配分' : c.class_name}
        </button>
    </form>
</c:forEach>

</div>

<!-- ===============================
     ■ 生徒一覧
================================= -->
<div class="student-list">

<c:forEach var="row" items="${classesList}">

<div class="student-row">

<div>${row.user_id}</div>

<div>${empty row.class_name ? '未配分' : row.class_name}</div>

<div>${row.user_name}</div>

<!-- 詳細 -->
<form action="${pageContext.request.contextPath}/SelectMypageServlet" method="get">
    <input type="hidden" name="user_id" value="${row.user_id}">
    <button class="btn-green">詳細</button>
</form>

<!-- 削除 -->
<form action="${pageContext.request.contextPath}/DeleteClassesServlet" method="post">
    <input type="hidden" name="user_id" value="${row.user_id}">
    <button class="btn-red"
        onclick="return confirm('この生徒を削除しますか？')">
        削除
    </button>
</form>

<!-- 移動 -->
<form action="${pageContext.request.contextPath}/UpdateStudentClassServlet" method="post">

    <input type="hidden" name="user_id" value="${row.user_id}">

    <select name="class_name">
        <c:forEach var="c" items="${classNames}">
            <option value="${c.class_name}"
                <c:if test="${c.class_name == row.class_name}">
                    selected
                </c:if>>
                ${empty c.class_name ? '未配分' : c.class_name}
            </option>
        </c:forEach>
    </select>

    <button class="btn-green">移動</button>
</form>

</div>

</c:forEach>

<!-- 新規 -->
<div>
    <a href="${pageContext.request.contextPath}/AddUserServlet"
        class="btn-green">
        新規ユーザー
    </a>
</div>

</div>

</main>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

</body>
</html>