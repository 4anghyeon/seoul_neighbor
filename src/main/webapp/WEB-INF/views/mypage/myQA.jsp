<!-- myQA.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 1:1 문의 레이아웃
2. 자바스크립트 -->
<!-- myQA.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
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
		<!-- 1.2 1:1 문의 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9">
				<h1>1:1 문의</h1>
				<div id="rightDivContent" class="container-fluid">
				</div>
			</div>
		<!-- 1.2 1:1 문의 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
</body>
</html>