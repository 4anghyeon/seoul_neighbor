<!-- index.jsp ---------------->
<!-- 
1. 메인
1.1 로그인 폼
1.2 일러스트
1.3 비회원 접속 폼
2. javaScript -->
<!-- index.jsp -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
	<title>Home</title>
</head>

<body>
	<!-- header include ------------>
	<%@include file="common/header.jsp"%>
	<!-- header include -->

	<!-- 1. main ---------------->
	<main class="container">
		<h1 class="text-center">반가워요 이웃!</h1>

		<div class="row">
			<div class="col-md-6">
				
				<!-- 1.1 로그인 폼 ---------------->
				<h4>로그인</h4>
				<form method="post" action="login">
					<div class="form-group">
						<input class="form-control" type="text" name="id" placeholder="Id" />
					</div>

					<div class="form-group">
						<input class="form-control" type="password" name="pwd" placeholder="Password" />
					</div>

					<div class="form-group">
						<input class="btn btn-primary" type="submit" name="login" value="로그인" />
						<input class="btn btn-primary" type="submit" name="idFind" value="ID/PW 찾기" />
					</div>
				</form>
				<!-- 1.1 로그인 폼 -->
			</div>

			<!-- 1.2 일러스트 ------------------>
			<div class="col-md-6">
				<img src="/resources/img/common/main_img.jpg">
			</div>
			<!-- 1.2 일러스트 -->
			
			<div class="col-md-6">
				<h4>비회원</h4>

				<!-- 1.3 비회원 접속 폼 ----------------------->
				<form method="post" action="home.html">
					<div class="form-group">
						<input class="form-control" type="text" name="location" placeholder="Location" />
					</div>

					<div class="form-group">
						<input class="btn btn-success" type="submit" name="register" value="접속"/>
					</div>
				</form>
				<!-- 1.3 비회원 접속 폼 -->
			</div>

		</div>
	</main>
	<!-- ./main -->
</body>
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/index_js.jsp"%>
<!-- 2. javaScirpt -->
</html>