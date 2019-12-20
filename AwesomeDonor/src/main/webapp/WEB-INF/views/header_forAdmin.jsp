<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
   function checkSession(sessionData){
	   if(!sessionData){
		   alert('로그인을 해주세요!!');
		   window.location.href='./Admin_LoginPage';
	   }else{
		   window.location.href='./Admin_MyPage';
		   
	   }
   }
   </script>   
    <div class="row">
        <div class="col-2">
            <div id="logo">
                <a href="./"><img src="${pageContext.request.contextPath}/resources/img/logo.png" height="75" width="128"></a>
            </div>
        </div>
        <div class="col-8"></div>
        <div class="col-2">
            <div id="login">
            <c:choose>
            	<c:when test="${!empty sessionData }">
                	<a href="./logout" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_로그아웃.png" style="height: 22px; width: 138px;"></a>
                </c:when>
                <c:otherwise>
	                <a href="./Admin_LoginPage" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_로그인.png" style="height: 22px; width: 138px;"></a>
                </c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col">
            <div id="menubar">
                <ul class="nav nav-pills nav-justified" id="menubar2">
                    <li class="nav-item">
                        <a class="nav-link"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_사이트소개.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./donation_Requst_MainPage?Page=1" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_필요해요.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./receiverList" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_가입된 기관.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./QnAPage" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_QnA.png" style="width: 138px; height: 22px;"></a>
                    </li>
                    <li class="nav-item">
                        <a><div class="nav-link" href="./Admin_MyPage" style="color:#736663;"><img src="${pageContext.request.contextPath}/resources/img/메뉴바_마이페이지.png" style="width: 138px; height: 22px; " onclick = "checkSession('${sessionData }')"></div></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
   <!--   <div class="row" style="border: 3px solid #dbd7d0; margin: 10px 60px 0px 60px;"></div> -->