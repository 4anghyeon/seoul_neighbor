<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   
   <style>

   body {
     font-family: "Lato", sans-serif;
      position: relative; 		/* body에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
   }
   body:after {				/* background-image opacity */
    content : "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url('/resources/img/common/index_background.jpg');  
    width: 100%;
    height: 100%;
    opacity : 0.4;
    z-index: -1;
	}						/* background-image opacity */


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
      height:100%;						/* side menu(왼쪽)와 본문(오른쪽)의 구분선 */
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
   .chat li{
  	  word-break:break-all;				/* 댓글 겁나 길게 쓰면 등록된 댓글이  한줄로 가로로 쭉 늘어나서 가로 스크롤바 생기는데 이거 넣으면 width가 컨테이너 만큼 차면서 그 다음줄로 댓글이 이어 써진다. */
   }
   </style>
   
   <title>상세 보기</title>
   
       
</head>

<body>
   <!-- header include ------------>
   <%@include file="../common/header.jsp"%>
   <!-- header include -->

	
	<!-------	side menu-------------------------->
   
   <div class="container" style="margin-top:60px">
      <div class="row">
         <div id="sideMenu" class="col-lg-3">
               <!-------   side menu-------------------------->
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
            <div id="commentDiv" class="row">
                <ul class="chat">
		
		        </ul>
		        <!-- ./ end ul -->
            </div>
            <!-- 댓글 창 부분 -->
            
            <!-- 댓글 입력 창 ----------------------------------->
            <div id="commentInsertDiv" class="row">
               <input id="replyContent" type="text" class="form-control" placeholder="댓글을 입력하세요" style="width:80%">
               <input id="replyButton" type="button" class="form-control" value="등록" style="width:20%">
            </div>
            <!-- 댓글 입력 창 -->
            
            <!-- 다른 페이지 이동 버튼 --------------------------->
            <div id="crudDiv" class="row" style="display:block">
                  <button type="button" class="btn btn-primary">목록</button>
                  <button type="button" class="btn btn-primary float-right">글쓰기</button>
                  <button type="submit" data-oper='remove' class="btn btn-danger float-right">
		    		 삭제
		   		 </button> 	
                  <button type="button" class="btn btn-primary float-right">수정</button>
 	  
		 	    <form id="metaForm" method="POST" action="">
		 	    	<input id="boardBno" name="bno" type="hidden" value="<c:out value='${board.bno}' />">
			    </form> 
      
            </div>
            <!-- 다른 페이지 이동 버튼 -->
         </div>

      </div>
      
       <!-- The Modal -->
	  <div class="modal" id="deleteModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->

	        
	        <!-- Modal body -->
	        <div class="modal-body">
				삭제하시겠습니까
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
      	      <button id="delete" type="button" class="btn btn-danger" data-dismiss="modal">삭제</button>
	          <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
    
    <div class="modal" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
   </div>
   
   
	 <script>
		   $(document).ready(function(){
			   
			   let bno=${board.bno}
			   let likeCount=${board.like_count}
		  	   let replyUL = $(".chat");
		  	 
/* 			   댓글 목록 불러오는 ajax 함수를 getReplyList라는 변수에 넣음.*/
				let getReplyList=function(){  
   					$.ajax({
	    		    url:"/replies/replyList/"+bno,
	    		  	type:"GET",
	    		  	global: false,
		  			  success:function(result, status, xhr){
		  				let str = "";
		  				$(result).each(function(i, repl){
						
   			  				str +="<li  class='left clearfix'>";
		   			  	    str +="  <div><div class='header'><strong class='primary-font'>["
		   			  	    	   +repl.rno+"] "+repl.replyer+"</strong>"; 
	   			  	        str +="    <small class='pull-right text-muted'>"
		   			  	           +repl.updatedate+"</small><button data-toggle='modal' data-target='#replyModal'>수정</button><button id='deleteReplyButton'>삭제</button>";
			   			  	        str +="<input type='hidden' value="+repl.rno+" /></div>";
	   			  	        str +="    <p>"+repl.reply+"</p></div></li>";

   			  				})
			 			replyUL.empty();
		  				replyUL.html(str);
	    		  }
	    	  })};
/* 			   댓글 목록 불러오는 ajax 함수를 getReplyList라는 변수에 넣음.*/



				/* 댓글 삭제 */				   			 
				 
				
   			    $(".chat").on("click","#deleteReplyButton", function(e){
   			  		let rno = $(this).next().val();
			         $.ajax({
				            url: "/replies/board/removereply/" + rno, 
				            type: "POST",
				            dataType: "text",
				            success: function(result, status, xhr){
				               console.log(result);
				               getReplyList();
				            }
				         });
   			  	 })
   			  	 
   			  	 
   			  	 
				
				
				/* 댓글 삭제 */

   			  	 //getReplyList/////////////////////////////////////////////////

			      $(window).on('load',function(){
			    	  getReplyList();
			      })

   			  	 //getReplyList/////////////////////////////////////////////////


			      $("#likeButton").click(function(){
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
			      
			      $("#unlikeButton").click(function(){
			    	  
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
			      
			      
 			      let metaForm = $("#metaForm");
			      
			      $("button[data-oper='remove']").click(function(e){
			    	  e.preventDefault();
			    	  
			    	  let modal= $("#deleteModal");
			    	  $("#deleteModal").modal("show");
			    
			      }) 	 
			      
   			   	  $("#delete").click(function(e){
			    	  e.preventDefault();
			    	  metaForm.attr("action", "/board/remove/" + bno);
			    	  metaForm.submit();
   			  	 }) 
   			  	 
   			  	 $("#replyButton").click(function(){

   			  		 let replyObject = {
   			  				 "bno":bno,
   			  				 "reply":$("#replyContent").val(),
   			  				 "replyer":"testUser"
   			  		 }
   			  		  $.ajax({
   			  			 url:"/replies/new",
   			  			 type:"POST",
   			  			 data: JSON.stringify(replyObject),
   			  			 dataType:"text", //서버에서 오는 데이터형식, 클라이언트가 받는거
   			  			 contentType:"application/json", //서버로 보내는 데이터 형식 = data의 형식을 표시, 클라이언트가 보내는거 
   			  			 success:function(result, status, xhr){
   				    	  getReplyList();

   			  			 }
   			  		 })  	
   			 

   			  	 })
   			  	 

   			  	 
   			  	  
   	})
		</script>	

</body> 


</html>