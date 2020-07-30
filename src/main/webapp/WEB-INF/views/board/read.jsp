<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울이웃</title>

<!-- CSS style ------------------------------>
<link rel="stylesheet" href="/resources/css/board/read.css">


</head>

<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->


    <div class="container" style="margin-top:30px">
        <div class="row">
        
        	<!-- 왼쪽 사이드메뉴 ---------------------------------------->
            <div class="col-sm-2 left-menu">
                <div id="speedMove">
                    <h5><b>빠른 게시판 이동</b></h5>
                    <div class="input-group mb-3">
                        <select id="selectGu" name="gu" class="form-control custom-select">
                            <option>지역선택</option>
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
                </div>

                <h5><b>우리동네 인기글</b></h5>
                <ul>
				<c:forEach items="${hotList}" var="board" begin="0" end="5" step="1" varStatus="i">
				    <li class="nav-item">
                        <a class="nav-link" href='<c:out value="${board.bno}"/>?gu=${criteria.gu}'><c:out value="${board.title}"/></a>
                    </li>
				</c:forEach>
				</ul>
                <hr class="d-sm-none">
            </div>
            <!-- 왼쪽 사이드메뉴 -->

			<!-- 상세보기 본문 ------------------------------------------------------->
            <div class="col-sm-10">
                <div id="contentTitle">
                    <div id="writer" class="d-flex justify-content-between">
                        <div id="contentInfo">
                            <div>
                                <h2><c:out value="${board.title}"/></h2>
                            </div>
                            <div>
                                <span><c:out value="${board.regdate}"/></span>
                                <span>조회 <c:out value="${board.view_count}"/></span>
                                <span>추천 <c:out value="${board.like_count}"/></span>
                                <span>댓글 <c:out value="${board.reply_count}"/></span>
                                <span id="reportBoard">신고하기</span>
                            </div>

                        </div>
	
                        <div id="writerProfile">
                            <span> 
                            	<c:choose>
									<c:when test="${fileName eq null }">
										<img id="profileChangeImg"
											class="card-img-top"
											src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
									</c:when>
									<c:when test="${fileName != null }">
										<img id="profileChangeImg" class="card-img-top"
											src="/resources/img/mypage/<c:out value="${fileName}"/>"
											alt="프로필 이미지">
									</c:when>
								</c:choose>
							</span>
                            <span class="userNickname" data-toggle="dropdown">${board.nickname }</span>
                            <div class="dropdown-menu">
							<a class="dropdown-item sendMessageToUser">쪽지 보내기</a>
                        </div>
                    </div>

                </div>

                <div id="contentBody">
               		${board.content}
                </div>


                <div class="recomend_box d-flex justify-content-between">
                    <div>
                        <span class="likeCount"><c:out value="${board.like_count}"/></span>
                        <i class="likeButton likeIcon far fa-thumbs-up"></i>
                    </div>
                    <div>
                        <span class="unlikeCount"><c:out value="${board.unlike_count}"/></span>
                        <i class="unLikeButton likeIcon far fa-thumbs-down"></i>
                    </div>
                </div>

                <!-- 댓글창 ----------------------------------------------------->
                <div id="commentDiv">
                     
                    <!--댓글 목록--------------------------------------->
                    <div id="commentList">

                        <div class="reply-container container">
                            <div class="d-flex row">
                                <div class="col-md-12">
                                    <div class="d-flex flex-column comment-section" id="myGroup">
                                        <div class="bg-white p-2">
                                            <div class="d-flex flex-row user-info">
                                                <div class="re-reply ml-auto mt-2">
                                                    <span>댓글달기</span>
                                                    <sec:authorize access="isAuthenticated()">
                                                    	<span>수정</span>
                                                    	<span>삭제</span>
                                                    </sec:authorize>
                                                    <sec:authorize access="isAnonymous()">
														<span>신고하기</span>
													</sec:authorize>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                       <div class="reply-container container">
                            <div class="d-flex row">
                                <div class="col-md-12">
                                    <div class="d-flex flex-column comment-section" id="myGroup">
                                        <div class="bg-white p-2">
                                            <div class="d-flex flex-row user-info">
                                                <div class="re-reply ml-auto mt-2">
                                                    <span>댓글달기</span>
                                                    <span>신고하기</span>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--댓글목록-->

                    <!--댓글페이징------------------------>
                    <div id="replyPaging">

					</div>
                    <!--댓글페이징-->

                    <!--댓글 입력---------------------------------------->
                    <div id="commentWrite">
                        <div class="input-group mb-3">
                            <textarea id="replyInput" class="form-control" placeholder="남에게 상처주는 말을 하지 맙시다."></textarea>
                            <div class="input-group-append">
                              <button id="replyBtn" class="btn btn-outline-secondary">댓글등록하기</button>
                            </div>
                        </div>
                    </div>
                    <!--댓글입력-->

                </div>
                <!-- 댓글창 -->

                <!-- 버튼 모음 -------------------------------->
                <div class="btn-box d-flex">
                    <button class="btn btn-primary mr-auto m-1">목록으로</button>
                    <button class="btn btn-warning m-1">수정하기</button>
                    <button class="btn btn-warning m-1">삭제하기</button>
                    <button class="btn btn-primary m-1">글쓰기</button>
                </div>
                <!-- 버튼모음 -->

            </div>
            <!-- 상세보기 본문 -->
        </div>
    </div>
