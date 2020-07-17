<!-- register.jsp ---------------->
<!-- 
1. 메인
1.1 지도
1.2 작성 폼
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
<link rel="stylesheet" type="text/css" href="/resources/css/common/map/style.css">
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
	<main class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- 1.1 지도 ------------------------>
				<h3>지역 선택</h3>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
				</div>
				<!-- 카카오 지도 앱키 -->
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
				<!-- 1.1 지도 -->
				<p>이름으로 지역선택</p>
				
			</div>
			<div class="col-md-8">
				<!-- 1.2 작성 폼 ------------------>
		        <form name="frm" role="form" action="/board/register" method="Post">
		        	<h3>글쓰기</h3>
		        	<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownButton" data-toggle="dropdown">카테고리
					    <span class="caret"></span></button>
					    <input type="hidden" id="category" name="category">
					    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
					      <li role="presentation">
					      	<a role="menuitem" tabindex="-1" href="#">소통해요</a>
					      </li>
					      <li role="presentation">
					      	<a role="menuitem" tabindex="-1" href="#">불만있어요</a>
					      </li>
					      <li role="presentation">
					      	<a role="menuitem" tabindex="-1" href="#">모여요</a>
					      </li>
					      <li role="presentation">
					      	<a role="menuitem" tabindex="-1" href="#">기타</a>
					      </li>
						</ul>
					</div>
		            <input type="text" name="title" placeholder="제목"><br>      
		            <input type="hidden" name="userid" value="<c:out value='${userid}'/>">
		            <textarea name="content" id="content" cols="80" rows="10" style="width:100%; resize: none;"></textarea><br>
					<input type="hidden" id="location" name="location">
					
					<div align="right">
						<button type="submit" class="btn btn-primary" formmethod="get" formaction="/board/list" >목록으로</button>
		            	<button type="submit" class="btn btn-primary" onclick="return boardCheck()">작성</button>  
					</div>          
		        </form>
	        	<!-- 1.2 작성 폼 -->
			</div>
		</div>
	</main>
<!-- 1. 메인 -->
</body>
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/map/map_js.jsp"%>
<%@include file="/resources/js/board/board_js.jsp"%>
<!-- 2. javaScirpt -->
</html>