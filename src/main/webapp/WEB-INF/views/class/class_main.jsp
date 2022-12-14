<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/class_main.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />
<script>
	function navigo() {
		const header = document.querySelector('header');
		const headerheight = header.clientHeight;
		document.addEventListener('scroll', onScroll, {
			passive : true
		});
		function onScroll() {
			const scrollposition = pageYOffset;
			const nav = document.querySelector('nav');
			if (headerheight <= scrollposition) {
				nav.classList.add('fix')
			} else {
				nav.classList.remove('fix');
			}
		}

	}
	navigo()
</script>
</head>
<body>

	<div id="wrap">
		<form method="get" action="class_main">
			<div>
				<h1 id="name-tag">전체 클래스</h1>
			</div>
			<hr class="hr-line">
			<div class="category">
				<ul class="province_1">
					<li><a href="class_main">전체</a></li>
					<li><a href="class_field">필드 클래스</a>
						<ul class="province_2" id="province_2">
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=수도권"> 수도권</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=강원도"> 강원도</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=충청도"> 충청도</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=전라도"> 전라도</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=경상도"> 경상도</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_field?faddr=제주도"> 제주도</a></li>
						</ul></li>
					<li><a href="class_online">온라인 클래스</a>
						<ul class="province_2" id="province_2">
							<li><i class="fas fa-map-marker-alt"></i><a href="class_online?olevel=골드"> 골드</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_online?olevel=실버"> 실버</a></li>
							<li><i class="fas fa-map-marker-alt"></i><a href="class_online?olevel=브론즈"> 브론즈</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="subject">
				<div class="subject-01">
					<div class="cList_count">총 클래스 개수: ${listcount} 개</div>

					<%--검색 폼추가 --%>
					<div id="cFind_wrap">
						<select name="find_field" class="class-title">
							<option value="atitle"
								<c:if test="${find_field=='atitle'}">
   ${'selected'}</c:if>>클래스명</option>
							<option value="tname"
								<c:if test="${find_field=='tname'}">
   ${'selected'}</c:if>>강사명</option>
						</select> <input name="find_name" id="find_name" size="14"
							value="${find_name}" /> <input type="submit" value="검색"
							class="searchbtn" /> <input class="searchbtn" type="button"
							value="전체목록" onclick="location='class_main?page=${page}';" />

					</div>
				</div>
				<div class="class-btns">
					<c:if test="${!empty alist}">
						<c:forEach var="a" items="${alist}">
							<button id="class-btn" type="button" onclick="onDetail('${a.classtype}', '${a.ano}')">
								<div class="class-box">
									<%--c:if test="${!empty c.cimage}">
									<div class="cimage">
										<img src="/upload${c.cimage}" class="thumbnail-img"/>
									</div>
								</c:if--%>
									<c:choose>
										<c:when test="${!empty a.aimage}">
											<div class="aimage">
												<img src="/upload/class${a.aimage}" class="thumbnail-img" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="aimage">
												<img src="/images/class/aaaa.jpg" class="thumbnail-img" />
											</div>
										</c:otherwise>
									</c:choose>

									<div class="tname">${a.tname}&nbsp;프로</div>
									<div class="atitle">${a.atitle}</div>
									<div class="aprice">
										<c:if test="${a.aprice != '0'}">
											<fmt:formatNumber value="${a.aprice}" pattern="#,###" />
										</c:if>
										원
									</div>
								</div>
							</button>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<%--페이징(쪽나누기)--%>
			<div id="cList_paging">
				<%--검색전 페이징 --%>
				<c:if test="${(empty find_field)&&(empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a href="class_main?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="class_main?page=${a}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="class_main?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%--검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a
							href="class_main?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						<%--현재 쪽번호가 선택된 경우 --%>

						<c:if test="${a != page}">
							<%--현재 쪽번호가 선택 안된 경우 --%>
							<a
								href="class_main?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="class_main?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>

			</div>
		</form>
	</div>
</body>
<div style="margin: 15% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>
<script>
function onDetail(classtype, ano) {
	//alert('test'+classtype+ano);
 	if(classtype === 'field'){
 		var fno = ano;
		location.href='class_detailField?fno='+fno;
 	}
	else if(classtype === 'online'){
		var ono = ano;
		location.href='class_detailOnline?ono='+ono;
	}
}
</script>