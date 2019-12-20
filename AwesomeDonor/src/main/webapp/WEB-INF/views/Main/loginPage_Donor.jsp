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
<script>
function idcheck(){
    console.log("aaa");
    
    var frm1 = document.getElementById("f1");

    var param_index = 0;
    var param_names = [];
    var param_values = [];


    
    for(i = 0 ; i < frm1.elements.length ; i++){
      		if( !frm1.elements[0].value){
                  alert('아이디를 입력하세요!!');
                  return;
              }
      		if( !frm1.elements[1].value){
                alert('비밀번호를 입력하세요!!');
                return;
            }
              param_names[param_index] = frm1.elements[i].name;
              param_values[param_index] = frm1.elements[i].value;
              
              param_index++;
    	
    }

    //3.임의의 form 만들어서 배열에서 키,값 가져와서 다시 세팅 및 서브밋
    var submitForm = document.createElement("form");
    //폼 값 설정...
    submitForm.setAttribute("charset","UTF-8");
    submitForm.setAttribute("method","get"); //get,post ... (test)테스트 결과 URL에 보이기 위해 get 방식 사용했음
    submitForm.setAttribute("action", "./loginProcess_Donor");

    //전달할 키,값들 임의의 폼에 입력 양식 hidden으로 추가..
    for(i = 0 ; i < param_index ; i++){
        var hiddenField = document.createElement("input");

        hiddenField.setAttribute("type","hidden");
        hiddenField.setAttribute("name",param_names[i]);
        hiddenField.setAttribute("value",param_values[i]);

        submitForm.appendChild(hiddenField);
    }

    //4.임의로 만든 폼 body에 추가 후 submit
    document.body.appendChild(submitForm);

    submitForm.submit();
    //modal로 만든 다음에 이걸 실행되도록 만들기. 
}

function identificationError(identificationFail){
		swal({
			title : "인증 실패",
			text : identificationFail,
			button : "닫기"
		})
		
	}
	
function identificationComplete(identificationSuccess){
	swal({
		title : "인증 성공!!",
		text : identificationSuccess,
		button : "닫기"
	})
	
}
	</script>

</script>

    <title>개인 로그인</title>
    <style>
            @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
            header{ height: 100px; background-color: rgba(125, 211, 242,0.5); border-radius: 15px; padding: 10px; margin:10px 0;font-family: 'Nanum Gothic', sans-serif;  text-align: center;}
            footer {  text-align: center;}
            ul.nav { background-color:rgba(201, 201, 201,.5); padding: 10px; border-radius: 10px; }
            
            @font-face { 
			font-family: 'S-CoreDream-5Medium'; 
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
			font-weight: 100; 
			font-style: normal; 
			}

            body{
                width: 100%;
                height: auto;
                padding-top: 10%;
                padding-bottom: 10%;
                padding-left: 25%;
                padding-right: 25%;
                background-image: url("${pageContext.request.contextPath}/resources/img/배경.jpg");
                font-family: 'S-CoreDream-5Medium'; 
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
  	alert('로그인에 실패했습니다!\n아이디와 비밀번호를 확인해주세요!!');
  	</script>
  	</c:if>
  	
  	<c:if test = "${!empty identificationFail}"> 
  	<script>
  	alert('${identificationFail }');
  	</script>
  	</c:if>
  	
  	<c:if test = "${!empty identificationSuccess}"> 
  	<script>
  	alert('${identificationSuccess }');
  	</script>
  	</c:if>
  	
  	<c:if test = "${!empty needIdentification}"> 
  	<script>
  	alert('${needIdentification }');
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
                                <div class="btn-group" role="group" aria-label="Basic example">
                                        <a href="./loginPage_Donor"><button type="button" class="btn btn-secondary active">개인</button></a>
                                        <a href="./loginPage_Receiver"><button type="button" class="btn btn-secondary">기관</button></a>
                                </div>
                        </div>
                        <div class="col-md-3"></div>
                </div>
                
                <div class = row id = row4>
                        <div class="col-md-12">
                                <form id = "f1">
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-2> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">이메일</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name = Member_Donor_idEmail type="email" class="form-control" id="idEmail" aria-describedby="emailHelp" placeholder="이메일을 입력하세요!">
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
                                                <input name = Member_Donor_pw type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요!!">
                                            </div>
                                            <div class = col-md-2> </div>
                                        </div>
                                    </div>
                                </form>
                                
                                <button type="submit" class="btn btn-primary" onclick="idcheck()">로그인</button> <a href="./joinPage_Donor" class="btn btn-info">회원가입</a>
                               
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