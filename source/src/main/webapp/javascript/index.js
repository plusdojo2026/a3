'use strict';

let userProfileName = document.getElementById("userProfileName");

let userProfileNameInput = document.getElementById("userProfileNameInput");

userProfileName.addEventListener("click", () => {
	userProfileName.style.display = "none";
	userProfileNameInput.style.display = "inline";
	//内容を入れる
	userProfileNameInput.value = userProfileName.textContent;
	//フォーカスする
	userProfileNameInput.focus();

});

// フォーカスがなくなったら
userProfileNameInput.addEventListener("blur", () => {

  let newValue = userProfileNameInput.value.trim();

  // 空っぽの場合、元の値を戻す
  if (newValue === "") {
    newValue = userProfileName.textContent;
  }

  //数値を統一
  userProfileName.textContent = newValue;

  //入力欄を隠す
  userProfileName.style.display = "inline";
  userProfileNameInput.style.display = "none";
});

//ボタン提出時、アニメーション効果を使用
let saveBtn=document.getElementById("saveBtn");
saveBtn.addEventListener("click", (e) => {
  e.preventDefault();

  document.getElementById("userProfile").classList.add("shake");

  setTimeout(() => {
    document.getElementById("userProfile").classList.remove("shake");
    document.getElementById("cardForm").submit();
  }, 400);
});
