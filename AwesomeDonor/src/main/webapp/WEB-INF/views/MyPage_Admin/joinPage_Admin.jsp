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

    <title>관리자 회원가입</title>

    <script>
	//JQuery AJAX 예제... // 
function confirmId_Donor(){
		
		
		var idBox = document.getElementById("Member_Donor_idEmail");
		
		var idValue = idBox.value;
		
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직...., 이건 가상 메소드라고 생각하면 됨. 
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				
				//alert(xmlhttp.responseText);
				
				var result = JSON.parse(xmlhttp.responseText);
				
				if(result== false){
					alert("이미 존재하는 아이디 입니다.");
				}else{
					alert("사용 가능한 아이디 입니다.");
				}
				
				
			}
		};
		
		xmlhttp.open("post","./confirm_idEmail_Donor" , true);
		xmlhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded");

		xmlhttp.send("Member_Donor_idEmail=" + idValue);		
		
		
	}
	
		
	

</script>
    <style>
            @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
            header{ height: 100px; background-color: rgba(125, 211, 242,0.5); border-radius: 15px; padding: 10px; margin:10px 0;font-family: 'Nanum Gothic', sans-serif;  text-align: center;}
            footer {font-family: 'Nanum Gothic', sans-serif;  text-align: center;}
            ul.nav { background-color:rgba(201, 201, 201,.5); padding: 10px; border-radius: 10px; }
            body{
                width: 100%;
                height: auto;
                padding-top: 10%;
                padding-bottom: 10%;
                padding-left: 25%;
                padding-right: 25%;
                background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
            }

            .container{
                        height : 700px;
                        font-size: 16.5px;
                        font-weight: bold;
                        text-align: center;
                        background-color: #ffffff;
                        opacity: 0.8;
            }

            .form-group{
                text-align: left;
            }

            #row_blank{
                height : 30px;
            }

            #row_logo{
                height : 75px;
            }

            #logo{
                background-image: url("${pageContext.request.contextPath}/resources/img/logo.png");
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            }

            #row_title{
                padding: 20px;
            }

            #blankAboveButton{
                height : 22px;
            }

            #blankontheLeftofButton{
                margin-left: 30px;
            }


            
            

    </style>
  </head>
  <body>
    <div id = background>
            <div class = "container">
                <div class = row id = row_blank></div>
                <div class = row id = row_logo>
                    <div class="col-md-3"></div>
                    <div class="col-md-6" id = logo></div>
                    <div class="col-md-3"></div>
                </div>
                <div class = row id = row_title>
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                                <h1><span class="badge badge-success">관리자 회원가입</span></h1>
                        </div>
                        <div class="col-md-2">
                            <div class = row id = blankAboveButton></div>
                            
                        </div>
                        <div class = "col-md-1"></div>
                </div>
                <div class = row id = row4>
                        <div class="col-md-12">
                                <form action = "./joinProcess_Admin"> 
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">관리자 아이디</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name = Member_Admin_id type="text" class="form-control" id="Member_Admin_id" placeholder="관리자 아이디">
                                            </div>
                                            <div class = col-md></div>
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">비밀번호</label>
                                            </div>
                                            <div class = col-md-8>
                                                <input name = Member_Admin_pw type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요!!">
                                            </div>
                                            <div class = col-md-1> </div>
                                        </div>
                                    </div>
                              
                                   

                                    <button type="submit" class="btn btn-primary">회원가입</button>
                                    
                                </form>
                               
                        </div>   
                </div>
            </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script><!--ajax를 쓰기 위해서는 여기를 바꿔줘야 한다!!! -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>