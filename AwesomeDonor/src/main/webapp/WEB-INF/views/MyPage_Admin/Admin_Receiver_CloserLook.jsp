<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receiver 자세히보기</title>
</head>
<body>
    <!-- ####################################관리자 추가################################################ -->
    <!-- ####################################관리자 추가################################################ -->
    <!-- 관리자만 보이는 관리자 메뉴. -->
    <c:if test="${!empty sessionData.session_Admin}">
    
    	<!--빈공간-->
    	<div class="row">
        <div class="col">
            <div id="emptyboxTop" style="width: 100%; height: 70px; "></div>
        </div>
   		</div>
 
${boardData.member_Receiver_joinDate }
${boardData.member_Receiver_name }
${boardData.member_Receiver_identifyNumber}

<br><br>

<br>
<img src = "${boardData2.Receiver_File_Upload_linkName}">

</c:if>

</body>
</html>