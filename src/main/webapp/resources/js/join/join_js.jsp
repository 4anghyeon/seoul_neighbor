<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	//최종적으로 submit 하기 위해 점검 변수
	var id, email, pw, name, location;

	//아이디 입력 검증
	verifyID = function () {
	    
	    var userIDVal = $("#userId").val();
	    var regExp = /^[0-9a-z]{5,20}$/;
	    var pattern_special = /[~!@#$%^&*()_+|<>?:{}]\s/;
	    
	    
	    $("#userId-duplicated-text").removeClass("wrong-text-show");
	    $("#userId-wrong-text").removeClass("wrong-text-show");
	    $("#userId").parent().removeClass("wrong-input");
	    
	    if (userIDVal.match(regExp) != null) {
	        $("#userIdV").addClass("vCheck-icon-show");
	        id = true; //아이디가 형식에 맞게 작성이 되있음
	    }
	    else {
	        $("#userId").parent().addClass("wrong-input");
	        $("#userId-wrong-text").addClass("wrong-text-show");
	        $("#userIdV").removeClass("vCheck-icon-show");
	        id = false; //아이디가 형식에 맞지 않음
	    }
	    
	    //id가 형식에 맞다면 ajax로 중복된 값인지 체크
	    if(id){
	    	var idStatus;
	    	$.ajax({
	    		url: "/checkId/" + userIDVal,
	    		type: "GET",
	    		dataType: "text",
	    		success: function(result, status, xhr){
	    			console.log(result);
	    			idStatus = result;
	    			if(idStatus == 'duplicated'){
	    	    		console.log("idStatus : " + idStatus);
	    	    		
	    	    		$("#userId").parent().addClass("wrong-input");
	    	    		$("#userId-duplicated-text").addClass("wrong-text-show");
	    	    		$("#userIdV").removeClass("vCheck-icon-show");
	    	    	}
	    		}
	    	});
	    }
	    
	}

	// 닉네임 입력 검증
	verifyNickName = function () {

	    var nickNameVal = $("#nickName").val();
	    var regExp = /^[\wㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z]{2,10}$/;
	    
	    $("#nickName-duplicated-text").removeClass("wrong-text-show");
	    $("#nickName-wrong-text").removeClass("wrong-text-show");
	    $("#nickName").parent().removeClass("wrong-input");
	    
	    if (nickNameVal.match(regExp) != null) {
	        $("#nickNameV").addClass("vCheck-icon-show");
	        name = true;
	    }
	    else {
	        $("#nickName").parent().addClass("wrong-input");
	        $("#nickName-wrong-text").addClass("wrong-text-show");
	        $("#nickNameV").removeClass("vCheck-icon-show");
	        name = false;
	    }
	    
	  //닉네임이 형식에 맞다면 ajax로 중복된 값인지 체크
	    if(name){
	    	var nameStatus;
	    	$.ajax({
	    		url: "/checkId/" + nickNameVal,
	    		type: "GET",
	    		dataType: "text",
	    		success: function(result, status, xhr){
	    			console.log(result);
	    			nameStatus = result;
	    			if(nameStatus == 'duplicated'){
	    	    		console.log("nameStatus : " + nameStatus);
	    	    		
	    	    		$("#nickName").parent().addClass("wrong-input");
	    	    		$("#nickName-duplicated-text").addClass("wrong-text-show");
	    	    		$("#nickNameV").removeClass("vCheck-icon-show");
	    	    	}
	    		}
	    	});
	    }
	}

	// 이메일 검증 스크립트 작성
	verifyEmail = function () {
	    
	    var emailVal = $("#email").val();

	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	    if (emailVal.match(regExp) != null) {
	        $("#email").parent().removeClass("wrong-input");
	        $("#email-wrong-text").removeClass("wrong-text-show");
	        $("#emailv").addClass("vCheck-icon-show");
	        email = true;
	    }
	    else {
	        $("#email").parent().addClass("wrong-input");
	        $("#email-wrong-text").addClass("wrong-text-show");
	        $("#emailv").removeClass("vCheck-icon-show");
	        email = false;
	    }
	}
	
	 // 비밀번호 검증 스크립트 작성
	var pwVerifyOk = false; // 비밀번호 확인용
	verifyPW = function () {
	   
	    var pwVal = $("#pw").val();

	    var regExp = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	    if (pwVal.match(regExp) != null) {
	        $("#pw").parent().removeClass("wrong-input");
	        $("#pw-wrong-text").removeClass("wrong-text-show");
	        $("#pwv").addClass("vCheck-icon-show");
	        pwVerifyOk=true;
	    }
	    else {
	        $("#pw").parent().addClass("wrong-input");
	        $("#pw-wrong-text").addClass("wrong-text-show");
	        $("#pwv").removeClass("vCheck-icon-show");
	        pwVerifyOk=false;
	    }
	}

	// 비밀번호 확인 검증 스크립트 작성
	verifyPWcheck = function () {
	    
	    var pwVal = $("#pw").val();
	    var pwCheck = $("#pwcheck").val();

	    if (pwVerifyOk&&pwVal == pwCheck) {
	        $("#pwcheck").parent().removeClass("wrong-input");
	        $("#pwc-wrong-text").removeClass("wrong-text-show");
	        $("#pwcv").addClass("vCheck-icon-show");
	        pw = true;
	    }
	    else {
	        $("#pwcheck").parent().addClass("wrong-input");
	        $("#pwc-wrong-text").addClass("wrong-text-show");
	        $("#pwcv").removeClass("vCheck-icon-show");
	        pw = false;
	    }
	}
	
	// 지역선택 검증 스크립트
	verifyLocation = function () {
	    
	    var locationVal = $("#memberLocation").val();

	    if (locationVal) {
	        $("#memberLocation").parent().removeClass("wrong-input");
	        $("#location-wrong-text").removeClass("wrong-text-show");
	        $("#locationV").addClass("vCheck-icon-show");
	        location = true;
	    }
	    else {
	        $("#memberLocation").parent().addClass("wrong-input");
	        $("#location-wrong-text").addClass("wrong-text-show");
	        $("#locationV").removeClass("vCheck-icon-show");
	        location = false;
	    }
	}
	
	
	//지역선택?
	$("#memberLocation").focus(function(){
		$("#memberLocation").trigger("blur");
		new daum.Postcode({
            oncomplete: function(data) {
                gu = data.sigungu; // 구
				dong = data.bname; // 동
                console.log(gu+dong);
				$("#memberLocation").val(gu+" "+dong)
            }
        }).open();
		
		
	});
	

	//버튼 누를시 전체 입력값 제대로 된지 검사하기
	verifyAll = function() {
		verifyID()
	    verifyEmail();
		verifyNickName();
	    verifyPW();
	    verifyPWcheck();
	    verifyLocation();
	    if(!email||!pw||!pwVerifyOk||!name||!location){
	        return false;
	    }
	}

})
</script>