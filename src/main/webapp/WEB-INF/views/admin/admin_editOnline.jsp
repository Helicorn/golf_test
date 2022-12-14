<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/class_admin.css">
<script src="/js/jquery.js"></script>
<script src="/js/class.js"></script>
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>

	<div id="header_body" style="width: 100%;"></div>
	<div id="wrap-edit2">
		<h2>온라인 클래스 수정하기</h2>
		<br />
		<form name="form4" method="post" action="/admin/editOnline_ok" enctype="multipart/form-data" onsubmit="return edit_check_online();">
			<input type="hidden" name="ono" value="${item.ono}">
			<table>
				<tr>
					<td><hr /></td>
					<td><hr /></td>
					<td><hr /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td>※ 클래스 기본 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>클래스명</td>
					<td><input name="otitle" id="otitle" size="70" value="${item.otitle}"></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td><select name="tno" id="tname">
							<option value="none">강사를 선택해주세요</option>
					</select> 프로</td>
				</tr>
				<tr>
					<td>강사 성별</td>
					<td><select name="tgender" id="tgender" disabled>
							<option>성별을 선택해주세요</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
					</select></td>
				</tr>
				<tr>
					<td>강사 소개 또는 경력사항</td>
					<td><textarea name="tcareer" id="tcareer" rows="9" cols="60" disabled></textarea></td>
				</tr>
				<tr>
					<td>클래스 전화번호</td>
					<td><input name="ophone" id="ophone" size="30" placeholder="예) 010-1234-5678" value="${item.ophone}"></td>
				</tr>
				<tr>
					<td>클래스 이미지</td>
					<td><input type="file" name="oimage2" id="oimage2" ></td>
				</tr>
				<tr>
					<td><br /> <br /></td>
				</tr>
				<tr>
					<td><hr /></td>
					<td><hr /></td>
					<td><hr /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td>※ 가격 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>

				<tr>
					<td>온라인 클래스 가격</td>
					<td><input name="oprice" id="oprice" value="${item.oprice}"> 원</td>
				</tr>
				<tr>
					<td>온라인 클래스 상세 설명</td>
					<td><textarea name="odesc" id="odesc" rows="5" cols="60" >${item.odesc}</textarea></td>
				</tr>
				<tr>
					<td>온라인 클래스 수강기간</td>
					<td>				
					<select name="otime" id="otime">
							<option value="none">수강 기간을 선택해주세요</option>
							<option value="90">90</option>
							<option value="120">120</option>
							<option value="180">180</option>
					</select> 일</td>
				</tr>
				<tr>
					<td>온라인 클래스 추천 레벨</td>
					<td><select name="olevel" id="olevel">
							<option value="none">레벨을 선택해주세요</option>
							<option value="골드">골드</option>
							<option value="실버">실버</option>
							<option value="브론즈">브론즈</option>
					</select></td>
				</tr>
				<tr>
					<td><br /> <br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="수정" class="btn01">
					<input type="button" value="목록" class="btn01" onclick="location='admin_classOnline';" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<div style="margin: 10% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>