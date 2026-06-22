'use strict';

// Formを探す,registFormの定数に保存
const registForm = document.getElementById('registForm');

//error message
let userIdMsg = document.getElementById('userIdMsg');
let userPassMsg = document.getElementById('userPassMsg');
//空欄ではないルールを設定する
let notNullRegex = /^(?!\s*$).+/

//提出する際の関数
registForm.addEventListener('submit', (event) => {

	userPassMsg.textContent = '';
	userIdMsg.textContent = '';
	//useridを保存
	let userId = registForm.userId.value;
	//userpassに保存
	let userPass = registForm.userPass.value;

	// 空チェック
	if (notNullRegex.test(userId) && notNullRegex.test(userPass)) {
		return;
	} else {
		//ユーザーに何が足りないを提示
		if (!notNullRegex.test(userId)) {
			userIdMsg.textContent = `IDを入力してください。`;
		}
		if (!notNullRegex.test(userPass)) {
			userPassMsg.textContent = `パスワードを入力してください。`;
		}
		event.preventDefault(); // フォームの送信を止める
	}
}

);


