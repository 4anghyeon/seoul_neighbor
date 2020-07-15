<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		
		// 쪽지 페이지 번호 개수 지정 //////////////////////////
		var pageTotalNum = '${pageTotalNum}'
		var nowPageNum = '${nowPageNum}'
		
		function changePageList(){
			$("#pageNumBtnList").empty();

			for(var i=nowPageNum ; i<pageTotalNum/8+1 ; i++){
				$("#pageNumBtnList").append(
					"<li class='page-item pageBtn'><a class='page-link'>"+i+"</a></li>"
				)
				if(i%5==0){
					break;
				}
			}
			
			if(pageTotalNum/8-nowPageNum >= 5){
				$("#pageNumBtnList").append(
					"<li id='messageNextBtn' class='page-item'><a class='page-link'>Next</a></li>"
				)
			}
			if(nowPageNum>5){
				$("#pageNumBtnList").prepend(
					"<li id='messagePrevBtn' class='page-item'><a class='page-link'>Prev</a></li>"
				)
			}
		}
		changePageList();
		$("#pageNumBtnList :first-child").addClass("active");
		// 쪽지 페이지 번호 개수 지정 //
		
		// 쪽지 리스트 다음 버튼 ////////////////////////////////
		$(document).on("click","#messageNextBtn",function(){
			nowPageNum = parseInt(nowPageNum) +5;
			changePageList();
		})
		// 쪽지 리스트 다음 버튼 //
		
		// 쪽지 리스트 이전 버튼 ////////////////////////////////
		$(document).on("click","#messagePrevBtn",function(){
			nowPageNum = parseInt(nowPageNum) -5;
			changePageList();
		})
		// 쪽지 리스트 이전 버튼 //
		
		// Ajax 쪽지 페이지 이동 //////////////////////////////
		$(document).on("click",".pageBtn",function(){
			$(this).nextAll().removeClass("active");
			$(this).prevAll().removeClass("active");
			$(this).addClass("active");
	        var form = {
	                userid: '${member.userid}',
	                pageNum: $(this).text()*8-8
	        }
	        $.ajax({
	            url: "/myMessageAjax",
	            type: "GET",
	            data: form,
	            success: function(data){
	                $("#messageList").empty();
	                $(data).each(function(i,message){
		                $("#messageList").append(
							"<tr>"+
							"<td style='display:none'><input type='hidden' value='"+message.mno+"' /></td>"+
							"<td>"+message.nickname+"</td>"+
							"<td class='messageContent' data-toggle='modal' data-target='#readMessage'>"+message.message_content+"</td>"+
							"<td>"+message.writedate+"</td>"+
							"<td style='display:none'><input type='hidden' value='"+message.message_content+"' /></td>"+
							"</tr>"
		                )
	                });
	                cutContent();
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });
		})
		// Ajax 쪽지 페이지 이동 //
		
		// 쪽지 답장 모달창 ////////////////////////////////////////////
		var info;
		$(document).on("click","#replyMessageBtn",function(){
			info = $($(this).parent().siblings())[2];
			mno = $($($(info).children().eq(0)[0])[0]).val()
			
			$("#messageReplyHeader").empty();
			$("#messageReplyContent").val("");
			$("#warn").empty();
			$("#warn").append("(0/100) 글자");
			$("#messageReplyHeader").append(
					$($(info).children().eq(1)[0]).val()+"님에게 답장"	
			);
		})
		
		$("#messageReplyContent").on("propertychange change keyup keypress paste",function(){ //쪽지 내용 길이 바이트 검증
			var messageContent = $("#messageReplyContent").val();
			stringLength = messageContent.length
			if(stringLength>100){
				$("#warn").empty();
				messageContent = messageContent.substring(0,99);
				$("#messageReplyContent").val("");
				$("#messageReplyContent").val(messageContent);
				$("#warn").append("100글자를 초과했습니다.");
				$("#messageReplyContent").addClass("warn");
			}
			else{
				$("#messageReplyContent").removeClass("warn");
				$("#warn").empty();
				$("#warn").append("("+stringLength+"/100) 글자");
			}
		})
		
		// 쪽지 답장 모달창 //
		
		// 쪽지 답장 전송 ////////////////////////////////////////////
   		$(document).on("click","#messageReplySendBtn",function(){
	        var form = {
	        		mno: $($($(info).children().eq(0)[0])[0]).val(),
	                sender: '${member.userid}',
	                message_content: $("#messageReplyContent").val()
	        }
	        $.ajax({
	            url: "/myMessageSendAjax",
	            type: "POST",
	            data: form,
	            success: function(data){
	            	alert("답장했습니다!");
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });
		})
		// 쪽지 답장 전송 //
		
		// 쪽지 내용 길면 ...로 자르기 ////////////////////////////////////
		function cutContent(){
			var forCutMessageContent = $(".messageContent")
			for(var i=0; i<8; i++){
				if($(forCutMessageContent[i]).text().length >15){
					var tempMessageContent = $(forCutMessageContent[i]).text();
					$(forCutMessageContent[i]).empty();
					$(forCutMessageContent[i]).append(tempMessageContent.substring(0,15)+" ...");
				}
			}
		}
		cutContent();
		// 쪽지 내용 길면 ...로 자르기 //
		
		// 쪽지 내용 모달창 ////////////////////////////////////////////
		$(document).on("click",".messageContent",function(){
			var messageInfo = $(this).siblings();
			$("#messageShowHeader").empty();
			$("#messageShowHeader").append(
				$(messageInfo[1]).text()+"님의 쪽지"
			);
			$("#readMessageContent").empty();
			$("#readMessageContent").append($(messageInfo[3]).children().first().val());
			
			$("#messageInfo").empty();
			$("#messageInfo").append(
				"<input type='hidden' name='mno' value='"+$($(messageInfo[0]).children().first()).val()+"'>"+
				"<input type='hidden' name='nickname' value='"+$(messageInfo[1]).text()+"'>"		
			)
		})
		// 쪽지 답장 모달창 //
	})
</script>