<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
</head>


  <body> 
  <header> 
  
    
     <%--상단 메뉴 --%>

     <div class="clear"></div> 
     <script src="/js/jquery.js"></script>
     
     
      
     <%--메인 본문 이미지 --%>
     <ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
      <img src="/images/index/main1.png" />
        </div>
    <div class="nav">
      <label for="img-6" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="/images/index/main2.png" />
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="/images/index/main3.png"  />
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="/images/index/main4.png"  />
        </div>
    <div class="nav">
      <label for="img-3" class="prev">&#x2039;</label>
      <label for="img-5" class="next">&#x203a;</label>
    </div>
    </li>



    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
    </li>
</ul>


    <nav> 
   
   <c:if test="${empty id}">
    <div id="login"><a href="login" class=btn1>로그인</a> | <a href="join" class=btn1>회원가입</a></div></c:if>
    
    <c:if test="${!(empty id)}">
    <c:if test="${rolecheck != 'ROLE_ADMIN' }">
    	<div id="login">
    		<a href="mypage" class=btn1>마이페이지</a> | <a href="logout" class=btn1>로그아웃</a>
   		</div>
   	</c:if>
   	 <c:if test="${rolecheck == 'ROLE_ADMIN' }">
    	<div id="login">
    		<a href="admin" class=btn1>관리자페이지</a> | <a href="logout" class=btn1>로그아웃</a>
   		</div>
   	</c:if>
    </c:if>
 
    <div class="clear"></div>  
    
     
    <%-- 회사로고 --%>
    <div id="logo"><a href="/index"><img src="/images/logo1.png"
    width="70px" height="70px" alt="Golf" /></a></div>
 
     <%--상단 메뉴 --%>
     
     <ul>
      <li><a href="/ranking"class=btn1>랭킹</a>
       <ul>
       <li><a href="/ranking">전체기록</a></li>
       <li><a href="/indivrank">개인기록</a></li>
       </ul>
       </li>
      <li><a href="/board_list"class=btn1>게시판</a>
       <ul>      
       <li><a href="/board_list">자유게시판</a></li>
       <li><a href="/scorecard_list">스코어카드<br>게시판</a></li>
       </ul>
       </li>
    	<li><a href="/golfcouse_list" class=btn1>골프장</a>
       <ul>
       <li><a href="/golfcouse_search">골프장 검색</a></li>
       <li><a href="/golfcouse_list">골프장 목록</a></li>
       </ul>
       </li>
      <li><a href="class_main"class=btn1>클래스</a>
       <ul>
       <li><a href="class_field">필드 클래스</a></li>
       <li><a href="class_online">온라인 클래스</a></li>
       </ul>
       </li>
      <li><a href="/customer_main"class=btn1>고객센터</a>
       <ul>
       <li><a href="/customer_main">1:1</a></li>
       <li><a href="/customer_holeinone">홀인원 보험</a></li>
       </ul>
       </ul>  
    </nav>

</header>
      <div class="clear"></div>
  
    
<div class="main_container">

        <div class="conB">
            <div class="conB_title">
                <i class="fas fa-university"><br><h5>명예의 전당</h5></i>
            </div>
            <div class="conB_container">
                <div class="conB_small_container">
                    <div class="conB_content" onclick="location:'indivrank?rId=<c:out value='${r_id0}'/>&rPoint_=<c:out value='${r_sum0}'/>&rankno=1위'">
                     <div id="conB_content_1"></div><br/><br/>
                        <h3 class="honorh3"><a href="indivrank?rId=<c:out value='${r_id0}'/>&rPoint_=<c:out value='${r_sum0}'/>&rankno=1위">${r_Nickname0 }</a></h3><br>
                        <p>포인트 : <span id="hide_1">${r_sum0 }</span>점</p>
                        
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_content">
                     <div id="conB_content_2"></div>
                     <br/><br/>
                        <h3 class="honorh3"><a href="indivrank?rId=<c:out value='${r_id1}'/>&rPoint_=<c:out value='${r_sum1}'/>&rankno=2위">${r_Nickname1 }</a></h3><br>
                        <p>포인트 : <span id="hide_2">${r_sum1 }</span>점</p>
                       
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_content">
                     <div id="conB_content_3"></div>
                     <br/><br/>
                        <h3 class="honorh3"><a href="indivrank?rId=<c:out value='${r_id2}'/>&rPoint_=<c:out value='${r_sum2}'/>&rankno=3위">${r_Nickname2 }</a></h3><br>
                        <p>포인트 : <span id="hide_3">${r_sum2 }</span>점</p>
                        
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_content">
                     <div id="conB_content_4"></div>
                     <br/><br/>
                        <h3 class="honorh3"><a href="indivrank?rId=<c:out value='${r_id3}'/>&rPoint_=<c:out value='${r_sum3}'/>&rankno=4위">${r_Nickname3 }</a></h3><br>
                        <p>포인트: <span id="hide_4">${r_sum3 }</span>점</p>
                        
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_content">
                     <div id="conB_content_5"></div>
                     <br/><br/>
                        <h3 class="honorh3"><a href="indivrank?rId=<c:out value='${r_id4}'/>&rPoint_=<c:out value='${r_sum4}'/>&rankno=5위">${r_Nickname4 }</a></h3><br>
                        <p>포인트 : <span id="hide_5">${r_sum4 }</span>점</p>
                      
                    </div>
                </div>
             
               
            </div>
        </div>
    </div>
    

    

 

<footer>
	<div id="foot_main"  > 
			<br/>
			<div id="logo_1">
				<img src="/images/logo4.png"/>
			</div>

		<div id="message">
			
			2022 GolForYou. ALL RIGHTS RESERVED.<br/><br/>
SOME INFORMATION ON THIS SITE MAY VARY SLIGHTLY BY<br/>
                     LOCATION AND IN STADIUMS, <br/>
                     EVENT VENUES AND INTERNATIONAL GolForYou.
		</div>
		</div>
</footer>
 <script>
 var tier = "";
 for(var i=1 ; i<=5 ; ++i){
		
	   var tierNum = $("#hide_"+i).html();
		
		if(tierNum < -15){
			tier = 'd.png';
			$("#conB_content_"+i).append("<img class='tierPic' alt='다이아' src='/images/t_"+tier+"'>");
			
		}else if(tierNum >= -15 && tierNum < -10){
			tier = 'p.png';
			$("#conB_content_"+i).append("<img class='tierPic' alt='플레' src='/images/t_"+tier+"'>");
			
		}else if(tierNum >= -10 && tierNum < -5){
			tier = 'g.png';
			$("#conB_content_"+i).append("<img class='tierPic' alt='골드' src='/images/t_"+tier+"'>");
			
		}else if(tierNum >= -5 && tierNum < 5){
			tier = 's.png';
			$("#conB_content_"+i).append("<img class='tierPic' alt='실버' src='/images/t_"+tier+"'>");
			
		}else{
			tier = 'b.png';
			$("#conB_content_"+i).append("<img class='tierPic' alt='브' src='/images/t_"+tier+"'>");
			
		}

	}
 </script>
</body>

</html>