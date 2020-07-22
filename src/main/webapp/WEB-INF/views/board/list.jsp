<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<STYLE TYPE="text/css">
.table {
	font-size: 70%;
	white-space: nowrap;
}

.collapsing-parallax {
	height: 350px;
	width: 100%;
	background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/565097/background.png")
		center center no-repeat;
	background-color: rgb(33,14,61);
	background-size: cover;
	z-index: 99;
}

.navbar-default{
 background-color: rgba(255,255,255,0) !important;
 transition: 1s;
}
.cardview{
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.18),
		0px 4px 14px 0px rgba(0, 0, 0, 0.15);
}
</STYLE>

<title>Insert title here</title>
</head>
<body>
 <header id="parallax_main" class="collapsing-parallax">

	<div id="includehe">
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
</div>
</header>
<main id="#content" class="site-main" role="main">
	<div id="page-wrapper" class="container" style="margin-top:60px">
		<!-- 상단 영역(추천 및 인기글 목록 테이블) ---------------------------------------------------------------------------------------------->
		<div class="row pb-3 pt-5">
			<div class="col-lg-12">
				<div class="page-header">
					<!-- 상단 영역(추천 및 인기글 목록 테이블) ---------------------------------------------------------------------------------------------->
					
						<div class="form-row">
						<span class="mr-4" style="text-align: center;"><b>지역선택 : </b></span>
									<select id="selectGu" style="Width:20%" name="gu" class="form-control selectBox" 
									onchange="document.location='list?amount=<c:out value="${pageMaker.cri.amount}"/>&gu='+this.value;">
										<option selected><c:out value="${criteria.gu}"/></option>
										<option value="강남구">강남구</option>
										<option value="강동구">강동구</option>
										<option value="강북구">강북구</option>
										<option value="강서구">강서구</option>
										<option value="관악구">관악구</option>
										<option value="광진구">광진구</option>
										<option value="구로구">구로구</option>
										<option value="금천구">금천구</option>
										<option value="노원구">노원구</option>
										<option value="도봉구">도봉구</option>
										<option value="동대문구">동대문구</option>
										<option value="동작구">동작구</option>
										<option value="마포구">마포구</option>
										<option value="서대문구">서대문구</option>
										<option value="서초구">서초구</option>
										<option value="성동구">성동구</option>
										<option value="성북구">성북구</option>
										<option value="송파구">송파구</option>
										<option value="양천구">양천구</option>
										<option value="영등포구">영등포구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="종로구">종로구</option>
										<option value="중구">중구</option>
										<option value="중랑구">중랑구</option>
									</select>
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
							<table class="table table-striped table-bordered table-hover cardview" id="dataTables-example">
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
							<table class="table table-striped table-bordered table-hover cardview" id="dataTables-example">
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
							<table class="table table-hover cardview" id="dataTables-example">
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
					<ul class="nav nav-tabs" role="tablist" id="mytab">
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
						<form id="searchFormNum" action="/board/list" method='get'>
							<select  name="amount" class="selectpicker float-right" data-style="text-right"  dir="rtl">
								<option value="20"<c:out value="${pageMaker.cri.amount == '20'?'selected':''}"/>>20개씩</option>
								<option value="30" <c:out value="${pageMaker.cri.amount == '30'?'selected':''}"/>>30개씩</option>
							</select>
							<input type='hidden' name='gu' value='<c:out value="${criteria.gu}"/>'>
						</form>
						<!-- 테이블 리스트 갯수 조절-->
					</div>
					<div class="tab-content pt-4">
						<div id="all" class="navlinktab tab-pane active">
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
						
						<div id="menu1" class="navlinktab tab-pane fade">
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

									
								</tbody>
							</table>
						</div>
						<div id="menu2" class="navlinktab tab-pane fade">
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

									
								</tbody>
							</table>
						</div>
						<div id="menu3" class="navlinktab tab-pane fade">
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

									
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<!-- 페이징---------------------------------------------------------------------------------------------->
				<div class='float-none'>
				<button id="regBtn" type="button" class="btn btn-success btn-xs float-right">글쓰기</button>
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
	</main>
</body>

