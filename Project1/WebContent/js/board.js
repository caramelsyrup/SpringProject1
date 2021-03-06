$(document).ready(function(){
	getbpage(1,"","");
	// 게시글리스트에서 글쓰기버튼
	$("#boardinsertBtn").click(function(){
		//get방식으로 단순히 이동.
		location.href="boardInsert.do";
	});
	
	// 검색 버튼
	$("#bbtnSearch").click(function(){
		getbpage(1,$("#bfield").val(),$("#bword").val());
	});
	// 게시글 쓰기 폼에서 작성완료
	$("#boardInsertBtn").click(function(){
		if($("#subject").val()==""){
			alert('제목을 입력하세요.');
			$("#subject").focus();
			return false;
		}
		if($('textarea[name=bcontent]').val()==""){
			alert('내용을 입력하세요.');
			$("#bcontent").focus();
			return false;
		}
		$("#boardInsertForm").submit();
	});
	//게시글 목록
	$("#boardlistBtn").click(function(){
		location.href="boardList.do";
	});
	// 게시글 수정
	$("#boardupdateBtn").click(function(){
		$("#boardupdateForm").submit();
	});
	
});

// 페이징
function getbpage(pageNum,bfield,bword){
	
	$.get("boardList.do",
			  {"bpageNum":pageNum,"bfield":bfield,"bword":bword}, 
			  function(c){
				  // d =  eventslist.do 서버 로직의 결과를 eventslist.jsp 담은 데이터 저장됨
				  var dummyDom = document.getElementsByClassName("dummy")[0];
				  // 가공을 위한 dummy div tag에 저장
				  dummyDom.innerHTML=c;
				  // 그림 및 페이정보만 담김 태그 데이터들을 저장
				  var resultDom = dummyDom.getElementsByClassName("bone-column")[0].innerHTML;
				  // 우리가 노출할 화면에 저장
				  document.getElementsByClassName("bone-column")[0].innerHTML = resultDom;
				  // 저장후 데이터 날림
				  dummyDom.innerHTML = "";
			  }
		);

}