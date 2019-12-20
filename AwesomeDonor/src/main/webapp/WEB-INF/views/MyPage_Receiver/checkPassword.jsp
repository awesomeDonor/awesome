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
    @font-face { 
	font-family: 'S-CoreDream-5Medium'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
	font-weight: 100; 
	font-style: normal; 
	}

   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
   		font-family: 'S-CoreDream-5Medium'; 
		}
	#boxtitle{
	text-align: center;
	
	}
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
   	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/myPageMenuStyle.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>	

	<script>
function pwcheck(sessionIdx){
		
	var pw = document.getElementById("Member_Receiver_pw").value;
	
			$.ajax({
				dataType : "json",
				type : "post",
				url : "./pwcheck_Receiver",
				data : {
					Member_Receiver_pw : pw,
					Member_Receiver_idx : sessionIdx
				}, 
				success : function(result){ // result는 그 메소드에서의 return 값, 또는
					
					if(result == true){
						window.location.href="./readPrivateData_Receiver?Member_Receiver_idx="+sessionIdx;
					}else{
						alert('비밀번호가 틀렸습니다!');
					}
					
				}
			}	
		);
		}


	</script>

    <title>비밀번호 확인 </title>
<style type="text/css">
	#blank{
		height : 50px;
	}
	
	#upperRow, #lowerRow{
		height : 90px;
	}
	
	#middleRow{
		height : 170px;
	}
	
	#blank1{
		height : 25px;
	}
	
</style>
    
  </head>
  <body>
  <div class="container">
    <jsp:include page="../header2.jsp"></jsp:include>
    <div class = row>
   <jsp:include page="../receiverMyPageMenu.jsp"></jsp:include>
   <div class = col-1></div>
    <div class="col-8" >
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 550px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
    	<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 550px; background-color: #DBD7D0; height: 400px; border: 4px solid #B4A8A1; ">  
    		<div id="tablebox" style="width: 500px; height: 350px; margin: 25px 10px 10px 25px; ">
    			<div class = "row" id = upperRow>
    				
    			</div>
    			
    			<div class = "row" id = middleRow >
    				<div class = col-1></div>
    				<div class = col-10 style = "text-align: center;">
    					<div class = row >
    						<div class = col-12><h4>비밀번호 확인</h4></div>
    					</div>
    					<div class = row id = blank1></div>
    					
    					<div class = row >
    						
    						<div class = col-12>
    							<input type = password class="form-control-inline" style = "width : 200px;" id = Member_Receiver_pw>
    							<button type="submit" class="btn btn-primary" onclick = "pwcheck('${sessionData.session_Receiver.sessionIdx}')">입력</button>
    						</div>
    						
    						
    					</div>
    					
    				</div>
    				<div class = col-1></div>
    			</div>
    			
				<div class = row id = lowerRow>
					
				</div>
					  
    		</div>
    	</div>
    </div>
    	
    <div class = col-1></div>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>