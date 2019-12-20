<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
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
<title>관리자 마이페이지</title>
   
    <style type="text/css">
    body {
        background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');
    }
#bannerManaging {
    width: 375px;
    height: 200px;
    background-color: rgb(219, 207, 203);
    text-align: center;
    line-height: 180px;
    font-size: 30px;
    border-radius: 0px 5px 0px 0px;
    float: left;
}
#qnaManaging {
    width: 375px;
    height: 200px;
    background-color: rgb(173, 165, 162);
    text-align: center;
    line-height: 180px;
    font-size: 30px;
    border-radius: 5px 0px 0px 0px;
    float: left;
}
#receiverManaging {
    width: 375px;
    height: 200px;
    background-color: #d3cec5;
    float: left;
    text-align: center;
    line-height: 200px;
    font-size: 30px;
    border-radius: 0px 0px 0px 5px;
}

#donorManaging {
    width: 375px;
    height: 200px;
    float: left;
    text-align: center;
    line-height: 200px;
    font-size: 30px;
    background-color: #E6E0D7;
    border-radius: 0px 0px 5px 0px;
}

#managings{
    margin: 25px 0px 0px 50px;
}
#logo {
    margin: 10px 0px 0px 0px;
    width: 128px;
    height: 75px;
    background-color: ;
}

#login {
    text-align: center;
    margin: 55px 40px 0px 0px;
    font-size: 14px;
    background-color: ;
}

#menubar {
    width: 100%;
    height: 60px;
    background-color: ;
    position: relative;
    margin: 0px 0px 0px 10px;
}

.nav-item {
    line-height: 50px;
    width: 100%;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    margin: 0 auto;
}


#line{
	border: 0.5px solid #dbd7d0;
}

    </style>
</head>
<body style="height: 100%; margin: 0; padding: 0;">
	<c:choose>
		<c:when test="${!empty sessionData }">
		
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
                	<a href="./logout_Admin" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_로그아웃.png" style="height: 22px; width: 138px;"></a>
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
                        <a class="nav-link" href="./introduce_introduce" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_사이트소개.png" style="width: 138px; height: 22px;"></a>
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
    
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
        <div id="forCenter" style="position:absolute; margin: 10px 0px 0px -420px; top: 50%; left: 50%; text-align: center;">
            <div id="upborder" style="margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
                <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; "> 
                   <p style="font-size: 25px; color:#403E38; margin: 10px 0px 0px 0px;">${sessionData.session_Admin.sessionName } 관리자님 환영합니다.</p>
                    <div id="managings">
                        
						
                         <div id="qnaManaging">
                            <a href="./QnAPage" style="color:#403E38;">QnA 관리</a>
                        </div>
                        <div id="bannerManaging">
                            <a href="./managingBanner_Page" style="color:#403E38;">배너 관리</a>
                        </div>
                        <div id="receiverManaging">
                            <a href="./Admin_ReceiverList" style="color:#403E38;">기관 관리</a>
                        </div>
                        <div id="donorManaging">
                            <a href="./Admin_DonorList" style="color:#403E38;">후원자 관리</a>
                        </div>
                    </div>
                </div>
            </div>
        <div class="col-1"></div>
        </div>
    </div>
	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>	
	</div>
			
			
			
	
			
		</c:when>
		<c:otherwise>
		
		    <!--빈공간-->
    <div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 70px; "></div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
        <div id="forCenter" style="position:absolute; margin: 10px 0px 0px -420px; top: 50%; left: 50%; text-align: center;">
            <div id="upborder" style="margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
                <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; "> 
                   		<div id="managing" style="margin: 200px 0px 0px 0px;">
                   		<p style="font-size: 35px; color:#403E38; ">비회원으로 로그인 하였습니다.</p>
						<a href="./Admin_LoginPage">로그인 페이지로</a>
						</div>
                    </div>
                </div>
            </div>
        <div class="col-1"></div>
        </div>
    <footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
			

		</c:otherwise>
	</c:choose>

    
<!-- 
<c:if test="${!empty sessionData }">


<a href="./Admin_QnA" class="btn btn-info">QnA 관리</a>
<a href="./managingBanner_Page" class="btn btn-info">배너 관리</a>

<br>

<a href="./Admin_ReceiverList" class="btn btn-info">기관 관리</a>
<a href="./Admin_DonorList" class="btn btn-info">후원자 관리</a>

</c:if>
 -->
 
 
	

</body>
</html>