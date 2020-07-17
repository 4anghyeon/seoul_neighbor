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
	</style>
	
	<title>Insert title here</title>
	    
</head>

<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<!-------	side menu-------------------------->
			<div class="sidenav">
				<h3>빠른 게시판 이동</h3>
				<br>
			  <em>지역-><a href="#">${board.location}</a></em>
			  <em>카테고리-><a href="#">${board.category}</a></em>
			</div>
	<!-- 			side menu -->
	
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
	
		<script>
		   $(document).ready(function(){
		      $("#likeButton").click(function(){
		    	  let bno=${board.bno}
		         $.ajax({
		            url: "/read/plusLike/" + bno, 
		            type: "GET",
		            dataType: "text",
		            success: function(result, status, xhr){
		               console.log(result);
		               
		               $(".likeCount").html(result);
		            }
		         });
		      });
		   })
		   $(document).ready(function(){
		      $("#unlikeButton").click(function(){
		    	  let bno=${board.bno}
		         $.ajax({
		            url: "/read/plusUnlike/" + bno, 
		            type: "GET",
		            dataType: "text",
		            success: function(result, status, xhr){
		               console.log(result);
		               
		               $(".unlikeCount").html(result);
		            }
		         });
		      });
		   })		   
		</script>	
								
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

</body> 


</html>