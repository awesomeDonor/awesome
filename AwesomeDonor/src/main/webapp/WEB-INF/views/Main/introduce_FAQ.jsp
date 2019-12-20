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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <script type="text/javascript">
   function checkSession(sessionData){
	   if(!sessionData){
		   alert('로그인을 해주세요!!');
		   window.location.href='./loginPage_Donor';
	   }else{
		   window.location.href='./myPage';
		   
	   }
   }
   </script>  

    <title>사이트소개_FAQ</title>
   <style>
   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");<!--왜 이게 안 되는지 모르겠다...-->
		}
   </style>
   <link href="../css/kfonts2.css" rel="stylesheet">
  </head>
  <body>
    <div class="container">
	<jsp:include page="../header2.jsp"></jsp:include>

         <!--빈공간-->
    <div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 30px; "></div>
        </div>
   		</div>

		<!-- 사이트 소개 / FAQ -->
     <div class="row">

        <div class="col-*">
            <a href="./introduce_introduce"><img src="${pageContext.request.contextPath}/resources/img/사이트소개_사이트소개.png" style="width: 101px; height: 29px;"></a>
        </div>
        <div class="col-*">
            <a href="./introduce_FAQ"><img src="${pageContext.request.contextPath}/resources/img/사이트소개_FAQ.png" style="width: 101px; height: 29px;"></a>
        </div>
        <div class="col-5"></div>
        <div class="col-1"></div>
    </div>

	<div id="content_introduce" style="position:absolute; margin: -265px 0px 0px -370px; top: 50%; left: 50%; text-align: center;">
		<img src="${pageContext.request.contextPath}/resources/img/사이트소개2.jpg" style="width: 746px; height: 1167px;">
		<br>
		<br>
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
	
	
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>