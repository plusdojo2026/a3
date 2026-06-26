<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ログイン｜Classcare</title>
         <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
     <!--ここのアクションまだ入れてません-->
    
    
    <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<main class="main">
    <!-- メインコンテンツ -->
    <h2 class="login-title">ログイン</h2>
    
	<form action = "${pageContext.request.contextPath}/LoginServlet" method = "post">

        <!-- ログインボックス -->
    		<div>
                <label>ユーザー名 / Username<br>
                    <input type="text" name="username">
                </label>
            </div>
            <div>
                <label>パスワード / Password<br>
                    <input type="text" name="password">
                </label>
            </div>
          	<div>
                <input type="submit" name="submit" value="ログイン">
                <input type="reset" name="reset" value="リセット"> 
                <span id="error_message"></span>
			</div>
        </form>
        <!-- ログインボックス終了 -->
        <!-- 一番最後に置いてください -->
           </main>
</div>
      <!-- ===== footer ===== -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>