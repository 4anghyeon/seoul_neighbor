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
		<!-- 1.2 나의 게시글 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9">
				<h1>나의 게시글</h1>
				<div id="rightDivContent" class="container">
						<table class="table text-center table-hover">
						<thead class="thead-dark">
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
								<td>${board.location }</td>
								<td>${board.category}</td>
								<td>${board.title}</td>
								<td>${board.like_count}</td>
								<td>${board.regdate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		<!-- 1.2 나의 게시글 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
</body>
</html>