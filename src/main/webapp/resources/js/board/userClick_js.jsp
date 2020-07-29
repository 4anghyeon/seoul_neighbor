<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	// 유저한테 쪽지 보내기 ///////////////////////////////////////////////////////////////////
	var tempUserNickname;
	$(document).on("click",".sendMessageToUser",function(){
		tempUserNickname = $($(this).parents().prev()[0]).text();
		console.log(tempUserNickname)
		$("#messageReplyContentToUser").val("");
		$("#warnToUser").empty();
		$("#warnToUser").append("(0/100) 글자");
		$("#messageReplyHeaderToUser").text($($(this).parents().prev()[0]).text()+" 님에게 보내기");
	})
	
	$("#messageReplyContentToUser").on("propertychange change keyup keypress paste",function(){ //쪽지 내용 길이 바이트 검증
		var messageContent = $("#messageReplyContentToUser").val();
		stringLength = messageContent.length
		if(stringLength>100){
			$("#warnToUser").empty();
			messageContent = messageContent.substring(0,99);
			$("#messageReplyContentToUser").val("");
			$("#messageReplyContentToUser").val(messageContent);
			$("#warnToUser").append("100글자를 초과했습니다.");
			$("#messageReplyContentToUser").addClass("warn");
		}
		else{
			$("#messageReplyContentToUser").removeClass("warn");
			$("#warnToUser").empty();
			$("#warnToUser").append("("+stringLength+"/100) 글자");
		}
	})
	
	$("#messageReplySendToUserBtn").on("click",function(){ //쪽지 전송
		var tempNickname = tempUserNickname;
		console.log(tempNickname);
		console.log($("#messageReplyContentToUser").val());
		
        var form = {
        		receiver: tempNickname,
                sender: '${member.userid}',
                message_content: $("#messageReplyContentToUser").val()
        }
        $.ajax({
            url: "/myMessageSendToUserAjax",
            type: "POST",
            beforeSend: function(xhr){
            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            data: form,
            success: function(data){
            	alert("전송했습니다!");
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
	})
	// 유저한테 쪽지 보내기 //
	
	// 유저 신고하기 /////////////////////////////////////////////////////
	$(document).on("click","#reportUser",function(){
		tempUserNickname = $($(this).parents().prev()[0]).text();
		$("#reportUserHeader").text(tempUserNickname+"님 신고하기")
		console.log(tempUserNickname);
	})
	
	$("#reportContent").on("propertychange change keyup keypress paste",function(){ //쪽지 내용 길이 바이트 검증
		var messageContent = $("#reportContent").val();
		stringLength = messageContent.length
		if(stringLength>100){
			$("#warnReport").empty();
			messageContent = messageContent.substring(0,99);
			$("#reportContent").val("");
			$("#reportContent").val(messageContent);
			$("#warnReport").append("100글자를 초과했습니다.");
			$("#reportContentr").addClass("warn");
		}
		else{
			$("#reportContent").removeClass("warn");
			$("#warnReport").empty();
			$("#warnReport").append("("+stringLength+"/100) 글자");
		}
	})
	
	$("#reportUserBtn").on("click",function(){ //신고 전송
		var tempNickname = tempUserNickname;
		console.log(tempNickname);
		console.log($("#messageReplyContentToUser").val());
		
        var form = {
        		receiver: tempNickname,
                sender: '${member.userid}',
                message_content: $("#messageReplyContentToUser").val()
        }
        $.ajax({
            url: "/myMessageSendToUserAjax",
            type: "POST",
            beforeSend: function(xhr){
            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            data: form,
            success: function(data){
            	alert("전송했습니다!");
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
	
	// 유저 신고하기 //
});
});
</script>