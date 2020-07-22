<!-- register.jsp ---------------->
<!-- 
1. 메인
1.1 지도
1.1.1 이름으로 지역선택
1.1.1.1 구선택
1.1.1.2 동선택
1.2 작성 폼
1.2.1 카테고리 선택
1.3 취소버튼
2. javaScript -->
<!-- register.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- customStyle ------------>
<link rel="stylesheet" type="text/css" href="/resources/css/map/style.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board/style.css">
<!-- include summernote css -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet">

</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
	<main class="container">
		<div class="row">
			<div class="col-md-4" id="leftside">
				<!-- 1.1 지도 ------------------------>
				<p id="map_choice">지역선택</p>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <!-- 카카오 지도 앱키 -->
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
				</div>
				<!-- 1.1 지도 -->
				<!-- 1.1.1 이름으로 지역선택 --------------->
				<div id="name_choice">
					<!-- 1.1.1.1 구선택 ------------->
					<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectGu" data-toggle="dropdown">구
					    <span class="caret"></span></button>
				    	<div id="gu" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    	<a class="dropdown-item" href="#">강남구</a>
							<a class="dropdown-item" href="#">강동구</a>
							<a class="dropdown-item" href="#">강북구</a>
							<a class="dropdown-item" href="#">강서구</a>
							<a class="dropdown-item" href="#">관악구</a>
							<a class="dropdown-item" href="#">광진구</a>
							<a class="dropdown-item" href="#">구로구</a>
							<a class="dropdown-item" href="#">금천구</a>
							<a class="dropdown-item" href="#">노원구</a>
							<a class="dropdown-item" href="#">도봉구</a>
							<a class="dropdown-item" href="#">동대문구</a>
							<a class="dropdown-item" href="#">동작구</a>
							<a class="dropdown-item" href="#">마포구</a>
							<a class="dropdown-item" href="#">서대문구</a>
							<a class="dropdown-item" href="#">서초구</a>
							<a class="dropdown-item" href="#">성동구</a>
							<a class="dropdown-item" href="#">성북구</a>
							<a class="dropdown-item" href="#">송파구</a>
							<a class="dropdown-item" href="#">양천구</a>
							<a class="dropdown-item" href="#">영등포구</a>
							<a class="dropdown-item" href="#">용산구</a>
							<a class="dropdown-item" href="#">은평구</a>
							<a class="dropdown-item" href="#">종로구</a>
							<a class="dropdown-item" href="#">중구</a>
							<a class="dropdown-item" href="#">중랑구</a>
						</div>
					</div>
					<!-- 1.1.1.1 구선택 -->
					<!-- 1.1.1.2 동선택 ------------->
					<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectDong" data-toggle="dropdown">동
					    	<span class="caret"></span>
					    </button>
				    	<div id="dong" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						</div>
					</div>
					<!-- 1.1.1.2 동선택 -->
				</div>
				<!-- 1.1.1 이름으로 지역선택 -->				
			</div>
			<div class="col-md-8">
				<!-- 1.2 작성 폼 ------------------>
		        <form name="frm" role="form" action="/board/register" method="Post">
       				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        	<p id="writer">글쓰기</p>
		        	<!-- 1.2.1 카테고리 선택 -------->
		        	<div class="dropdown" id="category_wrap">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectcategory" data-toggle="dropdown">카테고리
					    	<span class="caret"></span>
					    </button>
					    <input type="hidden" id="category" name="category" value="<c:out value='${board.category}'/>">
				    	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    	<a class="dropdown-item" href="#">소통해요</a>
					    	<a class="dropdown-item" href="#">불만있어요</a>
					    	<a class="dropdown-item" href="#">모여요</a>
						</div>
					</div>
					<!-- 1.2.1 카테고리 선택 -->
		            <input type="text" id="title" name="title" placeholder="제목"><br><!-- 글제목 -->      
		            <input type="hidden" name="userid" value="<c:out value='${userid}'/>"><!-- 유저아이디 -->
					<textarea name="content" id="content" class="summernote" cols="80" rows="15"></textarea><br><!-- 글내용 -->
					<input type="hidden" id="location" name="location" value="<c:out value='${board.location}'/>"><!-- 지역 -->
					<button type="submit" class="btn btn-primary bottomButton" onclick="return boardCheck()">작성</button><!-- 작성버튼 -->
		        </form>
		        <!-- 1.2 수정 폼 -->
		        <!-- 1.3 취소버튼 ----------->
		        <form role="form" action="/board/list" method="get">
		        	<button type="submit" class="btn btn-primary bottomButton">취소</button>
		        </form>
	        	<!-- 1.3 취소버튼 -->
			</div>
		</div>
	</main>
<!-- 1. 메인 -->
</body>
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/map/map_js.jsp"%>
<%@include file="/resources/js/board/board_js.jsp"%>
<!-- include summernote js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/board/summernote-ko-KR.js"></script>
<!-- 2. javaScirpt -->
</html>