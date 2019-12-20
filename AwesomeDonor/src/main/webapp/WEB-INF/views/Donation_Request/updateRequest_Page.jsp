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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <title>필요해요 게시판 수정</title>
    <script type="text/javascript">
    function goBack(){
    	history.go(-2);
    }
    
    function before(){
    	history.go(-1);
    }
    </script>
     <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>	
    <script type="text/javascript">
	$(document).ready(function(){
		var cloth = ['남녀정장', '캐주얼의류', '청바지', '목도리/담요', '속옷/양말', '신발/가방/장갑'];
		var stationary = ['볼펜/연필', '노트/메모지', '색종이', '크레파스', '색연필/물감', '필통'];
		var book = ['새책/중고책', '영어도서/원서', '아동도서', '전집류'];
		var kids = ['유모차', '아기띠', '기저귀', '보습크림', '유아교구/완구', '분유/이유식'];
		var pad = ['일반생리대', '면생리대', '오버나이트', '위생팬티', '여성청결제', '생리대파우치'];
		var cosmetic = ['스킨/로션', '바디로션', '마스크팩', '클렌져/오일', '기능성화장품'];
		var appliance = ['TV/모니터', '스피커', '소형가전', '핸드폰/타블렛', '악기', '컴퓨터/노트북'];
		var household = ['주방용품/세제', '샴푸/클렌져', '마스크', '치약/칫솔', '세제', '물티슈', '화장지'];
		var furniture = ['이불/침낭', '책상/의자', '수납장/책장', '인테리어', '매트/러그'];
		
		$('#Stuff_MajorCategory_entry').change(function(){
			var sel = $(this).val();
			if(sel=='의류'){
				$('.op').remove();
				$.each(cloth,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='학용품'){
				$('.op').remove();
				$.each(stationary,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='도서'){
				$('.op').remove();
				$.each(book,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='유아용품'){
				$('.op').remove();
				$.each(kids,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='생리대'){
				$('.op').remove();
				$.each(pad,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='화장품'){
				$('.op').remove();
				$.each(cosmetic,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='가전제품'){
				$('.op').remove();
				$.each(appliance,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='생활용품'){
				$('.op').remove();
				$.each(household,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}else if(sel=='가구'){
				$('.op').remove();
				$.each(furniture,function(i, item){
					$('#Stuff_MinorCategory_entry').append('<option class = "op" value = '+item+'>'+item+'</option>');
				});
			}
		});
	});
	
    function checkForm(){
        
        var frm1 = document.getElementById("f1");

        var param_index = 0;
        var param_names = [];
        var param_values = [];

		var id = frm1.elements[0].value;
		
        for(i = 0 ; i < frm1.elements.length ; i++){
          if(i==0||i==1){
          		if( !frm1.elements[i].value || frm1.elements[i].value==""){
                      alert('폼을 완성해주세요!!');
                      return;
                  }
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
        submitForm.setAttribute("action", "./updateRequest_Process");

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
	
</script>
    
  </head>
<body style="height: 100%; margin: 0; padding: 0;">
 <div class="container">

   <jsp:include page="../header2.jsp"></jsp:include>
   <jsp:include page="../requestSearchBar.jsp"></jsp:include>
   <div class="row">
   <jsp:include page="../requestCategoryBar.jsp"></jsp:include>
    <div class="col-8">
		<div id="upborder" style=" margin: 30px 0px 0px 0px; width: 660px; height: 20px; border-radius: 5px 5px 0px 0px; background-color:#B4A8A1;"></div>
    	<div id="designBorder" style=" margin: 0px 0px 40px 0px; border-radius: 0px 0px 5px 5px; width: 660px; background-color: #DBD7D0; height: 650px; border: 4px solid #B4A8A1; ">  
    		<div id="tablebox" style="width: 610px; height: 600px; margin: 25px 10px 10px 25px; text-align: left;">
    			<div class = "row">
    				<div class = "col-1"></div>
    				<div class = "col-4"><strong><h5>게시물 수정</h5></strong></div>
    				<div class = "col-5"></div>
    				<div class = "col-2"><button class = "btn btn-secondary btn-sm" onclick = "goBack()" >목록</button></div>
    			</div>
    			<div class = "row">
    				<div class = col-1></div>
    				<div class = col-5>기관명 : ${boardData.dto_Receiver.member_Receiver_name }</div>
    				<div class = col-5>기관 분야 : ${boardData.dto_Receiver.member_Receiver_Category }</div>
    				<div class = col-1></div>
    			</div>
    			<br>
    			<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>주소 </div>
    				<div class = col-8> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_AdCategory }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<div class = "row">
    				<div class = col-3></div>
    				<div class = col-8>
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_adDetail }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<div class = "row">
					<div class = col-1></div>
    				<div class = col-2>홈페이지 </div>
    				<div class = col-8> 
    					<div class="form-control" id="amount" placeholder="" disabled>
    					${boardData.dto_Receiver.member_Receiver_websiteUrl }
    					</div>
    				</div>
    				<div class = col-1></div>
    			</div>
    			<br>
    			<div class = "row">
    			<div class = col-1></div>
    			<div class = col-10>
    				<form id = "f1">
					  	<div class="form-row">
					  		<div class = col-2>물품명 :</div>
					  		
					            <div class="form-group col-3">
					                <select name = Stuff_MajorCategory_entry id="Stuff_MajorCategory_entry" class="form-control"><!-- 이걸 배열로 받으려면 어떻게 해야하나... -->
					                <option value = "">대분류</option>
					                <option value = '의류' >의류</option>
					                <option value = '학용품' >학용품</option>
					                <option value = '도서' >도서</option>
					                <option value = '유아용품' >유아용품</option>
					                <option value = '생리대' >생리대</option>
					                <option value = '화장품' >화장품</option>
					                <option value = '가전제품' >가전제품</option>
					                <option value = '생활용품' >생활용품</option>
					                <option value = '가구' >가구/침구</option>
					                </select>
					            </div> 
					            <div class="form-group col-3">
					                <select name = Stuff_MinorCategory_entry id="Stuff_MinorCategory_entry" class="form-control"><!-- 이걸 배열로 받으려면 어떻게 해야하나... -->
					                <option value = "">소분류</option>
					                </select>
					            </div>
					            <div class= col-4"></div>
					    </div>
					    <div class = form-row>
					    	<div class = col-2>수량 : </div>
						    <div class="form-group col-4">
						        <input type = number min = 0 max = 50000 class="form-control" placeholder="${boardData.dto_Donation_Request.donation_Request_amount }" name = Donation_Request_amount>
						    </div>
						    <div class = col-7></div>
						</div>
					    <div class="form-group">
					   		주차가능여부 : 
					   		<div class="form-check form-check-inline">
					   			<input name = Member_Receiver_parkingSpace class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" checked>
					   			<label class="form-check-label" for="inlineRadio1">Y</label>
					   		</div>
					   		<div class="form-check form-check-inline">
					   			<input name = Member_Receiver_parkingSpace class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="0" >
					   			<label class="form-check-label" for="inlineRadio1">N</label>
					   		</div>
					    </div>
					    <div class = form-row>
						    <div class="form-group col-11">
						    	<label>비고</label>
						    	<textarea name = Donation_Request_note class="form-control" id="exampleFormControlTextarea1" rows="4" placeholder="${boardData.dto_Donation_Request.donation_Request_note }"></textarea>
						    </div>
						    <div class = col-1></div>
						</div>
						<div class = form-group>
						<input type = "hidden" class="form-control" name = "Donation_Request_idx" value = "${boardData.dto_Donation_Request.donation_Request_idx }">
						</div>
						</form>
						<div class = row>
							<div class = col-10></div>
							<div class = col-2><button class="btn btn-primary" onclick="checkForm()">수정</button></div>
						</div>
					  	
    			</div>
    			<div class = col-1></div>
    			</div>
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