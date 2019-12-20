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

<script type="text/javascript">
   function checkSession(sessionData){
	   if(!sessionData){
		   alert('로그인을 해주세요!!');
		   window.location.href='./Admin_LoginPage';
	   }else{
		   window.location.href='./Admin_MyPage';
		   
	   }
   }
 </script> 

    <title>등록된 후원자 관리</title>
   
  </head>
  <body style="height: 100%; margin: 0; padding: 0;">
    <div class="container">

    <div class="row">
        <div class="col-2">
            <div id="logo">
                <a href="./"><img src="${pageContext.request.contextPath}/resources/img/logo.png" height="75" width="128"></a>
            </div>
        </div>
        <div class="col-8"></div>
        <div class="col-2">
            <div id="login">
            <c:choose>
            	<c:when test="${!empty sessionData }">
                	<a href="./logout" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_로그아웃.png" style="height: 22px; width: 138px;"></a>
                </c:when>
                <c:otherwise>
	                <a href="./Admin_LoginPage" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_로그인.png" style="height: 22px; width: 138px;"></a>
                </c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col">
            <div id="menubar">
                <ul class="nav nav-pills nav-justified" id="menubar2">
                    <li class="nav-item">
                        <a class="nav-link"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_사이트소개.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./donation_Requst_MainPage?Page=1" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_필요해요.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./receiverList" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_가입된 기관.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./QnAPage" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_QnA.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a href="./Admin_MyPage" class="nav-link"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_마이페이지.png" style="width: 138px; height: 22px; color:#736663;" onclick = "checkSession('${sessionData }')"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

          
         <!--빈공간-->
    	<div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 70px; "></div>
        </div>
   		</div>
                    
           <!-- 왼: 검색 | 오: 배너 관리 기관 관리 후원자 관리-->
        <div class="row">
                <div class="col-5">
                <!-- --------일단 검색창만 복붙. 검색결과 나오는 것도 만들어야됨.....------- -->
                <div id="searchbar">
                    <form action = "#" class="row" id="search-bar-row">
                         <select name = search class="col-2 custom-select multiple" id="address" style="color:#403E38;">
                             <option value = both selected>이름</option>
                         </select>
                         <input name = target type="text" class="col form-control" placeholder="Search" id="address">
                         <input type = hidden name = page value = 1>
                         <button type="submit" style="background-color:#736663; color: white; font-size: 14px; border-radius:5px 5px 5px 5px;" id="address">&nbsp;검색&nbsp;</button>
                    </form>
                </div>
                </div>
                <div class="col-1"></div>
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

   <div class = row>
   		<div class = "col-2"></div>
   		<div class="col-8">
   		<div id="forCenter" style="position:absolute; margin: 0px 0px 0px -420px; top: 50%; left: 50%; text-align: center;">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px; overflow:scroll;">
            <table class="table table-sm" style="font-size: 12px; color:#736663; text-align: center;">
                <thead style=" background-color: #80716817">
                    <tr>
                    <th scope="col" style="font-size: 13px; color:#736663;">Idx</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">가입 날짜</th>
                  
                    <th scope="col" style="font-size: 13px; color:#736663;">이메일(id)</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">이름</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">닉네임</th>
                    
                    <th scope="col" style="font-size: 13px; color:#736663;">삭제상태</th>
                    <c:if test="${!empty sessionData}">
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
						<td>${dto.member_Donor_idx }</td>
						<td>${dto.member_Donor_joinDate }</td>
						<td>${dto.member_Donor_idEmail }</td>
						<td>${dto.member_Donor_name}</td>
						<td>${dto.member_Donor_nickName }</td>
						<td>${dto.member_Donor_removed }</td>						
						
						
						<c:if test="${!empty sessionData}">

							<c:if test="${!empty sessionData.session_Admin}">
<!-- 후원자 삭제 -->					<td><a href="./DonorRemovedAction?Member_Donor_idx=${dto.member_Donor_idx }">✂</a></td>
<!-- 후원자 복구 -->		  			<td><a href="./DonorRemovedBackAction?Member_Donor_idx=${dto.member_Donor_idx }">❤︎</a></td> 
	                    	</c:if>
	                    	
		        		</c:if>
						</tr>
					</c:forEach>	
                  
              
                </tbody>
            </table>
            </div>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	</div>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
