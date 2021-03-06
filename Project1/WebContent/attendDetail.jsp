<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div id="welcome">
	<h2>${sessionScope.userid}님 현재 예약 상태</h2>
</div>
<div id="one-column">
	<div id="content">
			<input type="button" class="allbutton" value="행사목록" id="eventsListBtn">
		<form>
			<table border="2">
				<tr>
					<th>성명</th>
					<th>예약 인원</th>
					<th>행사 이름</th>
					<th>행사 일정</th>
					<th>행사 장소</th>
					<th>취소</th>
				</tr>
				<c:forEach items="${userinfo}" var="info">
				<input type="hidden" value="${info.eventnum}" name="attendeventnum">
					<tr>
						<td>${info.username}</td>
						<td>${info.population}</td>
						<td>${info.eventname}</td>
						<td>${info.eventsche}</td>
						<td>${info.eventlocation}</td>
						<td><a href="attendanceDelete.do?renum=${info.renum}">취소</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>