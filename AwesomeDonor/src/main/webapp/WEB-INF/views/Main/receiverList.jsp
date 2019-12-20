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
   
   </style>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/requestStyle.css" />"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>등록된 기관 </title>
	<script>
	function registerReceiverLike(Receiver_idx, Donor_idx){
		$.ajax({
				dataType : "json",
				type : "post",
				url : "./registerReceiverLike",
				data : {
					Member_Receiver_idx : Receiver_idx,
					Member_Donor_idx : Donor_idx
				},//Url 매핑이 된 메소드에서 받는 변수
				success : function(result){ // result는 그 메소드에서의 return 값, 또는
					
					if(result == true){
						alert("해당 기관을 관심기관으로 등록했습니다!");
					}else{
						alert('이미 관심기관 리스트에 담겨 있습니다!');
					}
					
				}
			}	
		);
		}
	
	function readDetail(Member_Receiver_detail){
		swal({
			title : "기관소개",
			text : Member_Receiver_detail,
			button : "창 닫기"
		});
	}
	</script>
   
    
  </head>
  <body>
    <div class="container">
   <jsp:include page="../header2.jsp"></jsp:include>
   <jsp:include page="../receiverListSearchBar.jsp"></jsp:include>
   <div class = row>
   		<div class = "col-2"></div>
   		<div class="col-8">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 850px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
            <div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">  
            <div id="tablebox" style="width: 800px; height: 450px; margin: 25px 10px 10px 25px; overflow:scroll;">
            <table class="table table-sm" style="font-size: 12px; color:#736663; text-align: center;">
                <thead style=" background-color: #80716817">
                    <tr>
                    <th scope="col" style="font-size: 13px; color:#736663;">기관 이름</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">기관 분류</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;기관 주소&nbsp;</th>
                    <th scope="col" style="font-size: 13px; color:#736663;">&nbsp;&nbsp;웹사이트 url&nbsp;&nbsp;</th>
                    <c:if test="${!empty sessionData}">
                	<th scope="col" style="font-size: 13px; color:#736663;">기관에 대한 짧은 소개</th>
	                	<c:if test="${!empty sessionData.session_Donor}">
	                    	<th scope="col" style="font-size: 13px; color:#736663;"> 관심기관 추가</th>
	                    </c:if>
                	</c:if>
                    
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${dto }" var="dto">
						<tr>
						<th scope = row>${dto.member_Receiver_name }</th>
						<td>${dto.member_Receiver_Category }</td>
						<td>${dto.member_Receiver_AdCategory} ${dto.member_Receiver_adDetail}</td>
						<td><a href="http://${dto.member_Receiver_websiteUrl }">${dto.member_Receiver_websiteUrl }</a></td>
						<c:if test="${!empty sessionData}">
						<td><p href="필요해요 글읽기 팝업.html" style="font-size: 13px;" onclick = "readDetail('${dto.member_Receiver_introduction}')"><kbd style="background-color:#736663;">자세히보기</kbd></p></td>
							<c:if test="${!empty sessionData.session_Donor}">
                    			<td><button type="button" class="btn btn-info btn-sm" onclick="registerReceiverLike('${dto.member_Receiver_idx}', '${sessionData.session_Donor.sessionIdx }')">❤︎</button></td>
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