$(document).ready(function(){
	// 회원가입 화면, 중복체크 버튼
	$("#btnIDchk").click(function(){
		
		var userID = $("#username").val();
		
		if(userID==""){
			alert("아이디를 입력하세요.");
			$("#username").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"/member/idcheck",
			data:{"userID":userID}
		})
		.done(function(resp){
			if(resp.trim()=="yes"){
				alert('사용가능!');
				$(opener.documnet).find("#username").val(userID);
			}else{
				alert('사용불가능!');
				$("#username").val("");
				$("#username").focus();
			}
		})
		.fail(function(error){
			alert("error : "+error);
		})
	});
	
	//회원가입, 주소 검색 버튼
	$("#btnAddr").on("click",function(){
		window.open("/member/address","","width=800 height=600");
	});
	// 주소창, 주소검색 버튼
	$("#btnAddressChk").click(function(){
		var addr = $("#dong").val();
		
		if(addr==""){
			alert("동을 입력하세요.");
			$("#dong").focus();
			return false;
		}
		//동검색시, 하단에 결과 값 출력
		$.ajax({
			type:"post",
			url:"/member/searchAddr",
			data:{"dong":addr}
		})
		.done(function(resp){
			var Hstr="";
			Hstr+="<tr><th scope='col'>우편번호</th>";
			Hstr+="<th scope='col'>시도</th>";
			Hstr+="<th scope='col'>구군</th>";
			Hstr+="<th scope='col'>동</th>";
			Hstr+="<th scope='col'>번지</th></tr>";
			$("#resultArea thead").html(Hstr);
			
			var rStr="";
			$.each(resp,function(key,val){
				rStr +="<tr><th th scope='row'>"+val.zipcode+"</th>";
				rStr +="<td>"+val.sido+"</td>";
				rStr +="<td>"+val.gugun+"</td>";
				rStr +="<td>"+val.dong+"</td>";
				rStr +="<td>"+val.bunji+"</td>";
				rStr +="</tr>";
			})
			$("#resultArea tbody").html(rStr);
		})
		.fail(function(e){
			alert(e);		
		});
		// 영역 클릭시, 주소에 자동 입력
		$("#resultArea").on("click","tr",function(){
			var address = $("th:eq(0)",this).text()+" "+$("td:eq(1)",this).text()+" "+$("td:eq(2)",this).text()+" "+$("td:eq(3)",this).text()+" "+$("td:eq(4)",this).text();
			$(opener.document).find("#address").val(address);
			self.close();
		});
	});
	
	// 회원가입 화면, 회원가입버튼
	$("#btndoCreate").on("click",function(){
		if($("#username").val().trim()==""){
			alert('아이디를 입력하세요!');
			return false;
		}
		if($("#password").val().trim()==""){
			alert('비밀번호를 입력하세요!');
			return false;
		}
		if($("#membername").val().trim()==""){
			alert('이름을 입력하세요!');
			return false;
		}
		if($("#age").val().trim()==""){
			alert('나이를 입력하세요!');
			return false;
		}
		if($("#address").val().trim()==""){
			alert('주소를 입력하세요!');
			return false;
		}
		if($("#email").val().trim()==""){
			alert('이메일을 입력하세요!');
			return false;
		}
		$("#createForm").submit();
	});
	
	// 회원개인정보창, 회원정보 변경
	$("#btndoUpdate").click(function(){
		if($("#password").val().trim()==""){
			alert('비밀번호를 입력하세요!');
			return false;
		}
		if($("#membername").val().trim()==""){
			alert('이름을 입력하세요!');
			return false;
		}
		if($("#age").val().trim()==""){
			alert('나이를 입력하세요!');
			return false;
		}
		if($("#address").val().trim()==""){
			alert('주소를 입력하세요!');
			return false;
		}
		if($("#email").val().trim()==""){
			alert('이메일을 입력하세요!');
			return false;
		}

		if(confirm('Would you change the information?')){
			$("#updateForm").submit();
		}
	});
	
	// 회원 개인정보창, 회원삭제
	$("#btndoDelete").click(function(){
		if(confirm('Would you delete your account?')){
			var username = $("#username").val();
			//삭제가 참일때
			$.ajax({
				type:"DELETE",
				url:"/member/dodelete/"+username,
				contentType:"application/json;charset=utf-8"	// 서버에 보낼때 헤더 설정. json형태, utf-8인코딩
			})
			.done(function(resp){
				alert('Done deleting');
				location.href="/customLogout";
			})
			.fail(function(e){
				alert(e);
			});
		}	//if문 종결
	});

});	// document

// 관리자 회원 삭제 함수
function delmember(username){
	if(confirm('Would you delete this account?')){
		//삭제가 참일때
		$.ajax({
			type:"DELETE",
			url:"/member/dodelete/"+username,
			contentType:"application/json;charset=utf-8"	// 서버에 보낼때 헤더 설정. json형태, utf-8인코딩
		})
		.done(function(resp){
			alert('Done deleting');
			location.href="/member/allmember";
		})
		.fail(function(e){
			alert(e);
		});
	}	//if문 종결
}