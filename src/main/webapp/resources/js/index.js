/**
 * index.js
 */


	// 로그인 성공 여부 ////////////////////////////////////////
	var result = '<%=request.getAttribute("result")%>'; // 로그인 결과값
	console.log(result);
	
	if(result == "fail"){
		alert("로그인 실패");
	};
	// 로그인 성공 여부 //


	