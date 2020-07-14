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
			console.log("clicked");
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
							"<td>"+message.sender+"</td>"+
							"<td>"+message.message_content+"</td>"+
							"<td>"+message.writedate+"</td>"+
							"</tr>"
		                )
	                })
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });
		})
		// Ajax 쪽지 페이지 이동 //
	})
</script>