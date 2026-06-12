<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Class Care</title>
</head>
<body>
    <h6>クラスケア</h6>
    <h1>Class Care</h1>
    <link rel="stylesheet" href="common.css">
<main>
<div>
<!-- 左側サイドナビ -->
 <aside>
    <nav>
        <ul>
            <li><a href="mypage.jsp">生徒</a></li>
            <li><a href="stuScoreMenu.jsp">成績</a></li>
            <li><a href="incidentMenu.jsp">報告</a></li>
                <ul>
                    <li><a href="incidentMenu.jsp">:事案</a></li>
                    <li><a href="mTMenu.jsp">:心理テスト</a></li>
                </ul>
            <li><a href="support.jsp">海外支援</a></li>
        </ul>
    </nav>
</aside>
</div>
<p>事案報告</p>

    <p><label>件名
    <input type="text">
    </label></p><br>
    
    <p><label>事案内容
        <input type="textarea">
        </label></p>
            
    <p><label>関係者
        <input type="text">
        </label></p><br>

    <input type="submit" value="保存">
</main>
<footer>
<p>虎視眈々(株)</p>
</footer>
</body>
</html>

