<!-- myMessage.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 쪽지함 레이아웃
2. 자바스크립트 -->
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
				
					<table class="table text-center">
						<thead class="thead-dark">
							<tr>
								<th style="width:15%">보낸사람</th>
								<th style="width:70%">쪽지 내용</th>
								<th style="width:15%">수신 날짜</th>
							</tr>
						</thead>
						<tbody id="messageList">
							<c:forEach items="${message}" var="message">
							<tr>
								<td>${message.sender}</td>
								<td>${message.message_content}</td>
								<td>${message.writedate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
						<ul id="pageNumBtnList" class="pagination justify-content-center">
						</ul>
					</nav>
				</div>
			</div>
		<!-- 1.2 쪽지함 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
<!-- 2.자바스크립트------------------------>
<%@include file="/resources/js/mypage/myMessage_js.jsp"%>
<!-- 2.자바스크립트 -->
</body>
</html>