<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$("#reportUserBtn").on("click",function(e){
		if($("#reportType option:selected").val()=="none"){
			alert("신고 사유를 선택해주세요");
		}
		else if($("#reportContent").val()==""){
			alert("신고 내용을 입력해주세요");
		}
		else{
			var form = {
		               userid:'${member.userid}',
		               rp_content:$("#reportContent").val() ,
		               rp_type:$("#reportType option:selected").val(),
		               rp_group:$("#group").val(),
		               rp_target:$("#target").val()
		               }
		       $.ajax({
		           url: "/board/reportAjax",
		           type: "POST",
		           data: form,
		           beforeSend: function(xhr){
		        	   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        		},
		           success: function(data){
						alert("신고되었습니다.");
						$('#reportUserModal').modal("hide");
		           },
		           error: function(){
		               alert("simpleWithObject err");
		           }
		       });
		}

	})
})
</script>