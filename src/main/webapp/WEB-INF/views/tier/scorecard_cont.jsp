<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/includes/header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/css/ranking.css" />
<link rel="stylesheet" type="text/css" href="/css/scorecard_cont.css" />
<link rel="stylesheet" type="text/css" href="/css/board.css" />
<link rel="stylesheet" type="text/css" href="/css/foot.css" />
<br>

<script src="/js/jquery.js"></script>

<%-- 글내용 본문 --%>
<article id="sccont_main">
<br>
	<span class="sccont_title_1" id="sccont_tag">
		스코어카드 게시판
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="sccont_wrap">
	<div class="sccont_doublewrap">
	<form method="post" action="scorecard_notice">
	<input type="hidden" value="${sb.sc_no}" name="sc_no">
	<input type="hidden" value="${page}" name="page">
		<table class="sccont_t">
			<tr height="9%">
				<th><input class="sccont_text" id="sccont_title" readonly value="[제목] ${sb.sc_title }"></th>
			</tr>
			<c:if test="${sb.sc_playdate != null }">
			<tr height="9%">
				
				<th>
				<c:if test="${sb.sc_file != null }">
					<img src="/upload/scboard${sb.sc_file }" width="800px" height="200px" alt="스코어카드">
					<br>
				</c:if>
				<input class="sccont_text" id="sccont_date" readonly value="[방문 날짜] ${sb.sc_playdate }">
				</th>
			</tr>	
			</c:if>
			
			<tr height="58%">
				<th>
					<hr style="border:0; padding:0.5px; background-color:grey; width:80%;">
					<textarea class="sccont_text" readonly style="resize:none">${sb.sc_cont }</textarea>
				</th>
			</tr>
			
			<tr height="9%">
				<td>
					<div class="sccont_menu">
						<c:if test="${roleCheck == 'ROLE_ADMIN'}"> <!-- 관리자인 경우 -->
							<input type="submit" class="CheckBtn_sccont" value="공지/취소">
						</c:if>
						<input type="button" class="CheckBtn_sccont" value="답변" onclick="location='scorecard_cont?sc_no=${sb.sc_no}&page=${page }&state=reply';">
						<c:if test="${(id == sb.sc_id) || (roleCheck == 'ROLE_ADMIN') }"> <!-- 글쓴 본인이거나 관리자인 경우 -->
							<input type="button" class="CheckBtn_sccont" value="수정" onclick="location='scorecard_cont?sc_no=${sb.sc_no}&page=${page }&state=edit';">
							<input type="button" class="CheckBtn_sccont" value="삭제" onclick="location='scorecard_cont?sc_no=${sb.sc_no}&page=${page }&state=del';">
						</c:if>						
						<input type="button" class="CheckBtn_sccont" value="목록" onclick="location='scorecard_list?page=${page }';">						
					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	
</article>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
<br>
