<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>海外支援</title>
</head>

<body onload="connect()">
  <div id="chat-container">
    <div id="messages" class="messages"></div>
    <div class="input-area">
      <input type="text" id="message" placeholder="メッセージを入力してください" onkeydown="if(event.key === 'Enter') sendMessage()">
      <button onclick="sendMessage()">送信</button>
    </div>
  </div>

  <!-- ヘッダーエリア、bodyの下に置いてください -->
  <header>
    <div>
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

  <!-- 左側サイドナビ -->
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
        <li><a href="#">成績</a></li>
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

  <!--ページの説明部分-->
  <div>
    <p>YAMADA TAROU / チャット​</p>
    <div>
      <img src="" alt="" class="userImg">
    </div>
    <div>
      <p>山田太郎​</p>
      <div>状態​</div>
      <select>
        <option>well</option>
        <option>so-so</option>
        <option value="">bad</option>
      </select>
    </div>
  </div>
  <!--チャット部分-->
  <script>
    var socket;
    var user_id_speaker = "one"; // 送信者のユーザーIDを文字列にする
    var user_id_listener = "two"; // 受信者のユーザーIDを文字列にする

    function connect() {
      // WebSocketを初期化するで
      loadChatHistory(); // ← 先に履歴を取って表示
      socket = new WebSocket("ws://" + window.location.host + "/etcProject/chat");

      // 接続が開いたときの処理やで
      socket.onopen = function () {
        console.log("WebSocket connection opened");
        document.getElementById("messages").innerHTML += "<div class='system-message'>チャットサーバーに接続しました。</div>";
        // ユーザーIDをサーバーに送信するで
        var initMessage = JSON.stringify({ type: 'init', user_id_speaker: user_id_speaker, user_id_listener: user_id_listener });
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
      fetch("/etcProject/loadHistory", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "user_id_speaker=" + user_id_speaker + "&user_id_listener=" + user_id_listener
      })
        .then(res => res.json())
        .then(data => {
          data.forEach(msg => {
            const messageClass = (msg.speaker === user_id_speaker) ? "sent-message" : "received-message";
            const messageElement =
              <div class="${messageClass}">
                <div class="message-time">${msg.createdAt}</div>
                <div class="message-content">${msg.message}</div>
              </div>

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