<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <title>海外支援</title>
  <link rel="stylesheet" href="css/common.css">
</head>

<body>

<!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ===== layout ===== -->
<div class="layout">

    <!-- ===== sidebar ===== -->

<jsp:include page="/WEB-INF/jsp/common/sidebar.jsp"/>
  

<!-- ===== main ===== -->
   <main class="main">
      <!-- -------------------- -->
      <!-- 页面标题 -->
      <!-- -------------------- -->
      <div class="card">
        <h2>外国人支援</h2>
        <p class="intro">
          外部の参考資料やサポートサイトのURLを登録して、
          すぐにアクセスできるようにします。
        </p>
      </div>

      <!-- -------------------- -->
      <!-- URL登録 -->
      <!-- -------------------- -->
      <div class="card">
        <h3>URL登録</h3>

        <form method="GET" action="${pageContext.request.contextPath}/GlobalServlet">
           <label>支援サイト</label>
          <input type="text" name="supportURLName" id="supportURLName">
          <label>URL</label>
          <input type="text" name="supportURL" id="supportURL">

          <button type="submit" class="btn-green">保存</button>
        </form>
      </div>


      <div class="card">
        <h3>登録済みURL</h3>

        <div class="list-item">
          <span>外国人支援ポータルサイト</span>
          <div>
            <button class="btn-green"><a href="https://www.moj.go.jp/isa/support/portal/index.html">開く</a></button>
            <button class="btn-delete">削除</button>
          </div>
        </div>

        <div class="list-item">
          <span>入国管理局公式ページ</span>
          <div>
            <button class="btn-green"><a href="https://www.moj.go.jp/isa/">開く</a></button>
            <button class="btn-delete">削除</button>
          </div>
        </div>

      </div>

    </main>
</div>
<!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>