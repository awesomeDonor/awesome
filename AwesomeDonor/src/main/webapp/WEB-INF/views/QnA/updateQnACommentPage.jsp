<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	    <!--Bootstrap-->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <link href="../css/kfonts2.css" rel="stylesheet">
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<title>게시글 읽기</title>
	<style>
		@font-face { 
			font-family: 'S-CoreDream-5Medium'; 
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
			font-weight: normal; 
			font-style: normal; 
		}	
		body {
			background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
			font-family: 'S-CoreDream-5Medium'; 
			}
	</style>
	<!-- 헤더스타일2 참조  --> 
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/myPageMenuStyle.css" />"/>
</head>



<body>
<div class="container">
	<jsp:include page="../header2.jsp"></jsp:include>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
			<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 600px; border: 4px solid #B4A8A1; ">
				<div style="width: 800px; height: 450px; margin: 25px 10px 10px 25px;">
					<div id=readQnABox>
					<!-- 글읽기 박스 -->
					<strong><h5>QnA</h5></strong><br>
						&nbsp;&nbsp;제목 : ${boardData.dto_QnA.qnA_title }<br><br>
						&nbsp;&nbsp;작성자 : ${boardData.dto_Donor.member_Donor_nickName }<br><br>
						&nbsp;&nbsp;작성일 : ${boardData.dto_QnA.qnA_writeDate }<br><br>
						&nbsp;&nbsp;내용 : <br>
						&nbsp;&nbsp;&nbsp;&nbsp;${boardData.dto_QnA.qnA_content }<br><br>
				
						<a href="./QnAPage" class="btn btn-outline-secondary" style="float: right; margin: 0px 10px 0px 0px;">목록으로</a>
						<c:if test="${boardData.dto_QnA.member_Donor_idx == sessionData.session_Donor.sessionIdx }">
							<a href="./updateQnAPage?qnA_idx=${boardData.dto_QnA.qnA_idx }" class="btn btn-outline-secondary" style="float: right; margin: 0px 10px 0px 0px;">수정</a>
							<a href="./deleteQnAProcess?qnA_idx=${boardData.dto_QnA.qnA_idx }" class="btn btn-outline-secondary" style="float: right; margin: 0px 10px 0px 0px;">삭제</a>
						</c:if>
					</div><!-- 글읽기 박스 종료 -->
					
					<br><br><br>
					
					<!-- 댓글수정 박스 -->
					<div id="commentUpdateBox">
						<p>댓글</p><br>
						<form action="./updateQnACommentProcess" method="post">
							<textarea rows="5" cols="80" name="qnA_Comment_content">${boardData.dto_QnA_Comment.qnA_Comment_content }</textarea>
							<input type = "hidden" name="qnA_idx" value= ${boardData.dto_QnA.qnA_idx } >
							<button type="submit" class="btn btn-outline-secondary">수정하기</button>
						</form>
					</div>	<!-- 댓글 수정 박스 종료.-->
					
				</div>	<!-- 디자인보더 마진 종료. -->
			</div>	<!-- 디자인보더 종료. -->
		</div>	<!-- col-8 종료. -->
	</div>	<!-- row 종료. -->
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
</div><!-- container 종료. -->

 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>