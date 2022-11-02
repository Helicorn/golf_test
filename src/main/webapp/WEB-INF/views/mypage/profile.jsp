<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/mypage.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" /> 
<script src="/js/jquery.js"></script>
<script>
<%--팝업창--%>
function openPasswordPop(){
	var w =window.screen.width/2 - 200;
	var h =window.screen.height/2 - 200;
	
    var url = "changepwd";
    var name = "pwdChangePop";
    var option = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=504, height=370, left="+w+",top="+h+""; 

    window.open(url, name, option);
}


function openWithdrawalPop(){
	var w =window.screen.width/2 - 200;
	var h =window.screen.height/2 - 200;
	  
    var url = "withdrawal";
    var name = "WithdrawalPop";
    var option = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=600, height=430, left="+w+",top="+h+""; 

    window.open(url, name, option);
}

<%--팝업창 끝--%>

$("#image_section").on("change", function(e){ // change는 변화감지 , e는 이벤트를 전달받음
	var f = e.target.files[0];
	if(!f.type.match("image*")){ //match도 사용 가능
		$("#img_preview").val("");
		alert('이미지만 첨부할 수 있습니다.');
		
		}
	 
}); 

function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		
		reader.onload =function(e){
			$("#imgFile").attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
		
	}
}

$("#imgFile").change(function (){
	readURL(this);
});

function delImg(){
	$('#image_section').removeAttr('src');
	$('#image_section').attr('src','/images/member/blank_profile.png');
}

$('.edit-wrapper .tab').click(function(){
	if ($(this).hasClass('fix-button')){
		$('.edit-wrapper .tab').removeClass('active');
		$('.update-button').addClass('active');
		$('.cont').hide();
		$('.contents-input').show();
	}
	if ($(this).hasClass('update-button')){
			$('.edit-wrapper .tab').removeClass('active');
			$('.fix-button').addClass('active');
			$('.cont').hide();
			$('.contents').show();
			console.log(this);
	}		
	
});

</script>


<div class="clear"></div>
<br>

<%-- 마이페이지 - 회원 수정 페이지 --%>
<html>
<body id="profile">

	<div id="content" style="margin:200px 0px 0px 0px">
		<!-- left navigation -->
		<div class="left_navi">
			<h3>마이페이지</h3>

			<dl class="sub_menu">
			
				<dd>
					<a href="mypage">홈</a>
				</dd>
				<dd>
					<a href="indivrank">내 랭킹보기</a>
				</dd>
				<dd>
					<a href="class_main">수강내역</a>
				</dd>
				<dd>
					<a href="customer_fnq">1:1문의</a>
				</dd>
				<dd>
					<a href="profile">회원정보수정</a>
				</dd>
				
			</dl>


			<ul class="sub_menu_bt">

				<li class="callcenter">고객센터</li>
				<li class="callno">1588-0000(유료)</li>
				<li class="callcenter sub">평일 : 09:30~18:00</li>
				<li class="callcenter sub">(토, 일, 공휴일 휴무)</li>
			</ul>
		</div>
	</div>
	<!-- // left navigation -->




<div class="mypage">
	<form name="profile" method="post" action="profileEdit_ok" enctype="multipart/form-data">
	<div class="profileForm">
		
		<c:if test="${!empty m.mfile}"> 
		<div class="box">
			<img id="image_section" class="profileImg" src="/upload/profile${m.mfile}" alt=""/>
			
		</div>
			</c:if>
			
	<c:if test="${empty m.mfile}"> 
		<div class="box">
			<img id="image_section" class="profileImg" src="/images/member/blank_profile.png" alt=""/>
			
		</div>
			</c:if>
		
		
		<div style="align:center">
			<span>프로필 사진 변경</span><br><input id="imgFile" type="file" name="file" accept=".jpg,.png, .jpeg, .gif" value=""/><br>
	 		<%--<button class="del-button" onclick="delImg()">기본 프로필 사진으로 돌아가기</button> --%>
	 	
	 	</div>
	
		<div class="inputBoxVertical">
			<label>아이디</label><input type="text" name="username" class="textField"
				value="${id }" readonly><br>
	 	</div>
	 	<div class="inputBoxVertical">
	 	<label>닉네임</label><input type="text" name="nickname" id="nickname" class="textField" value="${m.nickname}">
	 	</div>
			<div class="inputBoxVertical">
			<label>이메일</label><input type="email" name="memail" class="textField"
					value="${m.memail}" readonly><br><%--<input
					type="button" name=button class="checkBtn" value="인증전송">--%>
			</div>
		
			<div class="inputBoxVertical">
			<label>휴대폰 번호</label><input type="tel" name="mphone" class="textField"
					pattern="^[0][1][0]-\d{4}-\d{4}$"
					value="${m.mphone}"><br>
			</div>
			
			<div class="inputBoxVertical">
			<label>주요 이용지역</label>
			<select id="mAddr" name="maddr" class="textField" selected="${m.maddr}">
			<option value="서울" <c:if test="${select_zone =='Seoul'}">${'selected'}
        			 </c:if>>서울</option>
					<option value="경기" <c:if test="${select_zone =='gg'}">${'selected'}
        			 </c:if>>경기</option>
					<option value="인천" <c:if test="${select_zone =='incheon'}">${'selected'}
        			 </c:if>>인천</option>
					<option value="그외" <c:if test="${select_zone =='etc'}">${'selected'}
        			 </c:if>>그외</option>
			</select>
			
			</div>
			
			<input type=submit id=editProfile class="submitBtn" value=회원정보수정 />
			<br><br>
			<div class="links">
				<a href="javascript:openPasswordPop();">비밀번호 변경하기</a> 
				<a href="javascript:openWithdrawalPop();">회원 탈퇴하기</a>
			</div>
	</div>
	</form>
	</div>
</body>
</html>



