<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<STYLE TYPE="text/css">
	.table{
	font-size: 70%;
	white-space:nowrap;
	}
	body{
	overflow: scroll;
	}
	.container{
	background-color: white;
	}
</STYLE>

<title>Insert title here</title>
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	<div id="page-wrapper" class="container" style="margin-top:60px">
		<!-- 상단 영역(추천 및 인기글 목록 테이블) ---------------------------------------------------------------------------------------------->
		<div class="row pb-3 pt-5">
			<div class="col-lg-12">
				<div class="page-header">
					<!-- 상단 영역(추천 및 인기글 목록 테이블) ----------------------------------------------------------------------------------------------><!-- 지역선택 ---------------------------------------------------------------------------------------------->
					<div class="dropdown">
						<span>지역선택 : </span>
					  		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
					   			<c:out value="${criteria.gu}"/>
					  		</button>
					  		<div class="dropdown-menu">
						    <a class="dropdown-item" href="#">구로구</a>
						    <a class="dropdown-item" href="#">영등포구</a>
						    <a class="dropdown-item" href="#">강남구</a>
						  	</div>
					 	
					</div>
					<!-- 지역선택 -->
      			</div>
     		 </div>
		</div>
		<div class="row">
			<div class="col-xl-8">
				<div class="panel panel-default ">
					<div class="panel-heading pb-3">김서울님, <c:out value="${criteria.gu}"/>의 이야기를 들어보세요!</div>
				</div>
				<div class="panel panel-body">
					<div class="row">
						<div class="col-xl-6">
							<!-- 선택된 지역의 추천수가 많은 테이블 ---------------------------------------------------------------------------------------------->
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th colspan="3">추천 수가 많은 소식</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${locationlist}" var="board" begin="0" end="5" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}"/>'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.reply_count}"/>]</b>
											</td>
											<td><c:out value="${board.like_count}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 선택된 지역의 추천수가 많은 테이블 -->
						</div>
						<div class="col-xl-6">
							<!-- 선택된 지역의 댓글수가 많은 테이블 ---------------------------------------------------------------------------------------------->
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th colspan="3">댓글 수가 많은 소식</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${locationlist}" var="board" begin="6" end="11" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.reply_count}"/>]</b>
											</td>
											<td><c:out value="${board.like_count}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 선택된 지역의 댓글수가 많은 테이블 -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="panel panel-default ">
					<div class="panel-heading pb-3">서울전체 인기 소식</div>
				</div>
				<div class="panel panel-body">
					<div class="row">
						<div class="col-xl-12">
							<!-- 서울 전지역의 인기글 테이블 ---------------------------------------------------------------------------------------------->
							<table class="table table-hover" id="dataTables-example">
								<tbody>
									<c:forEach items="${locationlist}" var="board" begin="12" end="18" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.reply_count}"/>]</b>
											</td>
											<td><c:out value="${board.like_count}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 서울 전지역의 인기글 테이블 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 영역(추천 및 인기글 목록 테이블) -->

		<!-- 하단 영역(선택지역 카테고리별 목록 테이블) ---------------------------------------------------------------------------------------------->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default ">
					<div class="panel-heading pt-5 pb-3"><c:out value="${criteria.gu}"/>의 전체이야기</div>
				</div>
				<div class="panel panel-body">
					<!-- 카테고리별 네비게이션  목록---------------------------------------------------------------------------------------------->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#all">전체</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu1">소통해요</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu2">불만있어요</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu3">모여요</a></li>
					</ul>
					<!-- 카테고리별 네비게이션  목록-->
					
					<div class="pull-right">
						<!-- 테이블 리스트 갯수 조절---------------------------------------------------------------------------------------------->
						<form action="/board/list" method='get'>
							<select  name="amount" class="selectpicker float-right" data-style="text-right"  dir="rtl">
								<option value="20"<c:out value="${pageMaker.cri.amount == '20'?'selected':''}"/>>20개씩</option>
								<option value="30" <c:out value="${pageMaker.cri.amount == '30'?'selected':''}"/>>30개씩</option>
							</select>
						</form>
						<!-- 테이블 리스트 갯수 조절-->
					</div>

					<div class="tab-content pt-4">
						<div id="all" class="tab-pane active">
							<!-- 선택지역의 카테고리(전체) 글목록---------------------------------------------------------------------------------------------->
							<table style="Width:100%"
								class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>글번호</th>
										<th>지역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>작성자</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="board">
										<tr>
											<td><c:out value="${board.bno}"/></td>
											<td><c:out value="${board.location}"/></td>
											<td><c:out value="${board.category}" /></td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.reply_count}"/>]</b>
											</td>
											<td><c:out value="${board.userid}"/></td>
											<td><c:out value="${board.view_count}"/></td>
											<td><c:out value="${board.like_count}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 선택지역의 카테고리(전체) 글목록-->
						</div>
					</div>
				</div>
				<!-- 페이징---------------------------------------------------------------------------------------------->
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button" ${pageMaker.cri.pageNum==num? "active":""}><a class="page-link" href="${num}">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<form id='actionForm' action="/board/list" method="get">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
					<input type='hidden' name='gu' value='<c:out value="${criteria.gu}"/>'>
				</form>
				<!-- 페이징-->
			</div>
			<!-- col end -->
		</div>
		<!-- 하단 영역(선택지역 카테고리별 목록 테이블) -->
		
		<div class='row'>
			<div class="col-lg-12">
				<!-- 검색---------------------------------------------------------------------------------------------->
				<form id='searchForm' action="/board/list" method='get'>
					<select name='type'>
						<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>---</option>
						<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>전체</option>
						<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>작성자</option>
						<option value="L" <c:out value="${pageMaker.cri.type eq 'L'?'selected':''}"/>>지역</option>
					</select> 
					
					<input type='text' name='keyword' /> 
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='gu' value='<c:out value="${criteria.gu}"/>'>
									
					<button class='btn btn-default'>검색</button>
				</form>
				<!-- 검색-->
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</div>
	<!--page-wrapper end  -->
</body>

<script type="text/javascript">
$(document).ready(function(){
    var actionForm = $("#actionForm");
    
    $(".paginate_button a").on("click", function(e){
  	  e.preventDefault();
  	  
  	  console.log('click');
  	  
  	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
  	  actionForm.submit();
    });
    
    var searchForm = $("#searchForm");
    $("#searchForm button").on("click", function(e){
  	  if(!searchForm.find("option:selected").val()){
  		  alert("검색종류를 선택하세요");
  		  return false;
  	  }
  	  if(!searchForm.find("input[name='keyword']").val()){
  		  alert("키워드를 입력하세요");
  		  return false;
  	  }
  	  searchForm.find("input[name='pageNum']").val("1");
  	  e.preventDefault();
  	  
  	  searchForm.submit();
  	  
    });
});
</script>
</html>