</div>

<!-- reply 모듈 -->
<!-- <script src="/resources/js/board/reply.js"></script> -->

<!-- read javascript -->
<%-- <%@include file="/resources/js/board/read_js.jsp"%> --%>
<%@include file="/resources/js/report_js.jsp"%>
<%@include file="/resources/js/board/userClick_js.jsp"%>

<script>
var replyService = (function(){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	
	// 빠른 게시판 이동 ////////////////////////////////
	$("#selectGu").change(function(){
		location.href = "/board/list?gu="+$(this).val();
	})
	// 빠른 게시판 이동 //
	
	// 신고하기 ////////////////////////////
	$("#reportBoard").on("click",function(){
		if('${member.userid}' == ""){
			alert("신고하려면 로그인 해주세요");
		}
		else{
			$('#reportUserModal').modal("show");
			$("#reportContent").val("");
			$("#reportUserHeader").text("글 제목: ${board.title} 신고하기");
			$("#reportInfo").empty();
			$("#reportInfo").append(
				"<input type='hidden' id='target' value='"+${board.bno}+"'>"+		
				"<input type='hidden' id='group' value='b'>"		
			);
		}
	})
	
	$(document).on("click",".reportReply",function(){
		if('${member.userid}' == ""){
			alert("신고하려면 로그인 해주세요");
		}
		else{
			$('#reportUserModal').modal("show");
			$("#reportContent").val("");
			$("#reportUserHeader").text("글 제목: ${board.title} 신고하기");
			$("#reportInfo").empty();
			$("#reportInfo").append(
				"<input type='hidden' id='target' value='"+${board.bno}+"'>"+		
				"<input type='hidden' id='group' value='b'>"		
			);
		}
	})
	// 신고하기 //
	

	
	//댓글 추가
	function add(reply, callback, error) {
		console.log("add함수 실행")
		$.ajax({
			type: "POST",
			url: '/reply/new',
			data: JSON.stringify(reply),
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 목록가져오기
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/reply/pages/" + bno + "/" + page + ".json",
			function(data) {
				if(callback) {
				callback(data.replyCount, data.list);
			}
		}).fail(function(xhr, status, err){
			if (error) {
				error();
			}
		});
	}
	
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/reply/remove/' + rno,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error) {
		$.ajax({
			type : "put",
			url : "/reply" + reply.rno,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
		
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update
	};
})();


	$(document).ready(function(){
		//좋아요 눌렀는지 확인 ////////////////////////////
		function likeCheck(){
	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/likeCheck", 
 		 	         type: "GET",
 		 	         success: function(result){
	 	        		 $(".fa-thumbs-up").addClass("likeButton");
		 	        	 $(".fa-thumbs-down").addClass("unLikeButton");
		 	        	 $(".fa-thumbs-down").removeClass("likeClicked");
		 	        	 $(".fa-thumbs-up").removeClass("likeClicked");
 		 	        	
 		 	        	 if(result=="L" || result =="U"){
 		 	        		 $(".fa-thumbs-up").removeClass("likeButton");
 		 	        		 $(".fa-thumbs-down").removeClass("unLikeButton");
 		 	        	 }
 		 	        	 if(result =="L"){
 		 	        		$(".fa-thumbs-up").addClass("likeClicked");
 		 	        	 }
 		 	        	 else if(result == "U"){
 		 	        		$(".fa-thumbs-down").addClass("likeClicked");
 		 	        	 }
 		 	         }
 		 	      });
		}
		
		likeCheck();
		//좋아요 눌렀는지 확인 //
		
		// 좋아요 싫어요 ////////////////////////////////////
	    $(document).on("click",".likeButton",function(){
	    	if('${member.userid}' == ""){
	    		alert("로그인 해주세요");
	    	}
	    	else{
	  	      $.ajax({
	 	         url: "/read/plusLike/${board.bno}", 
	 	         type: "GET",
	 	         dataType: "text",
	 	         success: function(result, status, xhr){
	 	            $(".likeCount").html(result);
	 	            var form = {
	 	            		bno: '${board.bno}',
	 	            		userid: '${member.userid}',
	 	            		type:'L'
	 	            }
	 		  	      $.ajax({
	 		  	    	 data: form,
	 		 	         url: "/board/insertLikeAjax", 
	 		 	         type: "POST",
	 		 			 beforeSend: function(xhr){
	 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
	 					 },
	 		 	         success: function(result, status, xhr){
	 		 	        	likeCheck()
	 		 	         }
	 		 	      });
	 	         }
	 	      });
	    	}
	   });
	   
	   $(document).on("click",".unLikeButton",function(){
	    	if('${member.userid}' == ""){
	    		alert("로그인 해주세요");
	    	}
	    	else{
	  	      $.ajax({
	 	         url: "/read/plusUnlike/${board.bno}", 
	 	         type: "GET",
	 	         dataType: "text",
	 	         success: function(result, status, xhr){
		 	            $(".unlikeCount").html(result);
		 	            var form = {
		 	            		bno: '${board.bno}',
		 	            		userid: '${member.userid}',
		 	            		type:'U'
		 	            }
		 		  	      $.ajax({
		 		  	    	 data: form,
		 		 	         url: "/board/insertLikeAjax", 
		 		 	         type: "POST",
		 		 			 beforeSend: function(xhr){
		 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
		 					 },
		 		 	         success: function(result, status, xhr){
		 		 	        	likeCheck()
		 		 	         }
		 		 	      });
		 	         }
	 	      });	
	    	}

	   });
		// 좋아요 싫어요 //
		
		// 좋아요 싫어요 취소 ///////////////////////////
		$(document).on("click",".likeClicked",function(){
			if($(this)[0].dataset.icon == "thumbs-up"){
 	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}',
 	            		type:'L'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/cancelLike", 
 		 	         type: "POST",
 		 			 beforeSend: function(xhr){
 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
 					 },
 		 	         success: function(result, status, xhr){
 		 	        	likeCheck()
 		 	        	$(".likeCount").html(parseInt($(".likeCount").text()) -1)
 		 	         }
 		 	      });
			}
			else if($(this)[0].dataset.icon == "thumbs-down"){
 	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}',
 	            		type:'U'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/cancelLike", 
 		 	         type: "POST",
 		 			 beforeSend: function(xhr){
 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
 					 },
 		 	         success: function(result, status, xhr){
 		 	        	likeCheck()
 		 	        	$(".unlikeCount").html(parseInt($(".unlikeCount").text()) -1)
 		 	         }
 		 	      });
			}
		})
		// 좋아요 싫어요 취소 //
	
		var bnoValue = <c:out value="${board.bno}"/>;
		var replyList = $("#commentList");
		
		showList(1);
		
		//댓글목록 불러오기 함수
		function showList(page) {
			
			console.log("show list : " + page);
			
			
			
			replyService.getList({bno : bnoValue, page : page || 1}, 
			function(replyCnt, list) {
			
				console.log("showList의 getList 호출");
				console.log("replyCnt : " + replyCnt);
				console.log("replyCnt : " + replyCnt);
				console.log("replyCnt : " + replyCnt);
				
				
				if(page==-1){
					pageNum=Math.ceil(replyCnt/10.0);
					showList(PageNum);
					return;
				}
				
				console.log("page가 -1이 아니므로 진행합니다.");
				
				var str = "";
				console.log("받아온데이터");
				console.log(list);
				console.log(replyCnt);
				
				if(list == null || list.length == 0) {
					replyList.html("");
					return;
				}
				
				for(var i = 0, len = list.length || 0; i<len; i++) {
					str += '<div class="reply-container container">';
					str += '	<div class="d-flex row">';
					str += '		<div class="col-md-12">';
					str += '			<div class="d-flex flex-column comment-section" id="reply'+list[i].rno+'">';
					str += '				<div class="bg-white p-2">';
					str += '					<div class="d-flex flex-row user-info">';
					str += '						<img class="rounded-circle" src="/resources/img/mypage/'+list[i].member_filename+'" width="40" height="40">';
					str += '						<div class="d-flex flex-column justify-content-start ml-2">';
					str += '							<span class="d-block font-weight-bold name">'+list[i].replyer+'</span>';
					str += '							<span class="date text-black-50">'+list[i].replyDate+'</span>';
					str += '						</div>';
					str += '						<div class="reply-content mt-2">';
					str += '							<p class="comment-text">'+list[i].reply+'</p>';
					str += '						</div>';
					str += '						<div class="re-reply ml-auto mt-2">';
					str += '							<span>댓글달기</span>';
					str += '							<span class="reportReply">신고하기</span>';
					str += '						</div>';
					str += '</div></div></div></div></div></div>';
				}
				replyList.html(str);
				showReplyPage(replyCnt);
			});
		}
		
		var pageNum = 1;
		var replyPaging = $("#replyPaging");
		
		//페이징 부분 만드는 함수
		function showReplyPage(replyCnt) {
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = '<ul class="pagination justify-content-center mb-3">';
			
			if(prev) {
				str += '<li class="page-item"><a class="page-link" href="'+(startNum - 1)+'">Previous</a></li>';
			}
			
			for(var i = startNum; i<=endNum; i++) {
				var active = pageNum == i? "active" : "";
				str += '<li class="page-item '+active+'"><a class="page-link" href="'+i+'">'+i+'</a></li>';
			}
			
			if(next) {
				str += '<li class="page-item"><a class="page-link" href="'+(endNum + 1)+'">Next</a></li>';
			}
			
			str += '</ul>';
			
			replyPaging.html(str);
		}
		
		//댓글등록 버튼을 클릭했을 때 이벤트 (댓글등록)
		$("#replyBtn").on("click", function(e){
			var reply = {
					reply : $("#replyInput").val(),
					replyer : '${member.nickname}',
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				console.log(result);
				showList(1);
			});
		});
		
		//댓글 페이징 링크를 눌렀을 때
		replyPaging.on("click", "ul li a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		
	});
</script>

</body>

</html>