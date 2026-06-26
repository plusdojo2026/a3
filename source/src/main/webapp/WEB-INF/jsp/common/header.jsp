<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">

    <div class="header__logo">
        <img alt="classcare"
             src="${pageContext.request.contextPath}/img/logo.png">
    </div>

    <c:if test="${empty sessionScope.user}">
        <nav class="header__auth">
            <form action="${pageContext.request.contextPath}/LoginServlet" method="get">
                <button class="btn btn-outline" type="submit">ログイン</button>
            </form>
        </nav>
    </c:if>

    <c:if test="${not empty sessionScope.user}">
        <nav class="header__auth">

            <span class="header__welcome">
                ようこそ${sessionScope.user.name}さん
            </span>

            <form action="${pageContext.request.contextPath}/SigninServlet" method="get">
                <button class="btn btn-outline" type="submit">
                    サインイン（新規作成）
                </button>
            </form>

            <form action="${pageContext.request.contextPath}/Forward" method="post">
                <input type="hidden" name="page" value="logout">
                <button class="btn btn-red" type="submit">ログアウト</button>
            </form>

        </nav>
    </c:if>

</header>