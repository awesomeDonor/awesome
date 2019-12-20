<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>기관 회원가입</title>
    	
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>	
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
        	  if(i!=4&&i!=10){
          		if( !frm1.elements[i].value){
                      alert('폼을 완성해주세요!!');
                      return;
                  }
          		
          		if(frm1.elements[3].value.length>=8){//이렇게 길이검사를 하기 시작하면 정말 끝이 없겠다...
          			alert('기관식별번호가 너무 깁니다. \n확인 부탁드립니다!');
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
        submitForm.setAttribute("action", "./joinProcess_Receiver");

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
    
function confirmId_Receiver(){
		
		var id = document.getElementById("Member_Receiver_idEmail").value;
		
		$.ajax({
				dataType : "json",
				type : "post",
				url : "./confirm_idEmail_Receiver",
				data : "Member_Receiver_idEmail=" + id, //Url 매핑이 된 메소드에서 받는 변수
				success : function(result){ // result는 그 메소드에서의 return 값, 또는
					
					if(result == true){
						alert("사용 가능한 아이디 입니다.");
						ischecked=true;
					}else{
						alert('이미 존재하는 아이디 입니다.');
						ischecked = false;
					}
					
				}
			}	
		);
		
		
	}
	
function confirmId_Receiver121(){
		
		
		var idBox = document.getElementById("Member_Receiver_idEmail");
		
		var idValue = idBox.value;
		
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직...., 이건 가상 메소드라고 생각하면 됨. 
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				
				//alert(xmlhttp.responseText);
				
				var result = JSON.parse(xmlhttp.responseText);
				
				if(result== false){
					alert('이미 존재하는 아이디 입니다.');
				}else{
					alert("사용 가능한 아이디 입니다.");
				}
				
				
			}
		};
		
		xmlhttp.open("post","./confirm_idEmail_Receiver" , true);
		xmlhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded");

		xmlhttp.send("Member_Receiver_idEmail=" + idValue);		
		
		
	}
</script>
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
                        height : 950px;
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
                                <h1><span class="badge badge-success">기관 회원가입</span></h1>
                        </div>
                        <div class="col-md-2">
                                <div class = row id = blankAboveButton></div>
                                <div class = row>
                                    <div class = col-md-2></div>
                                    <div class = col-md-10 id = blankontheLeftofButton><a href="./joinPage_Donor" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">개인</a> </div>
                                </div>
                            </div>
                            <div class = "col-md-1"></div>
                </div>
                <div class = row id = row_joinForm>
                        <div class="col-md-12">
                                <form id = "f1">
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-2>
                                                <label for="formGroupExampleInput">이메일</label>
                                            </div>
                                            <div class = col-md-6>
                                                <input name=Member_Receiver_idEmail type="email" class="form-control" id="Member_Receiver_idEmail" onchange = "typing()" placeholder="example@email.com" >
                                            </div>
                                            <div class = col-md-2><button type="button" class="btn btn-info btn-sm" onclick="confirmId_Receiver()">중복확인</button> </div>
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
                                                <input name = Member_Receiver_pw type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요!!">
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

                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-4>
                                                    <label for="formGroupExampleInput">기관식별번호</label>
                                                    <input name = Member_Receiver_identifyNumber type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
                                                </div>
                                                <div class = col-md-6>
                                                    <!--이거 name은 어떻게 설정해야하는지 나중에 찾아볼 것!!-->
                                                    <label for="exampleFormControlFile1">인증용 파일 첨부</label>
                                                    <input type="file" class="form-control-file" id="file">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>

                                    <div class = form-group>
                                        <div class = row>
                                                <div class = col-md-1></div>
                                                <div class = col-md-3>
                                                    <label for="formGroupExampleInput">기관분류</label>
                                                    <select name = Member_Receiver_Category id="inputState" class="form-control">
                                                            <option selected>분류</option><!-- 이 부분을 지워야하나... -->
                                                            <option value =노인>노인</option>
                                                            <option value =아동>아동(청소년 및 영유아 포함)</option>
                                                            <option value =정신질환자>정신질환자</option>
                                                            <option value =노숙인>노숙인</option>
                                                            <option value =지역주민>지역주민</option>
                                                            <option value =기타시설>기타시설</option>
                                                    </select>
                                                </div>
                                                <div class = col-md-7>
                                                    <label for="formGroupExampleInput">기관명</label>
                                                    <input name = Member_Receiver_name type="text" class="form-control" id="exampleInputPassword1" placeholder="기관 이름을 입력하세요!!">
                                                </div>
                                                <div class = col-md-1></div>
                                        </div>
                                        
                                    </div>

                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">전화번호</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input name = Member_Receiver_phoneNumber type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="-없이 숫자만!!">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>  

                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">지역</label>
                                                </div>
                                                <div class = col-md-4>
                                                    <select name = Member_Receiver_AdCategory id="inputState" class="form-control">
                                                            <option selected>주소</option>
                                                            <option value = 서울특별시>서울특별시</option>
                                                            <option value =세종특별자치시>세종특별자치시</option>
                                                            <option value =광주광역시>광주광역시</option>
															<option value =대구광역시>대구광역시</option>
															<option value =대전광역시>대전광역시</option>
															<option value =부산광역시>부산광역시</option>
                                                            <option value =울산광역시>울산광역시</option>
                                                            <option value =인천광역시>인천광역시</option>
                                                            <option value =강원도>강원도</option>
                                                            <option value =경기도>경기도</option>
                                                            <option value =경상남도>경상남도</option>
                                                            <option value =경상북도>경상북도</option>
                                                            <option value =전라남도>전라남도</option>
                                                            <option value =전라북도>전라북도</option>
                                                            <option value =제주도>제주도</option>
                                                            <option value =충청남도>충청남도</option>
                                                            <option value =충청북도>충청북도</option>
                                                            
                                                    </select>
                                                </div>
                                                <div class = col-md-5> </div>
                                            </div>
                                    </div>  

                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">상세주소</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input name = Member_Receiver_adDetail type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="상세주소까지 전부!!">
                                                </div>
                                                <div class = col-md-1> </div>
                                            </div>
                                    </div>      
  
                                    <div class="form-group">
                                        <div class = "row">
                                            <div class = col-md-1> </div>
                                            <div class = col-md-10>
                                                <label for="exampleFormControlTextarea1">기관에 대한 짧은 소개-필수 아님</label>
                                                <textarea name = Member_Receiver_introduction class="form-control" id="Member_Receiver_introduction" rows="4" placeholder="500자 이내로 본인의 기관을 설명해주세요!""></textarea>
                                            </div>
                                            <div class = col-md-1> </div>  
                                        </div>
                                    </div>    
                                    
                                    <div class="form-group">
                                            <div class = "row">
                                                <div class = col-md-1> </div>
                                                <div class = col-md-2>
                                                    <label for="formGroupExampleInput">웹사이트 주소</label>
                                                </div>
                                                <div class = col-md-8>
                                                    <input name = Member_Receiver_websiteUrl type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ex)www.awesomedonor.org">
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
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>