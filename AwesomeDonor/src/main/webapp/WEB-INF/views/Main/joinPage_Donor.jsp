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
    <title>개인 회원가입</title>

  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
	var ischecked = false;
	
    function checkJoin(){
        console.log("aaa");

        if(ischecked==false){
        	alert('아이디 중복확인을 해주세요!!');
        	return;
        }
        
        var frm1 = document.getElementById("f1");

        var param_index = 0;
        var param_names = [];
        var param_values = [];

        var id = frm1.elements[0].value;
        
        for(i = 0 ; i < frm1.elements.length ; i++){
          if(i!=1){
        	  if(i!=5){
          		if( !frm1.elements[i].value){
                      alert('폼을 완성해주세요!!');
                      return;
                  }
          	}
                  param_names[param_index] = frm1.elements[i].name;
                  param_values[param_index] = frm1.elements[i].value;
                  
                  param_index++;

          } 
        	
        }

        //3.임의의 form 만들어서 배열에서 키,값 가져와서 다시 세팅 및 서브밋
        var submitForm = document.createElement("form");
        //폼 값 설정...
        submitForm.setAttribute("charset","UTF-8");
        submitForm.setAttribute("method","get"); //get,post ... (test)테스트 결과 URL에 보이기 위해 get 방식 사용했음
        submitForm.setAttribute("action", "./joinProcess_Donor");

        //전달할 키,값들 임의의 폼에 입력 양식 hidden으로 추가..
        for(i = 0 ; i < param_index ; i++){
            var hiddenField = document.createElement("input");

            hiddenField.setAttribute("type","hidden");
            hiddenField.setAttribute("name",param_names[i]);
            hiddenField.setAttribute("value",param_values[i]);

            submitForm.appendChild(hiddenField);
        }
        
        swal({
			title : "알림",
			text : id+"로 인증메일이 발송되었습니다!!",
			button : "닫기"
		})
		.then((value)=>{
			//4.임의로 만든 폼 body에 추가 후 submit
	        document.body.appendChild(submitForm);

	        submitForm.submit();
	        //modal로 만든 다음에 이걸 실행되도록 만들기. 
		});
    }	
    
   
function typing(){
	ischecked = false;
}
    
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
				
				if(result == true){
					alert("사용 가능한 아이디 입니다.");
					ischecked=true;
				}else{
					alert('이미 존재하는 아이디 입니다.');
					ischecked = false;
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
                                <h1><span class="badge badge-success">개인 회원가입</span></h1>
                        </div>
                        <div class="col-md-2">
                            <div class = row id = blankAboveButton></div>
                            <div class = row>
                                <div class = col-md-2></div>
                                <div class = col-md-10 id = blankontheLeftofButton><a href="./joinPage_Receiver" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">기관</a> </div>
                            </div>
                        </div>
                        <div class = "col-md-1"></div>
                </div>
                <div class = row id = row4>
                        <div class="col-md-12">
                                <form id = "f1"> 
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">이메일</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name = Member_Donor_idEmail type="email" class="form-control" id="Member_Donor_idEmail" onchange = "typing()" aria-describedby="emailHelp" placeholder="example@email.com">
                                            </div>
                                            <div class = col-md-2><button type="button" class="btn btn-info btn-sm" onclick="confirmId_Donor()">중복확인</button></div>
                                            <div class = col-md-1></div>
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">비밀번호</label>
                                            </div>
                                            <div class = col-md-8>
                                                <input name = Member_Donor_pw type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요!!">
                                            </div>
                                            <div class = col-md-1> </div>
                                        </div>
                                    </div>
                                    <!-- 이건 나중에 할 수 있을 때 추후에 구현하는 것으로. 
                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">비밀번호 확인</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="다시 한번 입력하세요!!">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>
                                    -->
                                    <div class = row>
                                        <div class = col-md-1></div>
                                        <div class = col-md-6>
                                                <div class="form-group">
                                                        <div class = "row">
                                                            <div class = col-md-4>
                                                                <label for="formGroupExampleInput">이름</label>
                                                            </div>
                                                            <div class = col-md-7>
                                                                <input name = Member_Donor_name type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ex)홍길동">
                                                            </div>
                                                            <div class = col-md-1> </div>
                                                        </div>
                                                </div>
                                                <div class="form-group">
                                                        <div class = "row">
                                                            <div class = col-md-4>
                                                                <label for="formGroupExampleInput">닉네임</label>
                                                            </div>
                                                            <div class = col-md-7>
                                                                <input name = Member_Donor_nickName type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ex)조느단">
                                                            </div>
                                                            <div class = col-md-1> </div>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class = col-md-4>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlFile1">사진 등록-필수 아님</label>
                                                        <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                    </div>
                                        </div>
                                        <div class = col-md-1></div>
                                    </div>

                                  
                                    <div class="form-row">
                                        <div class="form-group col-md-1">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input name = birthDate_Year type="text" class="form-control" id="birthYear" placeholder=생년>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <select name = birthDate_Month id="inputState" class="form-control"><!-- 이걸 배열로 받으려면 어떻게 해야하나... -->
                                            <option selected>월</option>
                                            <option value = 01>01</option>
                                            <option value = 02>02</option>
                                            <option value = 03>03</option>
                                            <option value = 04>04</option>
                                            <option value = 05>05</option>
                                            <option value = 06>06</option>
                                            <option value = 07>07</option>
                                            <option value = 08>08</option>
                                            <option value = 09>09</option>
                                            <option value = 10>10</option>
                                            <option value = 11>11</option>
                                            <option value = 12>12</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input name = birthDate_Day type="text" class="form-control" id="birthDay" placeholder="일 ex)01, 02, 11">
                                        </div>
                                        <div class="form-group col-md-1">
                                        </div>
                                    </div>
                                    

                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">주소</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input name = Member_Donor_address type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="상세주소까지 전부!!">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>      
                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">전화번호</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input name = Member_Donor_phoneNumber type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="-없이 숫자만!!">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>    
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-3>이메일 수신 동의</div>
                                            <div class = col-md-7>
                                                <div class="form-check form-check-inline">
                                                    <input name = Member_Donor_advertiseAgreed class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" checked>
                                                    <label class="form-check-label" for="inlineRadio1">Y</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input name = Member_Donor_advertiseAgreed class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="0">
                                                    <label class="form-check-label" for="inlineRadio2">N</label>
                                                </div>   
                                            </div> 
                                            <div class = col-md-1> </div>  
                                        </div>
                                    </div>       
    
                                </form>
                                
                                <button type="submit" class="btn btn-primary" onclick = "checkJoin()">회원가입</button>
                               
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