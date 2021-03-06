<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>    
<div id="welcome">
	<h2>게시글 상세보기</h2>
</div>
	<div id="one-column">
		<div id="content">
				<c:choose>
				<c:when test="${sessionScope.grade==1}">
				<form action="boardUpdate.do" id="boardupdateForm" method="get">
				<input type="hidden" value="${detail.bnum}" name="bnum" id="bnum">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" value="${detail.userid}" readonly="readonly" name="buserid" id ="buserid" size=8></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" id="subject" value="${detail.subject}" size="47" style="font-size: 20px"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" name="bcontent" id="bcontent" value="${detail.content}"  size="50" style="font-size: 15px; height: 50px"></td>
						</tr>				
					</table>
					<input type="button" class="allbutton" value="수정하기" id="boardupdateBtn">
				</form>
				</c:when>
				<c:otherwise>		
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" value="${detail.userid}" readonly="readonly" name="buserid" id ="buserid" size=8></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" id="subject" value="${detail.subject}" size="47" style="font-size: 20px" readonly="readonly"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" name="bcontent" id="bcontent" value="${detail.content}" style="font-size: 15px" readonly="readonly"></td>
						</tr>				
					</table>
				</c:otherwise>
				</c:choose>
				<input type="button" class="allbutton" value="게시글목록" id="boardlistBtn">
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>