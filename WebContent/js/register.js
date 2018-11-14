/* 身份证号绑定事件 */
$('[name="cardId"]').on('blur', checkCardId);
/* 用户名 */
$('[name="userName"]').on('blur', checkName);
/* 密码绑定事件 */
$('[name="password"]').on('blur', checkPwd);
/* 确认密码框绑定事件 */
$('.checkAgain').on('blur', checkPwd2);
/* 提交按钮绑定事件 */
$('[type="submit"]').on('click', check);

/* 提交确认的标志 */
var boolean1 = false;
var boolean2 = false;
var boolean3 = false;
var boolean4 = false;

function checkCardId() {
	var id = $('[name="cardId"]').val().trim();
	var msg = "";

	if (id == "") {
		msg = "内容不能位空"
		boolean1 = false;
	} else {
		boolean1 = /^\d{18}$/.test(id);
		if (!boolean1) {
			msg = "请输入18位有效数字";
			boolean1 = false;
		} else {
			$.post("../../registerCheck", "cardId="
					+ $('[name="cardId"]').val(), function(text) {
				if (text != "") {
					$('[name="cardId"]').parent().next().html(text).css(
							"color", "red");
				}
			}, "text");
		}
	}

	showResult('[name="cardId"]', boolean1, msg);

}
function checkName() {
	var name = $('[name="userName"]').val().trim();
	if (name == "") {
		msg = "内容不能位空"
		boolean4 = false;
	} else {
		boolean4 = true;
	}

	showResult($('[name="userName"]'), boolean4, msg);
}

//辅助密码第二次查询
var count=0;
function checkPwd() {
	var pwd = $('[name="password"]').val().trim();
	var msg = "";
	if (pwd == "") {
		msg = "内容不能位空";
		boolean2 = false;
	} else if (pwd.length < 6) {
		msg = "密码至少6位";
		boolean2 = false;
	} else {
		boolean2 = true;
	}
	showResult('[name="password"]', boolean2, msg);
	//查询确认密码
	if(boolean3){
		checkPwd2();
		count++;
	}else if(count!=0){
		checkPwd2();
	}
}

function checkPwd2() {
	var pwd = $('[name="password"]').val().trim();
	var pwd2 = $('.checkAgain').val().trim();
	if (pwd2 == "") {
		msg = "内容不能位空"
		boolean3 = false;
	} else if (pwd2.length < 6) {
		msg = "密码至少6位";
		boolean3 = false;
	}else if (pwd2 != pwd) {
		msg = "两次密码输入不一致!";
		boolean3 = false;
	} else {
		boolean3 = true;
	}
	showResult('.checkAgain', boolean3, msg);
}

function check() {
	checkCardId();
	checkPwd();
	checkPwd2();
	checkName();
	if (!(boolean1 && boolean2 && boolean3 && boolean4)) {
		alert("内容不能为空或输入有误。");
		return false;
	} else {
		return confirm('确认提交？');
	}
}

function showResult(selector, flag, msg) {
	if (flag) {
		$(selector).parent().next().html("");
	} else {
		$(selector).parent().next().html(msg).css("color", "red");
	}
}
