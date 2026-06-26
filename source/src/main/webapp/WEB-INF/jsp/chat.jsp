<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>チャット</title>
</head>

<body onload="connect()">
	<div id="chat-container">
		<div id="messages" class="messages"></div>
		<div class="input-area">
			<input type="text" id="message" placeholder="メッセージを入力してください"
				onkeydown="if(event.key === 'Enter') sendMessage()">
			<button onclick="sendMessage()">送信</button>
		</div>
	</div>

	<!-- ヘッダーエリア、bodyの下に置いてください -->
	<header>
		<!-- ここからテンプレート -->
		<div>
			<!-- ロゴ写真 -->
			<span><img alt=""></span>
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

				<form action="${pageContext.request.contextPath}/Forward"
					method="post">
					<input type="hidden" name="page" value="logout">
					<button type="submit">ログアウト</button>
				</form>

			</nav>
		</c:if>
		<!-- テンプレート終了 -->
	</header>

	<!-- 左側サイドナビ -->
	<aside>
		<nav>
			<ul>
				<li><a href="InsertClassesServlet">生徒</a>
					<ul>
						<li><a href="/a3/SelectClassesServlet"> 生徒管理</a></li>
						<li><a href="/a3/SelectClassesServlet"> 点数管理</a></li>
						<li><a href="SelectDiaryServlet?dialog_id=${user.user_id}">
								日記</a></li>
					</ul></li>
				<li><a href="/a3/AddTestsServlet">成績</a>
					<ul>
						<li><a href="/a3/AddTestsServlet">得点</a></li>
						<li><a href="MTResultServlet">心理テスト</a></li>
					</ul></li>
				<li><a href="">報告</a>
					<ul>
						<li><a href="InsertTroubleServlet">事案</a></li>
						<li><a href="SelectMTServlet">心理テスト</a></li>
					</ul></li>
				<li><form action="${pageContext.request.contextPath}/Forward"
					method="post">
					<input type="hidden" name="page" value="support">
					<button type="submit">海外支援</button>
				</form>
				</li>
			</ul>

		</nav>
	</aside>
	<!--ページの説明部分-->
	<p>${listenerUser.name}/チャット</p>

	<div>
		<img src="${listenerUser.image_url}" alt="ユーザー画像" class="userImg">
	</div>

	<div>
		<p>${listenerUser.name}</p>
		<div>状態</div>
		<select>
			<option>well</option>
			<option>so-so</option>
			<option value="">bad</option>
		</select>
	</div>

	<input type="hidden" id="speakerId" value="${speakerId}">
	<input type="hidden" id="listenerId" value="${listenerId}">
	<!--チャット部分-->
	<script>
    var socket;
    var user_id_speaker = "one"; // 送信者のユーザーIDを文字列にする
    var user_id_listener = "two"; // 受信者のユーザーIDを文字列にする

    function connect() {

    	user_id_speaker = document.getElementById("speakerId").value;
    	    user_id_listener = document.getElementById("listenerId").value;

      // WebSocketを初期化するで
      loadChatHistory(); // ← 先に履歴を取って表示
      socket = new WebSocket("ws://" + window.location.host + "/a3/chat");

      // 接続が開いたときの処理やで
      socket.onopen = function () {
        console.log("WebSocket connection opened");
        document.getElementById("messages").innerHTML += "<div class='system-message'>チャットサーバーに接続しました。</div>";
        // ユーザーIDをサーバーに送信するで
        var initMessage = JSON.stringify({ type: 'init', user_id_speaker: user_id_speaker, user_id_listener: user_id_listener,login_user_id: user_id_speaker });
        socket.send(initMessage);
      };

      // メッセージを受信したときの処理やで
      socket.onmessage = function (event) {
        console.log("Received message: ", event.data);
        var data = event.data.split(" ");
        var createdAt = data.slice(0, 2).join(" ");
        var speaker = data[2];
        var listener = data[3];
        var message = data.slice(4).join(" ");
        var messageClass = (speaker === user_id_speaker) ? "sent-message" : "received-message";
        var messageElement = "<div class='" + messageClass + "'><div class='message-time'>" + createdAt + "</div><div class='message-content'>" + message + "</div></div>";
        document.getElementById("messages").innerHTML += messageElement;
        document.getElementById("messages").scrollTop = document.getElementById("messages").scrollHeight;
      };

      // 接続が閉じたときの処理やで
      socket.onclose = function () {
        console.log("WebSocket connection closed");
        document.getElementById("messages").innerHTML += "<div class='system-message'>チャットサーバーから切断されました。</div>";
      };

      // エラーが発生したときの処理やで
      socket.onerror = function (event) {
        console.error("WebSocket error: ", event);
        document.getElementById("messages").innerHTML += "<div class='system-message'>エラー: " + event.data + "</div>";
      };
    }

    // メッセージを送信する関数やで
    function sendMessage() {
      var message = document.getElementById("message").value;
      var now = new Date();
      var formattedTime = now.getFullYear() + "-" +
        ('0' + (now.getMonth() + 1)).slice(-2) + "-" +
        ('0' + now.getDate()).slice(-2) + " " +
        ('0' + now.getHours()).slice(-2) + ":" +
        ('0' + now.getMinutes()).slice(-2) + ":" +
        ('0' + now.getSeconds()).slice(-2);
      // メッセージを送信するで
      var messageToSend = formattedTime + " " + user_id_speaker + " " + user_id_listener + " " + message;
      socket.send(messageToSend);
      document.getElementById("message").value = "";
    }
    function loadChatHistory() {
      fetch("/a3/loadHistory", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "user_id_speaker=" + user_id_speaker + "&user_id_listener=" + user_id_listener
      })
        .then(res => res.json())
        .then(data => {
          data.forEach(msg => {
            const messageClass = (msg.speaker === user_id_speaker) ? "sent-message" : "received-message";
            const messageElement =
             `<div class="${messageClass}">
                <div class="message-time">${msg.createdAt}</div>
                <div class="message-content">${msg.message}</div>
              </div>`

            document.getElementById("messages").innerHTML += messageElement;
          });
          document.getElementById("messages").scrollTop = document.getElementById("messages").scrollHeight;
        });
    }

  </script>
	<!-- 一番最後に置いてください -->
	<footer>
		<p>虎視眈々(株)</p>
	</footer>
</body>

</html>