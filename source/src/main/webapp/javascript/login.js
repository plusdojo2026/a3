'use strict';

const loginForm = document.getElementById('loginForm');

let userIdMsg = document.getElementById('userIdMsg');
let userPassMsg = document.getElementById('userPassMsg');

let notNullRegex = /^(?!\s*$).+/;

loginForm.addEventListener('submit', (event) => {

  userPassMsg.textContent = '';
  userIdMsg.textContent = '';

  let userId = loginForm.userId.value;
  let userPass = loginForm.userPass.value;

  let hasError = false; 

  //空チェック
  if (!notNullRegex.test(userId)) {
    userIdMsg.textContent = 'IDを入力してください。';
    hasError = true;
  }

  if (!notNullRegex.test(userPass)) {
    userPassMsg.textContent = 'パスワードを入力してください。';
    hasError = true;
  }

  if (hasError) {
    event.preventDefault();
  }

});