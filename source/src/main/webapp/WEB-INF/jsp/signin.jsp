<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

    	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/css/signin.css"> 
        <meta charset="UTF-8">
        <title>サインイン｜Classcare</title>
    </head>
    <body>
        
	
       <!-- ===== header ===== -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
	<form class="signin-form" action="${pageContext.request.contextPath}/SigninServlet" method="post">

    <!-- サインインボックス -->

    <div class="form-item">
        <label>名前 / Name</label><br>
        <input type="text" name="name" required>
    </div>

    <div class="form-item">
        <label>性別 / Gender</label><br>
        <input type="radio" name="gender" value="男" required>男
        <input type="radio" name="gender" value="女">女
        <input type="radio" name="gender" value="その他">その他
    </div>

    <div class="form-item">
        <label>誕生日 / Birthday</label><br>
        <input type="date" name="birthday" required>
    </div>

    <div class="form-item">
        <label>年齢 / Age</label><br>
        <input type="number" name="age">
    </div>

    <div class="form-item">
        <label>パスワード / Password</label><br>
        <input type="password" name="password" required>
    </div>

    <div class="form-item">
        <label>メールアドレス / Mail</label><br>
        <input type="email" name="mail" required>
    </div>

    <div class="form-item">
        <label>親メール / Parents Mail</label><br>
        <input type="email" name="parents_mail">
    </div>

    <div class="form-item">
        <label>電話番号 / Tel</label><br>
        <input type="text" name="tel">
    </div>

    <div class="form-item">
        <label>郵便番号 / Zipcode</label><br>
        <input type="text" name="post_code">
    </div>

    <div class="form-item">
        <label>住所 / Address</label><br>
        <input type="text" name="address">
    </div>

    <div class="form-item">
        <label>備用 / Preparation</label><br>
        <input type="text" name="preparation">
    </div>

    <div class="form-item">
        <label>画像URL / Image URL</label><br>
        <input type="text" name="image_url">
    </div>

    <!-- ボタン -->
    <div class="form-item">
        <input type="submit" value="登録">
        <input type="reset" value="リセット">
        <span id="error_message">${message}</span>
    </div>

</form>

        <!-- 一番最後に置いてください -->
    <footer>
        <p>虎視眈々(株)</p>
    </footer> 

    </body>
</html>