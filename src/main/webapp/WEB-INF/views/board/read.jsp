<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<style>

	body {
	  font-family: "Lato", sans-serif;
	}
	
	.sidenav {
	margin-left : 30px;
	  width: 300px;
	  position: fixed;
	  top: 200px;
	  left: 20px;
	  overflow-x: hidden;
	  padding-top: 20px;
	}
	
	.sidenav a {
	  padding: 6px 6px 6px 32px;
	  text-decoration: none;
	  font-size: 25px;
	  color: #818181;
	  display: block;
	}
	
	.sidenav a:hover {
	  color: #f1f1f1;
	}
	
	.main {
	  margin-right: 300px;
	  margin-left: 300px; /* Same as the width of the sidenav */
	}
	
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
	.grid-container {
	  display: grid;
	  grid-template-columns: auto auto auto auto;
	  grid-gap: 10px;
	  padding: 10px;
	}
	
	.grid-container > div {
	  text-align: center;
	  padding: 20px 0;
	  font-size: 30px;
	}
	
	.item1 {
	  grid-column-end: span 3;
	}
	.padding20{
		padding: 20px;
	}
	.buttons{
		text-align: right;
		margin:20px;
	}
	
	/* temp */
	#selectGu{
		display:initial;
		width:auto;
	}
	
	#selectCategory{
		display:initial;
		width:auto;
	}
	
	#sideMenu{
		height:90vh;
		border-right:1px solid black;
		padding:2rem;
	}
	
	/* 게시글 상세 제목,아이디 부분  */
	#rightTop{
		border-top:1.5px solid black;
		border-bottom:1.5px solid black;
	}
	
	#rightContent{
		padding:5rem;
	}
	
	#boardTitle{
		padding:1rem;
	}
	
	#userDiv{
		width:3rem;
		display:inline-block;
		border:none;
	}
	
	/* 게시글 상세 내용 부분 */
	#boardContent{
		padding:1rem;
	}
	
	.likeCount{
		float:right;
		padding:1rem;
		cursor:pointer;
	}
	
	.unlikeCount{
		float:left;
		padding:1rem;
		cursor:pointer;
	}
	
	#commentInsertDiv{
		margin:10px;
	}
	
	</style>
	
	<title>상세 보기</title>
	    
</head>

<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<div class="container" style="margin-top:60px">
		<div class="row">
			<div id="sideMenu" class="col-lg-3">
					<!-------	side menu-------------------------->
					<div>
						<h5>빠른 게시판 이동</h5>
							<div>지역 >
							<select id="selectGu" name="gu" class="form-control">
								<option>강남구</option>
								<option>강동구</option>
								<option>강북구</option>
								<option>강서구</option>
								<option>관악구</option>
								<option>광진구</option>
								<option>구로구</option>
								<option>금천구</option>
								<option>노원구</option>
								<option>도봉구</option>
								<option>동대문구</option>
								<option>동작구</option>
								<option>마포구</option>
								<option>서대문구</option>
								<option>서초구</option>
								<option>성동구</option>
								<option>성북구</option>
								<option>송파구</option>
								<option>양천구</option>
								<option>영등포구</option>
								<option>용산구</option>
								<option>은평구</option>
								<option>종로구</option>
								<option>중구</option>
								<option>중랑구</option>
							</select>
							</div>
							<div>카테고리 >
							<select id="selectCategory" name="category" class="form-control">
								<option>놀아요</option>
								<option>운동해요</option>
								<option>메롱</option>
							</select>
							</div>
					</div>
					<div>
						<h5>우리 동네 인기글</h5>
					</div>
<%-- 			  		<em>지역-><a href="#">${board.location}</a></em>
			  		<em>카테고리-><a href="#">${board.category}</a></em> --%>
					<!-- side menu -->
			</div>
			<div id="rightContent" class="col-lg-9">
				<!-- 게시글 상세 제목,아이디 부분 -------------------->
				<div id="rightTop" class="row">
					<div id="boardTitle" class="col-lg-9">
						<h4>[${board.category}] ${board.title}</h4>
						<span>${board.updatedate} | 조회 ${board.view_count} | 추천 ${board.like_count} | 댓글 ${board.reply_count} </span>
					</div>
					<div class="col-lg-3" style="padding:1rem">
						<div id="userDiv" class="card text-center">
							<img class="card-img-top" src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
						</div>
						<span id="userId">${board.userid}</span>
					</div>
				</div>
				<!-- 게시글 상세 제목, 아이디 부분 -->
				
				<!-- 게시글 내용 부분 ------------------------------->
				<div id="boardContent" class="row">
					<p>${board.content}</p>
				</div>
				<!-- 게시글 내용 부분 -->
				
				<!-- 좋아요, 싫어요 부분 ------------------------------>
				<div id="boardLikeUnlike" class="row text-center">
					<div style="width:50%">
						<span class="likeCount">${board.like_count} <i id="likeButton" class="fas fa-thumbs-up"></i> 좋아요</span>
					</div>
					<div style="width:50%">
						<span class="unlikeCount">${board.unlike_count} <i id="unlikeButton" class="fas fa-thumbs-down"></i> 별로에요</span>
					</div>
				</div>
				<!-- 좋아요, 싫어요 부분 -->
				
				<!-- 댓글 창 부분 ----------------------------------->
				<div id="commentDiv	" class="row">
					
				</div>
				<!-- 댓글 창 부분 -->
				
				<!-- 댓글 입력 창 ----------------------------------->
				<div id="commentInsertDiv" class="row">
					<input type="text" class="form-control" placeholder="댓글을 입력하세요" style="width:80%"><input type="button" class="form-control" value="등록" style="width:20%">
				</div>
				<!-- 댓글 입력 창 -->
				
				<!-- 다른 페이지 이동 버튼 --------------------------->
				<div id="crudDiv" class="row" style="display:block">
						<button type="button" class="btn btn-primary">목록</button>
						<button type="button" class="btn btn-primary float-right">글쓰기</button>
						<button type="button" class="btn btn-primary float-right">삭제</button>
						<button type="button" class="btn btn-primary float-right">수정</button>

		
				</div>
				<!-- 다른 페이지 이동 버튼 -->
			</div>

		</div>
	</div>
	
	
	
	
	
