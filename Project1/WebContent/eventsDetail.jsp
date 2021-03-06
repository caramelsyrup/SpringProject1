<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div id="welcome">
	<h2>행사 정보</h2>
</div>
<div id="one-column">
	<div id="area">
	<form action="eventDelete.do" method="get" id="eventDeleteform">
	<input type="hidden" name="eventnum" id="eventnum" value="${event.eventnum}">
	<input type="hidden" name="limit" id="limit" value="${event.eventheadcount-numberattend}">
		<h3>${event.eventname}</h3>
		<p><span><b>참석 최대 인원 - </b></span><span style="font-size: 1.2em; font-weight: bold; color: red;">${event.eventheadcount-numberattend}</span>명</p>
		<p>${event.eventsche}</p>
		<p>${event.eventhost}</p>
		<p>${event.eventlocation}</p>
		<p>${event.eventdescip}</p>
		<p>
			<input type="button" class="allbutton" id="eventsListBtn" value="목록">
			<c:if test="${sessionScope.grade==1}">
				<input type="button" class="allbutton" id="eventDeleteBtn" value="삭제하기">
			</c:if>
			<c:if test="${sessionScope.grade==0}">
				<input type="button" class="allbutton" id="attendBtn" value="참석하기">
			</c:if>
		</p>
		<img src="<c:url value="/images/${event.filename}"/>">
	</form>	
	</div>
</div>

<%@ include file="../include/footer.jsp"%>