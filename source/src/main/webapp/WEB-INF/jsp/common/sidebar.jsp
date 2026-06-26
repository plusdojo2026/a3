<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <aside class="sidebar">

    <nav class="sidebar__nav">

        <ul class="menu">

            <li class="menu__item">
                <a class="menu__title" href="InsertClassesServlet">生徒</a>

                <ul>
                    <li>
                        <a class="menu__link" href="/a3/SelectClassesServlet">生徒管理</a>
                    </li>
                    <li>
                        <a class="menu__link" href="/a3/SelectClassesServlet">点数管理</a>
                    </li>
                    <li>
                        <a class="menu__link"
                           href="SelectDiaryServlet?dialog_id=${user.user_id}">
                            日記
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu__item">
                <a class="menu__title" href="/a3/AddTestsServlet">成績</a>

                <ul>
                    <li>
                        <a class="menu__link" href="/a3/AddTestsServlet">得点</a>
                    </li>
                    
                    <li>
					    <c:if test="${sessionScope.user.state == 0}">
					        <a class="menu__link" href="">心理テスト一覧</a>
					    </c:if>
					
					    <c:if test="${sessionScope.user.state == 1}">
					        <a class="menu__link" href="MTResultServlet">心理テスト結果</a>
					    </c:if>
						</li>
                    <li>
                </ul>
            </li>

            <li class="menu__item">
                <a class="menu__title" href="">報告</a>

                <ul>
                    <li>
					    <c:if test="${sessionScope.user.state == 0}">
					        <a class="menu__link" href="SelectIncidentMenuServlet">事案一覧</a>
					    </c:if>
					
					    <c:if test="${sessionScope.user.state == 1}">
					        <a class="menu__link" href="InsertTroubleServlet">事案報告</a>
					    </c:if>
						</li>
                    <li>
                        <a class="menu__link" href="SelectMTServlet">心理テスト</a>
                    </li>
                </ul>
            </li>

            <li class="menu__item">
                <form action="${pageContext.request.contextPath}/Forward"
                      method="post">

                    <input type="hidden" name="page" value="support">

                    <button class="btn btn-outline" type="submit">
                        海外支援
                    </button>

                </form>
            </li>

        </ul>

    </nav>
</aside>