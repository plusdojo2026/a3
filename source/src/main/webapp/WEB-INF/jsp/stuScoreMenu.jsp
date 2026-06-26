<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Care - 生徒管理</title>
</head>

<body>
  <div>
    <!-- ロゴ写真 -->
    <span><img></span>

  </div>
  <header>
  <c:if test="${empty sessionScope.user}">
            <nav>
                <form action="${pageContext.request.contextPath}/LoginServlet">
                    <button type="submit">ログイン</button>
                </form>
            </nav>
        </c:if>

        <c:if test="${not empty sessionScope.user}">
            <nav>
                <button type="button">ようこそ${sessionScope.user.name}さん</button>

                <form action="${pageContext.request.contextPath}/SigninServlet">
                    <button type="submit">サインイン（新規作成）</button>
                </form>

                <!--
                    本来ログアウト専用Servletがあるなら
                    LoginServlet ではなく LogoutServlet の方が自然です
                    例：
                    ${pageContext.request.contextPath}/LogoutServlet
                -->
                <form action="${pageContext.request.contextPath}/LoginServlet">
                    <button type="submit">ログアウト</button>
                </form>
            </nav>
        </c:if>
  
  </header>



  <!-- 左側サイドナビ -->
  <aside>
    <nav>
      <ul>
        <li>
          <a href="#">生徒</a>
          <ul>
            <li><a href="SelectMypageServlet"> 生徒管理</a></li>
            <li><a href="SelectMypageServlet"> 点数管理</a></li>
            <li><a href="SelectDiaryServlet?dialog_id=${user.user_id}"> 日記</a></li>
          </ul>
        </li>
        <li><a href="">成績</a></li>
        <li><a href="">報告</a></li>
        <li><a href="">海外支援</a></li>
      </ul>
    </nav>
  </aside>

  <!-- メインコンテンツエリア -->
  <main>
    <div>
      <h2>YAMADA TAROU/点数</h2>
      <div>
        <span>img</span>
        <span id="username">${user.name}</span>さん
      </div>
    </div>

    <!-- 科目欄 -->
    <div>
    <form method ="GET" action="${pageContext.request.contextPath}/SelectScoresServlet">
     <c:forEach var="subject" items="${subjectList}">
        <button type="submit" name="subject_id" value="${subject.subject_id}">
            ${subject.subject_name}
        </button>
    </c:forEach>
      </form>>
    </div>
    <!--回数-->
    <div>
      <c:forEach var="test" items="${testlist}">
        <li>
            
            <span>${test_date}年 ${test.test_id}回目: </span>
            <input type="text" value="${test.score}点" readonly>
        </li>
    </c:forEach>
    </div>


  </main>
  <!-- 一番最後に置いてください -->
  <footer>
    <p>虎視眈々(株)</p>
  </footer>
</body>