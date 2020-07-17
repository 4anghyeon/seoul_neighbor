<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/* 빈칸확인 */
function boardCheck() {
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (document.frm.content.value.length == 0) {
		alert("내용을 입력하세요.");
		return false;
	}
	if (document.frm.category.value.length == 0) {
		alert("카테고리를 선택하세요.");
		return false;
	}
	if (document.frm.location.value.length == 0) {
		alert("지역을 선택하세요.");
		return false;
	}
	return true;
}

/* 드롭다운 */
$("#dropdownButton ~ ul a").on("click", function() {
    // 버튼에 선택된 항목 텍스트 넣기 
    $("#dropdownButton").text($(this).text());
    console.log($(this).text())
    $("#category").val($(this).text());
});
</script>