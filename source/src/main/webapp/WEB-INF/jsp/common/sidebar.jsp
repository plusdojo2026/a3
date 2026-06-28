<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="sidebar">

	<button class="sidebar__toggle" type="button" id="sidebarToggle">
		☰</button>

	<nav class="sidebar__nav">

		<ul class="menu">

			<li class="menu__item"><a class="menu__title"
				href="${pageContext.request.contextPath}/SelectClassesServlet">
					<span class="menu__jp">生徒</span> <span class="menu__en">Student</span>
			</a>

				<ul class="menu__sub">
					<li><c:if test="${sessionScope.user.state == 0}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/SelectClassesServlet">
								<span class="menu__text">生徒管理</span>
							</a>

						</c:if> <c:if test="${sessionScope.user.state == 1}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/SelectMypageServlet">
								<span class="menu__text">生徒管理</span>
							</a>

						</c:if></li>
					<li><a class="menu__link active"
						href="${pageContext.request.contextPath}/SelectSubjectServlet">

							<span class="menu__text">点数管理</span>
					</a></li>
					<li><a class="menu__link"
						href="${pageContext.request.contextPath}/SelectDialogsServlet">

							<span class="menu__text">日記</span>
					</a></li>
				</ul></li>

			<li class="menu__item"><a class="menu__title"
				href="${pageContext.request.contextPath}/SelectSubjectServlet">
					<span class="menu__jp">成績</span> <span class="menu__en">Score</span>
			</a>

				<ul class="menu__sub">
					<li><a class="menu__link"
						href="${pageContext.request.contextPath}/SelectSubjectServlet">

							<span class="menu__text">得点</span>
					</a></li>
					<li><c:if test="${sessionScope.user.state == 0}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/MTResultServlet">心理テスト一覧</a>
						</c:if> <c:if test="${sessionScope.user.state == 1}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/MTResultServlet">心理テスト結果</a>
						</c:if></li>
				</ul></li>

			<li class="menu__item"><a class="menu__title" href="#"> <span
					class="menu__jp">報告</span> <span class="menu__en">Report</span>
			</a>

				<ul class="menu__sub">
					<li><c:if test="${sessionScope.user.state == 0}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/SelectIncidentMenuServlet">事案一覧</a>
						</c:if> <c:if test="${sessionScope.user.state == 1}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/InsertTroubleServlet">事案報告</a>
						</c:if></li>


					<li><c:if test="${sessionScope.user.state == 1}">
							<a class="menu__link"
								href="${pageContext.request.contextPath}/SelectMTServlet">心理テスト</a>
						</c:if></li>
				</ul></li>

			<li class="menu__item">
				<form action="${pageContext.request.contextPath}/Forward"
					method="post">
					<input type="hidden" name="page" value="support">

					<button class="menu__support" type="submit">
						<span class="menu__jp">海外支援</span> <span class="menu__en">Support</span>
					</button>
				</form>
			</li>

		</ul>

	</nav>

</aside>