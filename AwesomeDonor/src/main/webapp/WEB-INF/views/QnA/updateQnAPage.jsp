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
	
	<title>게시글 수정</title>
	
	<style type="text/css">
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
				<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">
					<div style="width: 800px; height: 450px; margin: 25px 10px 10px 25px;">
						<form action="./updateQnAProcess" method="post" name="fr" onsubmit="return check()">
							<a style="color:#736663;">작성자 : ${boardData.dto_Donor.member_Donor_nickName }</a><br>
							<a style="color:#736663;">제목 : </a>
							<input type="text" name="QnA_title" value="${boardData.dto_QnA.qnA_title }">
							<br><br>
							<div  class="form-group" style="margin: 0px 30px 20px 30px;">
								<textarea class="form-control" rows="15" cols="40" name="qnA_content" >${boardData.dto_QnA.qnA_content }</textarea>
								<br>
							</div>
							<input type="hidden" name="qnA_idx" value="${boardData.dto_QnA.qnA_idx }">
							<input type="submit" value="수정" class="btn btn-outline-secondary" style="float: right; margin: 0px 10px 0px 0px;">
						</form>
					</div>
				</div>
			</div>  
		</div>
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
	</div>
</body>
</html>