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
<header>
  <div>
    <!-- ロゴ写真 -->
    <span><img></span>

  </div>
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


  <!-- 左側サイ  ドナビ -->
  <aside>
    <nav>
      <ul>
        <li>
          <a href="#">生徒</a>
          <ul>
            <li><a href="#"> 生徒管理</a></li>
            <li><a href="#"> 点数管理</a></li>
            <li><a href="#"> 日記</a></li>
          </ul>
        </li>
        <li><a href="">成績</a></li>
        <ul>
          <li><a href="#">得点</a></li>
          <li><a href="#">心理テスト</a></li>
        </ul>
        <li><a href="">報告</a></li>
        <ul>
          <li><a href="#">事案</a></li>
          <li><a href="#">心理テスト</a></li>
        </ul>
        <li><a href="#">海外支援</a></li>
      </ul>
    </nav>
  </aside>

  <!-- 右側メイン表示 -->
  <main>
    <div>
      <h2>${score.subject_id} ${score.test_date}年 ${score.test_id}回目 / 成績総合</h2>
    </div>

    <div>
      <p>氏名：${score.name}</p>
      <p>学年クラス：${score.grade_class}</p>
      <p>点数：${score.score}点</p>
    </div>
  </main>
</body>

<!-- 棒グラフ -->
<div>棒グラフ用</div>

<!-- 一番最後に置いてください -->
<footer>
  <p>虎視眈々(株)</p>
</footer>