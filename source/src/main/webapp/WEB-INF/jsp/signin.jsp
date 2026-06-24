<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>サインイン｜Classcare</title>
    </head>
    <body>
        
	
    <header>
        <div>
        <!-- ロゴ写真 -->
        <span><img></span>

        </div>
            <nav>
                <button type="button">ログイン</button>
                <button type="button">サインイン</button>
            </nav>
            <nav style="display: none;">
                <button type="button">ようこそxxxさん</button>
                <button type="button">ログアウト</button>
            </nav>
    </header>
		<form action = "${pageContext.request.contextPath}/SigninServlet" method = "post">
        <!-- サインインボックス -->
        
        <div>
            <label>名前 / Name</label><br>
            <input type="text" name="name">
        </div>
       <div>
            <label>性別 / Gender </label><br>
            <input type="radio" name="gender" value = "男" required>男
            <input type="radio" name="gender" value = "女" required>女
            <input type="radio" name="gender" value = "その他" required>その他
        </div>
        <div>
        	<label>誕生日 / bithday</label><br>
        	<input type="date" name="birthday">
        </div>
        <div>
            <label>パスワード / Password</label><br>
            <input type="text" name="password">
        </div>
        
        <div>
            <label>メールアドレス / Mail</label><br>
            <input type="text" name="mail">
        </div>
        
        <div>
            <label>電話番号 / Tel</label><br>
            <input type="text" name="tel">
        </div>
        
        <div>
            <label>郵便番号 / Zipcode</label><br>
            <input type="text" name="post_code">
        </div>
        <div>
            <label>住所 / Adress</label><br>
            <input type="text" name="address">
        </div>
        <!-- サインインボックス終了 -->
        <!-- 登録・リセットボタン -->
        <table>
            <tr>
            <td>
                <input type="submit" name="regist" value="登録">
                <input type="reset" name="reset" value="リセット"> 
                <span id="error_message"></span>
            </td>
            </tr>
           
        </table>
        </form>

        <!-- 一番最後に置いてください -->
    <footer>
        <p>虎視眈々(株)</p>
    </footer> 

    </body>
</html>