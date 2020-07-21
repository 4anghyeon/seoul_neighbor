<!-- myPassword.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 비밀번호 변경 레이아웃
2. 자바스크립트 -->
<!-- myPassword.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<!-- myPassword.css -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myPassword.css">
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
		<!-- 1.2 비밀번호 변경 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9 p-5">
				<h1>비밀번호 변경</h1>
				<div id="rightDivContent" class="container mt-5">
				<div class="content-box">
					<form id="changePasswordForm" method="post" action="changePassword">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="userid" value="${member.userid }">
						<h3><span style="color:red"> * </span>현재 비밀번호</h3>
						<div class="row">
							<div class="col-md-6">
							<input type="password" id="nowPassword" name="userpw" class="form-control" />
							</div>
							<div class="col-md-6" style="line-height:38px"><span id="showChangeResult"></span></div>
						</div>
						<h3><span style="color:red"> * </span>변경 할 비밀번호</h3>
						<div class="row">
							<div class="col-md-6">
							<input type="password" id="changePassword" name="changePw" class="form-control" />
							</div>
							<div class="col-md-6"><span id="showVerifyResult"></span></div>
						</div>
						<h3><span style="color:red"> * </span>변경 할 비밀번호 확인</h3>
						<div class="row">
							<div class="col-md-6">
							<input type="password" id="changePasswordCheck" class="form-control" />
							</div>
							<div class="col-md-6" style="line-height:38px"><span id="showCompareResult"></span></div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button id="passwordChangeBtn" class="btn">비밀번호 변경</button>
							</div>
						</div>
					</form>
				</div>
				</div>
			</div>
		<!-- 1.2 비밀번호 변경 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/mypage/myPassword_js.jsp"%>
<!-- 2. javaScirpt -->
</body>
</html>