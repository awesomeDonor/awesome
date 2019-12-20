관리자_기부자관리<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>마이페이지_관리자(배너관리)</title>
   
    <style type="text/css">
    body {
        background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');
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

#bannerManaging {
    width: 750px;
    height: 380px;
    line-height: 53px;
    border-radius: 5px 5px 5px 5px;
    border: 2px solid rgb(219, 207, 203);
}

#managings{
    margin: 60px 0px 0px 50px;
}

#line{
	border: 0.5px solid #dbd7d0;
}

    </style>
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

        <!-- 왼: empty | 오: 배너 관리 기관 관리 후원자 관리-->
        <div class="row">
                <div class="col-6">
                </div>
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
            

    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
        <div id="forCenter" style="position:absolute; margin: 10px 0px 0px -420px; top: 50%; left: 50%; text-align: center;">
            <div id="upborder" style="margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
                <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; "> 
                    <div id="managings">
                        <div id="bannerManaging">
                            <div style="margin: 0px 0px 0px 0px; float: left;">
                                <img src="${pageContext.request.contextPath}/resources/img/관리자_배너_파일첨부.png" style="height:42px; width:144px;">
                            </div>
                        </br>
                        <div id="formsizing" style="margin: 40px 20px 0px 110px; height: 500px;">
                            <form action="./updateBannerAction" method="post" enctype="multipart/form-data">
                                <div class="form-group banner">      
                                    <label for="FormControlFile1" style="font-size: 25px; color:#736663; margin: 0px 20px 0px 0px;">배너1 : </label>
                                    <input type="file" name="file" class="form-control-file-sm" id="FormControlFile1" style="font-size: 16px; color:#736663; ">
                                    <input type="hidden" name="f_idx" value="1">
                                    <button type="submit" class="btn btn-outline-secondary banner" style="float: right; margin: 20px 0px 0px 0px;">수정</button>
                                </div>
                                
                              </form>
                              <form action="./updateBannerAction" method="post" enctype="multipart/form-data">
                                <div class="form-group banner"> 
                                    <label for="FormControlFile2" style="font-size: 25px; color:#736663; margin: 0px 20px 0px 0px;">배너2 : </label>
                                    <input type="file" name="file" class="form-control-file-sm" id="FormControlFile2" style="font-size: 16px; color:#736663;">
                                    <input type="hidden" name="f_idx" value="2">
                                    <button type="submit" class="btn btn-outline-secondary banner" style="float: right; margin: 20px 0px 0px 0px;">수정</button>
                                </div>

                                </form>
                                <form action="./updateBannerAction" method="post" enctype="multipart/form-data">
                                <div class="form-group banner"> 
                                    <label for="FormControlFile3" style="font-size: 25px; color:#736663; margin: 0px 20px 0px 0px;">배너3 : </label>
                                    <input type="file" name="file" class="form-control-file-sm" id="FormControlFile3" style="font-size: 16px; color:#736663;">
                                    <input type="hidden" name="f_idx" value="3">
                                    <button type="submit" class="btn btn-outline-secondary banner" style="float: right; margin: 20px 0px 0px 0px;">수정</button>
                                </div>
                                    
                            </form>
                        </div>
                        </div>
                    </div>     
                </div>
            </div>
        <div class="col-1"></div>
        </div>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    	<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br> </br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>
	
	</div>

	
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  

  </body>
</html>