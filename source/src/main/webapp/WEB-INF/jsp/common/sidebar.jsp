<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="sidebar">

    <button class="sidebar__toggle" type="button" id="sidebarToggle">
        ☰
    </button>

    <nav class="sidebar__nav">

        <ul class="menu">

            <li class="menu__item">
                <a class="menu__title" href="InsertClassesServlet">
                    <span class="menu__jp">生徒</span>
                    <span class="menu__en">Student</span>
                </a>

                <ul class="menu__sub">
                    <li>
                        <a class="menu__link" href="/a3/SelectClassesServlet">
                        
                            <span class="menu__text">生徒管理</span>
                        </a>
                    </li>
                    <li>
                        <a class="menu__link active" href="/a3/SelectClassesServlet">
                          
                            <span class="menu__text">点数管理</span>
                        </a>
                    </li>
                    <li>
                        <a class="menu__link" href="SelectDiaryServlet?dialog_id=${user.user_id}">
                           
                            <span class="menu__text">日記</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu__item">
                <a class="menu__title" href="/a3/AddTestsServlet">
                    <span class="menu__jp">成績</span>
                    <span class="menu__en">Score</span>
                </a>

                <ul class="menu__sub">
                    <li>
                        <a class="menu__link" href="/a3/AddTestsServlet">
                          
                            <span class="menu__text">得点</span>
                        </a>
                    </li>
                    <li>
                        <a class="menu__link" href="MTResultServlet">
                          
                            <span class="menu__text">心理テスト</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu__item">
                <a class="menu__title" href="#">
                    <span class="menu__jp">報告</span>
                    <span class="menu__en">Report</span>
                </a>

                <ul class="menu__sub">
                    <li>
                        <a class="menu__link" href="InsertTroubleServlet">
                           
                            <span class="menu__text">事案</span>
                        </a>
                    </li>
                    <li>
                        <a class="menu__link" href="SelectMTServlet">
                            
                            <span class="menu__text">心理テスト</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu__item">
                <form action="${pageContext.request.contextPath}/Forward" method="post">
                    <input type="hidden" name="page" value="support">

                    <button class="menu__support" type="submit">
                        <span class="menu__jp">海外支援</span>
                        <span class="menu__en">Support</span>
                    </button>
                </form>
            </li>

        </ul>

    </nav>

</aside>