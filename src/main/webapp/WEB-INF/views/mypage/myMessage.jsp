<!-- myMessage.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 쪽지함 레이아웃
1.3 쪽지 내용 출력 부분
1.4 페이지 버튼 출력 부분
2. 답장 모달창
3. 쪽지내용 모달창
3. 자바스크립트 -->
<!-- myMessage.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>쪽지함</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myMessage.css">
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<!-- 1. 메인 ------------------------------------------------->
	<div class="container-fluid" style="margin-top:60px">
		<div class="row">
		<!-- 1.1 왼쪽 메뉴 ---------------------------->
			<div id="leftNav" class="col-lg-3 d-flex justify-content-center">
				<!-- header include ------------>
				<%@include file="leftNav.jsp"%>
				<!-- header include -->
			</div>
		<!-- 1.1 왼쪽 메뉴 -->
		<!-- 1.2 쪽지함 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9">
				<h1>쪽지함</h1>
				<div id="rightDivContent" class="container">
				<!-- 1.3 쪽지 내용 출력 부분 ------------------------------->
					<table class="table text-center table-hover">
						<thead class="thead-dark">
							<tr>
								<th style="width:25%">보낸사람</th>
								<th style="width:55%">쪽지 내용</th>
								<th style="width:10%">수신 날짜</th>
							</tr>
						</thead>
						<tbody id="messageList">
							<c:forEach items="${message}" var="message">
							<tr>
								<td style="display:none"><input type="hidden" value="${message.mno }" /></td>
								<td>${message.nickname}</td>
								<td class="messageContent" data-toggle="modal" data-target="#readMessage">${message.message_content}</td>
								<td>${message.writedate}</td>
								<td style="display:none"><input type="hidden" value="${message.message_content}" /></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<!-- 1.3 쪽지 내용 출력 부분 -->
				
				<!-- 1.4 페이지 버튼 출력 부분 -------------------------------->
					<nav>
						<ul id="pageNumBtnList" class="pagination justify-content-center"></ul>
					</nav>
				<!-- 1.4 페이지 버튼 출력 부분 -->
				</div>
			</div>
		<!-- 1.2 쪽지함 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
	
	<!-- 2. 답장 모달창 -------------------------------------->
	<div class="modal" id="sendMessage">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
        <!-- Modal Header -->
				<div class="modal-header">
				<h4 id="messageReplyHeader" class="modal-title">님에게 답장</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
        <!-- Modal body -->
				<div class="modal-body">
				<textarea class="form-control" rows="5" id="messageReplyContent" placeholder="내용을 입력하세요 (100자 미만)"></textarea>
				</div>
        <!-- Modal footer -->
				<div class="modal-footer">
				<span id="warn">(0/100)글자</span><button type="button" id="messageReplySendBtn" class="btn btn-info" data-dismiss="modal">답장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 2. 답장 모달창 -->
	
	<!-- 3. 쪽지 내용 모달창 -------------------------------------->
	<div class="modal" id="readMessage">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
        <!-- Modal Header -->
				<div class="modal-header">
				<h4 id="messageShowHeader" class="modal-title">님의 쪽지</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        <!-- Modal body -->
				<div class="modal-body">
					<p id="readMessageContent"></p>
				</div>
				<div class="modal-footer">
					<button type="button" id="replyMessageBtn" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-target="#sendMessage">답장</button>
				</div>
				<div id="messageInfo"></div>
			</div>
		</div>
	</div>
	<!-- 3. 쪽지내용 모달창 -->
	
<!-- 4.자바스크립트------------------------>
<%@include file="/resources/js/mypage/myMessage_js.jsp"%>
<!-- 4.자바스크립트 -->
</body>
</html>