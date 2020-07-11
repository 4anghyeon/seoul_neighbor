<!-- leftNav.jsp ---------------->
<!-- 
1. 왼쪽 메뉴
1.1 프로필 이미지
1.2 메뉴바
2. 드롭다운 버튼
3. 자바스크립트 -->
<!-- leftNav.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- leftNav.css -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/left_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/right_div.css">
</head>
<body>
<!-- 1.왼쪽 메뉴 ---------------------------------------------->
	<div id="leftNavContainer" class="container-fluid">
	<!-- 1.1 프로필 이미지 --------------------------->
		<div id="profileImg" class="card text-center">
		  <img class="card-img-top" src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
		  <div class="card-body">
				    <p class="card-title">회원님 안녕하세요?</p>
		  </div>
		</div>
	<!-- 1.1 프로필 이미지 -->
	
	<!-- 1.2 메뉴바 ----------------------------->
		<div id="leftNavBar" class="container-fluid">
			<ul class="nav flex-column">
		    <li class="nav-item">
		    	<a class="nav-link" href="/profile">프로필</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="/mylist">나의 게시글 보기</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="/myMessage">쪽지함</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="/myQA">1:1 문의</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="/myPassword">비밀번호 변경</a>
		    </li>
		    </ul>
		</div>
	<!-- 1.2 메뉴바 -->
	</div>
<!-- 1.왼쪽 메뉴 -->

<!-- 2. 드롭다운 버튼 --------------------------------->
	<button id="dropDownBtn" class="btn btn-secondary justify-content-center"><i id="dropDownBtnIcon" class="fas fa-angle-right"></i></button>
<!-- 2. 드롭다운 버튼 -->


<!-- 3.자바스크립트------------------------>
<%@include file="/resources/js/mypage/left_nav_js.jsp"%>
<!-- 3.자바스크립트 -->
</body>
</html>