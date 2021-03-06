<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div id="welcome">
	<h2>예약 확인 정보</h2>
</div>
<div id="one-column">
	<div id="content">
		<form action="attendadd.do" name="attendForm" id="attendForm" method="post">
			<input type="hidden" name="attendeventnum" value="${eventinfo.eventnum}">
			<h4>회원 아이디</h4>
			<input type="text" name="attenduserid" value="${memberinfo.userid}" readonly="readonly">
			<h4>회원 성명</h4>
			<input type="text" name="attendusername" value="${memberinfo.username}" readonly="readonly">
			<h4>행사 참석 인원</h4>
			<input type="text" name="attendNumber" value="${population}" readonly="readonly">
			<h4>행사 이름</h4>
			<input type="text" name="attendeventname" value="${eventinfo.eventname}" readonly="readonly">
			<h4>행사 시작일</h4>
			<input type="text" name="attendeventsche" value="${eventinfo.eventsche}" readonly="readonly">
			<h4>행사 장소</h4>
			<input type="text" name="attendeventlocation" value="${eventinfo.eventlocation}" readonly="readonly">
			<br>
			<input type="submit" class="allbutton" value="결정" id="confirmattendBtn">
			<input type="button" class="allbutton" value="취소" id="canceladttendBtn">
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>