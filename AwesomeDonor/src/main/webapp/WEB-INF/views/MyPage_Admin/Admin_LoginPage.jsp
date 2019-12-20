<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>관리자 로그인</title>
    <style>
            @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
            header{ height: 100px; background-color: rgba(125, 211, 242,0.5); border-radius: 15px; padding: 10px; margin:10px 0;font-family: 'Nanum Gothic', sans-serif;  text-align: center;}
            footer {font-family: 'Nanum Gothic', sans-serif;  text-align: center;}
            ul.nav { background-color:rgba(201, 201, 201,.5); padding: 10px; border-radius: 10px; }
            body{
                width: 100%;
                height: auto;
                padding-top: 10%;
                padding-left: 25%;
                padding-right: 25%;
                background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
            }

            .container{
                        height : 400px;
                        font-size: 16.5px;
                        font-weight: bold;
                        text-align: center;
                        background-color: #ffffff;
                        opacity: 0.8;
            }

            #row1{
                height : 30px;
            }

            #row2{
                height : 75px;
            }

            #logo{
                background-image: url("${pageContext.request.contextPath}/resources/img/logo.png");
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            }

            #row3{
                padding: 20px;
            }
            

    </style>
  </head>
  
  <body>
  <c:if test = "${!empty fail}"> 
	<script>
	alert('관리자님!!! 이러시면 안되죠!!\n아이디와 비밀번호를 확인해주세요!!');
	</script>
  </c:if>
    <div id = background>
            <div class = "container">
                <div class = row id = row1></div>
                <div class = row id = row2>
                    <div class="col-md-3"></div>
                    <div class="col-md-6" id = logo></div>
                    <div class="col-md-3"></div>
                </div>
                <div class = row id = row3>
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                                <!-- <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="./loginPage_Donor"><button type="button" class="btn btn-secondary active">개인</button></a>
                                        <a href="./loginPage_Receiver"><button type="button" class="btn btn-secondary">기관</button></a>
                                </div> -->
                        </div>
                        <div class="col-md-3"></div>
                </div>
                <div class = row id = row4>
                        <div class="col-md-12">
                                <form action = "./loginProcess_Admin">
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-2> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">관리자 아이디</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name = Member_Admin_id type="text" class="form-control" id="Member_Admin_id" placeholder="관리자 아이디 입력">
                                            </div>
                                            <div class = col-md-2> </div>
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-2> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">비밀번호</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name = Member_Admin_pw type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요!!">
                                            </div>
                                            <div class = col-md-2> </div>
                                        </div>
                                    </div>
                                        
                                    <button type="submit" class="btn btn-primary">로그인</button> <a href="./joinPage_Admin" class="btn btn-info">회원가입</a>
                                </form>
                               
                        </div>   
                </div>
            </div>
    </div>
    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>