<script type="text/javascript">
$(document).ready(function(){
	//제목 길이 길면 자르는 함수 ///////
	var tempTitle = $(".move");
	console.log(tempTitle);
 	for(var i=0 ; i<tempTitle.length ; i++){
		console.log("text:"+$(tempTitle[i]).text());
	} 
	//제목 길이 길면 자르는 함수 //
	
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
    
    $("#regBtn").on("click", function(){
        self.location = "/board/register?userid=test";
     });
    
    $(".move").on("click",function(e) {
   	 e.preventDefault();
   	 actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
   	 actionForm.attr("action","/board/get");
   	 actionForm.submit();
     });
    
    var searchFormNum = $("#searchFormNum");
    
    $("#searchFormNum").on("change", function(e){
  	  e.preventDefault();
  	  
  	  searchFormNum.submit();
  	  
    });
$('a[data-toggle="tab"]').on('show.bs.tab',function(e){
	var temp = $(this).html();
    var form = {
            category :temp,
            gu:'${criteria.gu}'
    }
    
    console.log(form);
    if(temp=='소통해요'){
    $.ajax({
        url: "/board/BoardTabListAjax",
        type: "GET",
        data: form,
        success: function(data){
        	
            $("#menu1 tbody").empty();
            $(data).each(function(i,board){
                 $("#menu1 tbody").append(
						"<tr>"+
						"<td>"+board.bno+"</td>"+
						"<td>"+board.location+"</td>"+
						"<td>"+board.category+"</td>"+
						"<td>"+"<span class='boardTitle'>"+board.title+"</span> ["+board.reply_count+"]</td>"+
						"<td>"+board.userid+"</td>"+
						"<td>"+board.veiw_count+"</td>"+
						"<td>"+board.like_count+"</td>"+
						"</tr>"	 	
                )    
            });
            $(".pagination").empty();
            $(".pagination").append(
					"<c:if test='${pageMaker.prev}'>"+
					"<li class='paginate_button previous'><a class='page-link' href='${pageMaker.startPage -1}'>Previous</a></li>"+
				"</c:if>"+
				"<c:forEach var='num' begin='${pageMaker.startPage}' end='${pageMaker.endPage}'>"+
					"<li class='paginate_button' ${pageMaker.cri.pageNum==num? 'active':''}><a class='page-link' href='${num}'>${num}</a></li>"+
				"</c:forEach>"+
				"<c:if test='${pageMaker.next}'>"+
					"<li class='paginate_button'><a class='page-link' href='${pageMaker.endPage +1}'>Next</a></li>"+
				"</c:if>"	
            );
            $("#actionForm").empty();
            $("#actionForm").append(
					"<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>"+
					"<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>"+
					"<input type='hidden' name='type' value='<c:out value='${pageMaker.cri.type}'/>'>"+
					"<input type='hidden' name='keyword' value='<c:out value='${pageMaker.cri.keyword}'/>'>"+
					"<input type='hidden' name='gu' value='<c:out value='${criteria.gu}'/>'>"+
					"<input type='hidden' name='category' value='<c:out value='${criteria.category}'/>'>"
            );
            
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });
    }else if(temp=='불만있어요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu2 tbody").empty();
                $(data).each(function(i,board){
                     $("#menu2 tbody").append(
    						"<tr>"+
    						"<td>"+board.bno+"</td>"+
    						"<td>"+board.location+"</td>"+
    						"<td>"+board.category+"</td>"+
    						"<td>"+"<span class='boardTitle'>"+board.title+"</span> ["+board.reply_count+"]</td>"+
    						"<td>"+board.userid+"</td>"+
    						"<td>"+board.veiw_count+"</td>"+
    						"<td>"+board.like_count+"</td>"+
    						"</tr>"	 	
                    )    
                });
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='모여요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu3 tbody").empty();
                $(data).each(function(i,board){
                     $("#menu3 tbody").append(
    						"<tr>"+
    						"<td>"+board.bno+"</td>"+
    						"<td>"+board.location+"</td>"+
    						"<td>"+board.category+"</td>"+
    						"<td>"+"<span class='boardTitle'>"+board.title+"</span> ["+board.reply_count+"]</td>"+
    						"<td>"+board.userid+"</td>"+
    						"<td>"+board.veiw_count+"</td>"+
    						"<td>"+board.like_count+"</td>"+
    						"</tr>"	 	
                    )    
                });
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='all'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#all tbody").empty();
                $(data).each(function(i,board){
                     $("#all tbody").append(
    						"<tr>"+
    						"<td>"+board.bno+"</td>"+
    						"<td>"+board.location+"</td>"+
    						"<td>"+board.category+"</td>"+
    						"<td>"+"<span class='boardTitle'>"+board.title+"</span> ["+board.reply_count+"]</td>"+
    						"<td>"+board.userid+"</td>"+
    						"<td>"+board.veiw_count+"</td>"+
    						"<td>"+board.like_count+"</td>"+
    						"</tr>"	 	
                    )    
                });
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }
	
});
$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
	localStorage.setItem('activeTab', $(e.target).attr('href'));
});
var activeTab = localStorage.getItem('activeTab');
if(activeTab){
	$('#mytab a[href="' + activeTab + '"]').tab('show');
}
});
(function($) {
	var $pMain = $("#parallax_main"),
		$pToolbar = $pMain.find("#toolbar_main"),
		$pTitle = $pToolbar.find("#title_main"),
		 alpha=0,
		 scale=1;
	$(window).scroll(function() {
    var st = $(window).scrollTop();
    if (st <= 0) {
        maxHeight = 350;
    } else if (st > 350) {
		  alpha = 1;
        maxHeight = 70;
    } else {
		 	alpha =
			0.0 + 1.2 * st / 350;
	 scale =
			1 - 0.20 * st / 350;
        maxHeight =350 - 280 * ((st - 0)) / 350;
        console.log(maxHeight);
    }
	 $pToolbar.css("background", "rgba(33,14,61," + alpha + ")");
    $pMain.css({
        'max-height': maxHeight + "px"
    });
	$pTitle.css('transform','scale('+scale+')');
});
})(jQuery);
</script>
</html>