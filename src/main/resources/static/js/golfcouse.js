/**
 * golfcouse.js
 */
function golfcouse(){
	
	
	 var fileCheck = document.getElementById("file2").value;
    if(!fileCheck){
        alert("이미지를 첨부해주세요!");
        return false;
    }
	
	
	if($.trim($("#gc_title").val())==""){
		alert("골프장을 입력하세요!");
		$("#gc_title").val("").focus();
		return false;
	}

	if($.trim($("#gc_english").val())==""){
		alert("골프장영문명을 입력하세요!");
		$("#gc_english").val("").focus();
		return false;
	}
	if($.trim($("#gc_area").val())==""){
		alert("지역을 입력하세요!");
		$("#gc_area").val("").focus();
		return false;
	}

	   if(form1.gc_hole.value == 'none'){
         alert("홀수를 선택해주세요!");
         return false;
     }
	
	
	if($.trim($("#gc_length").val())==""){
		alert("길이를 입력하세요!");
		$("#gc_length").val("").focus();
		return false;
	}
	if($.trim($("#gc_kind").val())==""){
		alert("잔디를 선택하세요!");
		$("#gc_kind").val("").focus();
		return false;
	}
	if($.trim($("#gc_type").val())==""){
		alert("코스타입을 선택하세요!");
		$("#gc_type").val("").focus();
		return false;
	}
	if($.trim($("#gc_configuration").val())==""){
		alert("코스구성을 선택하세요!");
		$("#gc_configuration").val("").focus();
		return false;
	}
	
		 if(form1.gc_caddy.value == 'none'){
         alert("캐디를 선택해주세요!");
         return false;
     }

		 if(form1.gc_cart.value == 'none'){
         alert("카트를 선택해주세요!");
         return false;
     }
	
	
	if($.trim($("#gc_architects").val())==""){
		alert("설계자를 입력하세요!");
		$("#gc_architects").val("").focus();
		return false;
	}
	if($.trim($("#gc_content").val())==""){
		alert("골프장 소개를 입력하세요!");
		$("#gc_content").val("").focus();
		return false;
	}
	if($.trim($("#gc_address_postcode").val())==""){
		alert("주소를 입력하세요!");
		$("#gc_address_postcode").val("").focus();
		return false;
	}
	if($.trim($("#gc_address_detailAddress").val())==""){
		alert("상세주소를 입력하세요!");
		$("#gc_address_detailAddress").val("").focus();
		return false;
	}
	
	if($.trim($("#gc_phone").val())==""){
		alert("전화번호를 입력하세요!");
		$("#gc_phone").val("").focus();
		return false;
	
	
	}
		if($.trim($("#gc_fax").val())==""){
		alert("팩스번호를 입력하세요!");
		$("#gc_fax").val("").focus();
		return false;
	
	
	}
	
		if($.trim($("#gc_move").val())==""){
		alert("이동경로를 입력하세요!");
		$("#gc_move").val("").focus();
		return false;
	
	
	}
	
		
		 if(form1.gc_date.value == 'none'){
         alert("개장년도를 선택해주세요!");
         return false;
     }
	


	
  }