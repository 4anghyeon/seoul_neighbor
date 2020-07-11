<!-- profile.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 프로필 레이아웃
2. 자바스크립트 -->
<!-- profile.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- profile.css -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/profile.css">
<title>프로필</title>
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<!-- 1. 메인 ------------------------------------------------->
	<div class="container-fluid">
		<div class="row">
		<!-- 1.1 왼쪽 메뉴 ---------------------------->
			<div id="leftNav" class="col-lg-3 d-flex justify-content-center">
				<!-- header include ------------>
				<%@include file="leftNav.jsp"%>
				<!-- header include -->
			</div>
		<!-- 1.1 왼쪽 메뉴 -->
		<!-- 1.2 프로필 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9">
				<h1>프로필</h1>
				<div id="rightDivContent" class="container-fluid">
				</div>
			</div>
		<!-- 1.2 프로필 레이아웃 ---------------------------------->
		</div>
	</div>
	<!-- 1. 메인 -->
	
</body>
</html>