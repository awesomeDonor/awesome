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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!--Bootstrap-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/kfonts2.css" rel="stylesheet">

    <style>
    @font-face { font-family: 'S-CoreDream-5Medium'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
    font-weight: normal; font-style: normal; }
    
   body {
   		background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
   		font-family:'S-CoreDream-5Medium';
		}

        #personalInfo {
            width: 375px;
            height: 180px;
            background-color: rgb(173, 165, 162);
            text-align: center;
            line-height: 170px;
            font-size: 30px;
            border-radius: 5px 0px 0px 0px;
            float: left;
        }

        #selection{
            width: 375px;
            height: 180px;
            background-color: rgb(219, 207, 203);
            text-align: center;
            line-height: 170px;
            font-size: 30px;
            border-radius: 0px 5px 0px 0px;
            float: left;
        }

        #receiverLike {
            width: 375px;
            height: 180px;
            background-color: #d3cec5;
            float: left;
            text-align: center;
            line-height: 170px;
            font-size: 30px;
            border-radius: 0px 0px 0px 5px;
        }

        #donationLog {
            width: 375px;
            height: 180px;
            float: left;
            text-align: center;
            line-height: 170px;
            font-size: 30px;
            background-color: #E6E0D7;
            border-radius: 0px 0px 5px 0px;
        }

        #managings {
            margin: 60px 0px 0px 50px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/headerStyle2.css" />"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>등록된 기관 </title>
    <script>
        function registerReceiverLike(Receiver_idx, Donor_idx) {
            $.ajax({
                dataType: "json",
                type: "post",
                url: "./registerReceiverLike",
                data: {
                    Member_Receiver_idx: Receiver_idx,
                    Member_Donor_idx: Donor_idx
                },//Url 매핑이 된 메소드에서 받는 변수
                success: function (result) { // result는 그 메소드에서의 return 값, 또는

                    if (result == true) {
                        alert("해당 기관을 관심기관으로 등록했습니다!");
                    } else {
                        alert('이미 관심기관 리스트에 담겨 있습니다!');
                    }

                }
            }
            );
        }
    </script>


</head>

<body>
    <div class="container">
        <jsp:include page="../header2.jsp"></jsp:include>
        <div class=row>
            <div class="col-2"></div>
            <div class="col-8">
                <div id="upborder"
                    style=" margin: 30px 0px 0px 0px; width: 850px; height: 50px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1; text-align:center;">
                    <h4 style="padding-top:10px;">${sessionData.session_Donor.sessionNick }님 환영합니다</h4>
                </div>
                <div id="designBorder"
                    style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 850px; height: 500px; border: 4px solid #B4A8A1; ">
                    <div id="managings">
                        <div id="personalInfo">
                            <a href="./personalInfo" style="color:#403E38;">개인정보 관리</a>
                        </div>
                        <div id="selection">
                            <a href="./selectionPage" style="color:#403E38;">찜하기</a>
                        </div>
                        <div id="receiverLike">
                            <a href="./likeReceiverPage" style="color:#403E38;">관심기관</a>
                        </div>
                        <div id="donationLog">
                            <a href="./donationLog" style="color:#403E38;">후원내역</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<footer id="footer" style="position: fixed; bottom: 1%; left: 37%; text-align: center; font-size: 11px; color: #A6A6AC;"> TEL:02-561-1911 / FAX:02-538-2613 </br>

	© Copyright 2019 CHOONGANG INSTITUTE, All Rights Reserved. </br></br>
	<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png" style="height: 20px; width: 20px;"></a>
	<a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath}/resources/img/insta.png" style="height: 20px; width: 20px;"></a>
	<a href="https://twitter.com/"><img src="${pageContext.request.contextPath}/resources/img/twitter.png" style="height: 20px; width: 20px;"></a>
	</footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>