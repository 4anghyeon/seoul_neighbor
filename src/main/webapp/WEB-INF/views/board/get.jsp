<!-- get.jsp ---------------->
<!-- 
1. 메인
1.1 조회 폼 -->
<!-- get.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 본문 ------------------------>
<main class="container">
	<div>
		<!-- 1.1 조회 폼 ------------------>
		<form role="form" action="/board/modify" method="get">		
			<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>">			
			<input type="text" name="title" value="<c:out value='${board.title}'/>" readonly><br>			
			<input type="text" name="userid" value="<c:out value='${board.userid}'/>" readonly><br>			
			<textarea name="content" id="content" cols="30" rows="10" readonly><c:out value='${board.content}' /></textarea><br>
			<input type="hidden" name="category" value="<c:out value='${board.category}'/>">
			<input type="hidden" name="category" value="<c:out value='${board.location}'/>">
			
			<button>수정하기</button>			
			<button formmethod="POST" formaction="/board/remove">삭제</button>			
			<button formaction="/board/list">목록으로</button>
		</form>
		<!-- 1.1 조회 폼 -->
	</div>
</main>
<!-- 본문 -->
</body>
</html>