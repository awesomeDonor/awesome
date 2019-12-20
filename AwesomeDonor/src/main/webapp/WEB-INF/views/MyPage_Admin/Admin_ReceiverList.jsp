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
    <style>
   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");<!--왜 이게 안 되는지 모르겠다...-->
		}
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>등록된 기관 관리</title>
   
  </head>
  <body>
    <div class="container">
   <jsp:include page="../header_forAdmin.jsp"></jsp:include>

          <!-- 왼: 검색 | 오: 배너 관리 기관 관리 후원자 관리-->
    <!-- ####################################관리자 추가################################################ -->
    <!-- ####################################관리자 추가################################################ -->
    <!-- 관리자만 보이는 관리자 메뉴. -->

    	<!--빈공간-->
    	<div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 70px; "></div>
        </div>
   		</div>
 
        <div class="row">
        	<div class="col-1"></div>
                <div class="col-4">
                <!-- --------일단 검색창만 복붙. 검색결과 나오는 것도 만들어야됨.....------- -->
                <div id="searchbar">
                    <form action = "#" class="row" id="search-bar-row">
                         <select name = search class="col-3 custom-select multiple" id="address" style="color:#403E38;">
                             <option value = both selected>기관명</option>
                         </select>
                         <input name = target type="text" class="col form-control" placeholder="Search" id="address">
                         <input type = hidden name = page value = 1>
                         <button type="submit" style="background-color:#736663; color: white; font-size: 14px; border-radius:5px 5px 5px 5px;" id="address">&nbsp;검색&nbsp;</button>
                    </form>
                </div>
                </div>
                <div class="col"></div>
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
                <div class="col-1"></div>
            </div>                 
                    
                    

   <div class = row>
   		<div class = "col"></div>
   		<div class="col-9">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px; overflow:scroll;">
            <table class="table table-sm" style="font-size: 12px; color:#736663; text-align: center;">
                <thead style=" background-color: #80716817">
                    <tr>
                    <th scope="col" style="font-size: 13px; color:#736663;">가입 날짜</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">기관 이름</th>
                  
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;기관 고유번호&nbsp;</th>

                    <th scope="col" style="font-size: 13px; color:#736663;">인증여부</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">삭제상태</th>
        			 <th scope="col" style="font-size: 13px; color:#736663;">자세히보기</th> 
                    
                    <c:if test="${!empty sessionData}">
	                	<c:if test="${!empty sessionData.session_Admin}">
	                    	<th scope="col" style="font-size: 13px; color:#736663;">인증 버튼</th>
	                    </c:if>
	                    <c:if test="${!empty sessionData.session_Admin}">
	                    	<th scope="col" style="font-size: 13px; color:#736663;"> 회원 삭제</th>
	                    	<th scope="col" style="font-size: 13px; color:#736663;"> 회원 복구</th>
	                    </c:if>
                	</c:if>
                    
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${dto }" var="dto">
						<tr>
						<td>${dto.member_Receiver_joinDate }</td>
						<th scope = row>${dto.member_Receiver_name }</th>
						<td>${dto.member_Receiver_identifyNumber}</td>
						<td>${dto.member_Receiver_identified }</td>
						<td>${dto.member_Receiver_removed }</td>						
						
						
						<c:if test="${!empty sessionData}">

<!-- 자세히보기 -->
<c:if test="${!empty sessionData.session_Admin}">
<td><a href="./Admin_Receiver_CloserLook?Member_Receiver_idx=${dto.member_Receiver_idx }">자세히보기</a></td>
</c:if>

<!-- 버튼 -->					<c:if test="${!empty sessionData.session_Admin}">
<!-- 기관 인증 -->	     			<td><a href="./ReceiverIdentifiedAction?Member_Receiver_idx=${dto.member_Receiver_idx }">인증</a></td>
	                    	</c:if>


							<c:if test="${!empty sessionData.session_Admin}">
<!-- 기관 삭제 -->					<td><a href="./ReceiverRemovedAction?Member_Receiver_idx=${dto.member_Receiver_idx }">✂</a></td>
<!-- 기관 복구 -->		  			<td><a href="./ReceiverRemovedBackAction?Member_Receiver_idx=${dto.member_Receiver_idx }">❤︎</a></td> 
	                    	</c:if>
	                    	
		        		</c:if>
						</tr>
					</c:forEach>	
                  
              
                </tbody>
            </table>
            </div>
            </div>
            </div>
            <div class = "col"></div>
		</div>
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
    </div>
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>