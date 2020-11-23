$(document).ready(function(){
	

	$("#btnLogin").click(function(){
		var userID = $("#username").val();
		var password = $("#password").val();
		if(userID==""){
			alert('아이디를 입력하세요!');
			$("#username").focus();
			return false;
		}
		if(password==""){
			alert('비밀번호를 입력하세요!');
			$("#password").focus();
			return false;
		}
		// 로그인 판단
		loginDo($("#username").val(),$("#password").val());
	});
	
	
});

function loginDo(username,password){
	// 값이 있으면, 해당 컨트롤러에서 처리후 결과 받음
		$.ajax({
			type:"POST",
			url:"/login",
			data:{"username":username,"password":password}	
		})
		.done(function(resp){
			if(resp=="go"){
				alert('Welcome!');
				location.href="/";
			}else{
				alert('Pleae check your info');
			}
		})
		.fail(function(e){
			alert("Please Check your Account");
		});
}

