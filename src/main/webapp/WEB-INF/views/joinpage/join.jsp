<!-- 
	*회원가입페이지*
	작성자 강민성
	
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울이웃 회원가입</title>

<!-- 회원가입페이지 전용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/join/join.css">

<!-- 다음 주소검색 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<!-- 1. 회원가입 --------------------->
	<div class="container wrapper">
		<form class="justify-content-center" action="/join" method="POST" onsubmit="return verifyAll();">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- 1.1 상단 로고 이미지 ------------->
			<div class="headimg">
                <img src="/resources/img/common/logo_1.png" alt="">
            </div>
            <!-- 1.1 상단 로고 이미지 -->
            
            <!-- 아이디 입력 칸 ------------------>
            <div class="input-group mb-3">
	            <div class="input-container">
	                <label for="userId"><i class="fas fa-mobile-alt icon"></i></label>
	                <input id="userId" name="userid" type="text" class="input-field" placeholder="아이디 입력" maxlength="20" onfocusout="verifyID()">
	                <i id="userIdV" class="fas fa-check vCheck-icon"></i>
	                <span class="focus-on-input"></span>
	            </div>
	            <p id="userId-wrong-text" class="wrong-text-hide">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            <p id="userId-duplicated-text" class="wrong-text-hide">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
			</div>
			<!-- 아이디 입력 칸 -->
			
			<!-- 닉네임 입력 칸 ------------------>
			<div class="input-group mb-3">
	            <div class="input-container">
	                <label for="nickName"><i class="far fa-user icon"></i></label>
	                <input id="nickName" name="nickname" type="text" class="input-field" placeholder="닉네임 입력" maxlength="10" onfocusout="verifyNickName()">
	                <i id="nickNameV" class="fas fa-check vCheck-icon"></i>
	            </div>
	            <p id="nickName-wrong-text" class="wrong-text-hide">닉네임을 정확히 입력하세요.(2~10글자)</p>
	            <p id="nickName-duplicated-text" class="wrong-text-hide">중복된 닉네임입니다. 다른 닉네임을 입력하세요</p>
			</div>
			<!-- 닉네임 입력 칸 -->
		
			<!-- 이메일 입력 칸 ------------------>
			<div class="input-group mb-3">
				<div class="input-container">
                	<label for="email"><i class="far fa-envelope icon"></i></label>
                	<input id="email" name="email" type="text" class="input-field" placeholder="이메일 주소 입력" onfocusout="verifyEmail()">
                	<i id="emailv" class="fas fa-check vCheck-icon"></i>
            	</div>
            	<p id="email-wrong-text" class="wrong-text-hide">이메일을 형식이 맞지 않습니다.</p>
			</div>
			<!-- 아이디 입력 칸 -->
			
			<!-- 비밀번호 ----------------------------->
			<div class="input-group mb-3">
            <div class="input-container">
                <label for="pw"><i class="fas fa-shield-alt icon"></i></label>
                <input id="pw" name="userpw" type="password" class="input-field" placeholder="비밀번호(영문 숫자 특수문자 섞어서 6~15자 이내)"
                    maxlength="15" onfocusout="verifyPW()">
                <i id="pwv" class="fas fa-check vCheck-icon"></i>
            </div>
            <p id="pw-wrong-text" class="wrong-text-hide">비밀번호(영문 숫자 특수문자 섞어서 6~15자 이내)</p>
			</div>
			<!-- 비밀번호 -->
			
			<div class="input-group mb-3">
            <div class="input-container">
                <label for="pwcheck"><i class="fas fa-shield-alt icon"></i></label>
                <input id="pwcheck" type="password" class="input-field" placeholder="비밀번호 확인"
                    onfocusout="verifyPWcheck()">
                <i id="pwcv" class="fas fa-check vCheck-icon"></i>
            </div>
            <p id="pwc-wrong-text" class="wrong-text-hide">비밀번호가 일치하지 않거나 형식에 맞지 않습니다.</p>
			</div>
					
			<div class="input-group mb-3">
	            <div class="input-container">
	                <label for="memberLocation"><i class="fas fa-mobile-alt icon"></i></label>
	                <input id="memberLocation" name="member_location" type="text" class="input-field" placeholder="관심 지역 선택" readonly>
	                <i id="locationV" class="fas fa-check vCheck-icon"></i>
	            </div>
	            <p id="location-wrong-text" class="wrong-text-hide">지역을 선택해 주세요</p>
			</div>
			
           <button type="submit" class="btn btn-primary">동의하고 가입하기</button>
           
			
            <div class="instruction">
                개인정보 수집 및 이용 개인정보 제공내용을 확인 하였으며, <b>동의합니다.</b>
            </div>
            <div class="copyright">
                ©JustDo! Corp. All rights reserved.
            </div>






		</form>
	</div>
	<!-- 회원가입 -->
	

	<!-- 2. javaScript ------------------------------>
	<%@include file="/resources/js/join/join_js.jsp"%>
	<!-- 2. javaScirpt -->
</body>
</html>