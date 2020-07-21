<!-- mylist.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 나의 게시글 레이아웃
2. 자바스크립트 -->
<!-- profile.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 게시글 보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myList.css">
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	<div style="position:fixed"><img src="/resources/img/mypage/left_background.png"></div>
	<!-- 1. 메인 ------------------------------------------------->
	<div class="container pt-0">
		<div class="row">
		<!-- 1.1 왼쪽 메뉴 ---------------------------->
			<div id="leftNav" class="col-lg-3">
				<!-- header include ------------>
				<%@include file="leftNav.jsp"%>
				<!-- header include -->
			</div>
		<!-- 1.1 왼쪽 메뉴 -->
		<!-- 1.2 나의 게시글 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9 p-5">
				<h1>나의 게시글</h1>
				<div id="rightDivContent" class="mt-5">
				<div class="content-box">
					<table class="table text-center table-hover">
						<thead class="thead">
							<tr>
								<th>지역</th>
								<th>키테고리</th>
								<th>제목</th>
								<th>추천</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="messageList">
							<c:forEach items="${board}" var="board">
							<tr>
								<td style="display:none">${board.bno}</td>
								<td>${board.location }</td>
								<td>${board.category}</td>
								<td><span class="boardTitle">${board.title}</span> [${board.reply_count}]</td>
								<td>${board.like_count}</td>
								<td>${board.regdate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<!-- 1.3 페이지 버튼 출력 부분 -------------------------------->
					<nav>
						<ul id="pageNumBtnList" class="pagination justify-content-center"></ul>
					</nav>
				<!-- 1.3 페이지 버튼 출력 부분 -->
				</div>
				</div>
			</div>
		<!-- 1.2 나의 게시글 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
<!-- 2.자바스크립트------------------------>
<%@include file="/resources/js/mypage/myList_js.jsp"%>
<!-- 2.자바스크립트 -->
</body>
</html>