<%-- 	<div class="container" style="margin-top:600px">

	
  <div class="main">

	<header>
		<!--   [category], title, userId, updateDate, viewCount, likeCount, unlikeCount, replyCount--------------------------------------->	
		<hr />
		<div class="grid-container">
			<div class="item1">
				<div>
					<span >
						카테고리 : [${board.category}]
					</span> 
					<span >
						제목 : ${board.title}
					</span>	
				</div>
				
				<div>
					<span >
						${board.updatedate} |
					</span>
					<span>
								조회 ${board.view_count} |
					</span>
					<span>
						<i class="fas fa-thumbs-up"> 좋아요  <p class="likeCount">${board.like_count}</p></i> |
					</span>					
					<span >
						<i class="fas fa-thumbs-down"> 싫어요  <p class="unlikeCount">${board.unlike_count}</p></i> |
					</span>
					<span >
						<i class="far fa-comment-dots"> 댓글  ${board.reply_count}</i>
					</span>
				</div>
			</div>
			<div class="item=2">
				<span>
					<em>ID : ${board.userid}</em>
				</span>	
			</div>
		</div>
		
		<br>
		<br>
		<hr />
	</header>
	<!--   [category], title, userId, updateDate, viewCount, likeCount, unlikeCount, replyCount--------------------------------------->	
	
	<!-- content ------------------------------------------------>
	<div class="padding20">
		<h1>${board.content}</h1>
		<br />
		<br />
		<br />
		<br />
		<br />
		<hr />
	</div>
	<!-- content -->
			
	
	<br />
<!-- 	좋아요, 싫어요------------------------------------------------- -->
	<div style="text-align: center;">
	

								
		<button class="btn btn-primary" id="likeButton">
			<i class="fas fa-thumbs-up"> 
				좋아요  <p class="likeCount">${board.like_count}</p>
			</i>
		</button>
		
		<button class="btn btn-danger" id="unlikeButton">
			<i class="fas fa-thumbs-down"> 
				싫어요  <p class="unlikeCount">${board.unlike_count}</p>
			</i>
		</button>

		<br />
		<br />
		<hr />
	</div>
	<!-- 	좋아요, 싫어요-- -->
	
	
	<br />
	<br />
	<br />
	
	
	<!--댓글  -------------------------------------------------->
	<div class="padding20">
		댓글들이 쭈욱~~~
	</div>
	<br />
	<hr />
	<!--댓글  -->
	<!--댓글달기 ------------------------------------------------------- -->
	<div class="padding20"> 
		<em>
			댓글 input
		</em>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary" data-dismiss="modal" >
							<i class="far fa-comment-dots"> 댓글</i>
		    </button>
		</div>	
	</div>

	
	<br />
	<hr />
	<!--댓글달기  -->
	
	<!--목록, 삭제, 수정, 글쓰기 버튼  --------------------------------------------->
	<div class="buttons">
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 목록
	    </button>
		<button type="button" class="btn btn-danger" data-dismiss="modal">
	    	 삭제
	    </button>
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 수정
	    </button>
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 글쓰기
	    </button>
	</div>
	
	<!--목록, 삭제, 수정, 글쓰기 버튼  -->
	</div>
	</div> --%>
<script>
   $(document).ready(function(){
	   $(document).on("click","#likeButton",function(){
    	  let bno=${board.bno}
         $.ajax({
            url: "/read/plusLike/" + bno, 
            type: "GET",
            dataType: "text",
            success: function(result, status, xhr){
               console.log(result);
               
               $(".likeCount").html(result+" <i id='likeButton' class='fas fa-thumbs-up'></i> 좋아요</span>");
            }
         });
      });

      $(document).on("click","#unlikeButton",function(){
    	  let bno=${board.bno}
         $.ajax({
            url: "/read/plusUnlike/" + bno, 
            type: "GET",
            dataType: "text",
            success: function(result, status, xhr){
               console.log(result);
               
               $(".unlikeCount").html(result+" <i id='unlikeButton' class='fas fa-thumbs-down'></i> 별로에요</span>");
            }
         });
      });
   })		   
</script>

</body> 


</html>