<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko-kr">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!--Bootstrap-->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/kfonts2.css" rel="stylesheet">

	<!-- CSS -->
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
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/myPageMenuStyle.css" />"/>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<title>QnA</title>
</head>



<body>
<div class="container">
   <jsp:include page="../header2.jsp"></jsp:include>
       <!-- 관리자만 보이는 관리자 메뉴. -->
    <c:if test="${!empty sessionData.session_Admin}">
    	<!--빈공간-->
    	<div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 70px; "></div>
        </div>
   		</div>
    		<div class="row">
    		<div class="col-7"></div>
    			<div class="col-*">
                        <a href="./QnAPage"><img src="${pageContext.request.contextPath}/resources/img/관리자_QnA 관리.png" style="width: 101px; height: 29px;"></a>
                </div>
                <div class="col-*">
                        <a href="./managingBanner_Page"><img src="${pageContext.request.contextPath}/resources/img/관리자_배너 관리.png" style="width: 101px; height: 29px;"></a>
                </div>
                <div class="col-*">
                        <a href="./Admin_ReceiverList"><img src="${pageContext.request.contextPath}/resources/img/관리자_기관 관리.png" style="width: 101px; height: 29px;"></a>
                </div>
                <div class="col-*">
                        <a href="./Admin_DonorList"><img src="${pageContext.request.contextPath}/resources/img/관리자_후원자 관리.png" style="width: 101px; height: 29px;"></a>
                </div>
             </div>
    </c:if>
	<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
			
			<!-- 디자인보더 위 업보더. 시작~끝. -->
			<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
			<!-- 디자인보더 시작. -->
			<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">
				<!-- 테이블박스 시작. -->
				<div id="tablebox" style="overflow:scroll; width: 800px; height: 400px; margin: 25px 10px 10px 25px;">
					
					<!-- 테이블 시작. -->
					<table class="table" style="font-size: 12px; color:#736663; text-align: center;">
						<!-- 테이블헤드 시작. -->
						<thead style="background-color: #80716817">
							<tr>
								<th scope="col" style="font-size: 13px; color:#736663;">글번호</th>
								<th scope="col" style="font-size: 13px; color:#736663;">제목</th>
								<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;</th>
								<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;닉네임&nbsp;&nbsp;</th>
								<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;조회수&nbsp;&nbsp;</th>
								<th scope="col" style="font-size: 13px; color:#736663;">&nbsp;날짜&nbsp;</th>
							</tr>
						</thead><!-- 테이블헤드 종료. -->
						
						<!-- 테이블 게시글 시작. -->
						<tbody>
							<c:forEach items="${boardData }" var="boardData">
								<tr>
									<td>${boardData.dto_QnA.qnA_idx }</td>
									<td>
										<a href="./readQnAPage?qnA_idx=${boardData.dto_QnA.qnA_idx }">
										${boardData.dto_QnA.qnA_title }
										</a>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty boardData.dto_QnA_Comment.qnA_idx}">
											[0]
											</c:when>
											<c:when test="${!empty boardData.dto_QnA_Comment.qnA_idx}">
											[1]
											</c:when>
										</c:choose>
									</td>
									<td>${boardData.dto_Donor.member_Donor_nickName }</td>
									<td>${boardData.dto_QnA.qnA_count }</td>
									<td>${boardData.dto_QnA.qnA_writeDate }</td>
								</tr>
							</c:forEach>           
						</tbody><!-- 테이블 게시글 종료. -->
					</table>
				</div>	<!-- 테이블박스 종료. -->
			
				<!-- 목록으로, 내글보기, 글쓰기 -->
				<a href="./QnAPage" class="btn btn-outline-secondary" style="float: right; margin: 0px 10px 0px 0px;">목록으로</a>
				<c:if test="${!empty sessionData.session_Donor}">
					<a href="./MyQnAPage" class="btn btn-outline-secondary" style="float: right; margin: 0px 30px 0px 0px;">내글보기</a>
				</c:if>
	
				<c:if test="${!empty sessionData.session_Donor}">
					<a href="./writeQnAPage" class="btn btn-outline-secondary" style="float: right; margin: 0px 30px 0px 0px;">글쓰기</a>
				</c:if>

			</div>	<!-- 디자인보더 종료. -->
		</div>	<!-- col-8 종료. -->
	</div>	<!-- row 종료. -->
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
</div>	<!-- 컨테이너 종료. -->

  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>