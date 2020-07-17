<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<!-- Latest compiled and minified CSS ------------>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library ------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS ------------>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript ------------>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- customStyle ------------>
<link rel="stylesheet" type="text/css" href="/resources/css/common/style.css">
<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
  <!-- nav ------------>
  <nav class="navbar navbar-default fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/"><img id="logo" src="/resources/img/common/logo_1.png" alt="logo" class="mr-3 mt-3" style="width: 100px"></a>
      </div>
      <ul class="nav justify-content-end">
      	<!-- 메시지 알림 창 -------------------------------------------------------------->
      	<li class="nav-item">
      	<div class="dropdown">
      		<a id="showMiniMessageBtn" class="nav-link" data-toggle="dropdown"><i class="far fa-comments" style="font-size:1.4rem;color:white"></i><span id="noReadCount" class="badge badge-light"></span></a>
			<div id="subMessageDiv" class="dropdown-menu">
				<a class="dropdown-item" href="#">Link 1</a>
				<a class="dropdown-item" href="#">Link 2</a>
				<a class="dropdown-item" href="#">Link 3</a>
			</div>
      	</div>
      	</li>
      	<!-- 메시지 알림 창 -->
        <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
        <!-- 접속에 따라 로그인/로그아웃 버튼 토글(sec tag 필요) --------------------------------------------------------------->
        <sec:authorize access="isAuthenticated()">
	    	<form action="/logout" method="post">
	    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    		<button class="btn">로그아웃</button>
	    	</form>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
			<li class="nav-item"><a class="nav-link" href="/subLogin">Login</a></li>
        </sec:authorize>
        <!-- 접속에 따라 로그인/로그아웃 버튼 토글 -->
      </ul>
    </div>
  </nav>
  <!-- nav -->

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
			<div class="modal-footer" style="display:initial">
				<button type="button" id="deleteMessageBtn" class="btn btn-danger float-left" data-toggle="modal" data-dismiss="modal">삭제</button>
				<button type="button" id="replyMessageBtn" class="btn btn-primary float-right" data-toggle="modal" data-dismiss="modal" data-target="#sendMessage">답장</button>
			</div>
			<div id="messageInfo"></div>
		</div>
	</div>
</div>
<!-- 3. 쪽지내용 모달창 -->



<!-- 자바스크립트------------------------>
<%@include file="/resources/js/messageAlert_js.jsp"%>
<!-- 자바스크립트 -->
</body>
</html>