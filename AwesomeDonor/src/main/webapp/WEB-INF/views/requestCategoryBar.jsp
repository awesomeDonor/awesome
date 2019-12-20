<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
<div class="col-*">
                <div id="categorybar" style="width: 100px;">
                    <div class="list-group" id="list-tab" role="tablist" >
                        <a class="list-group-item list-group-item-action" id="list-cloth-list" data-toggle="list" href="#list-cloth" role="tab" aria-controls="cloth" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">의류</a>
                        <a class="list-group-item list-group-item-action" id="list-baby-list" data-toggle="list" href="#list-baby" role="tab" aria-controls="baby" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">유아용품</a>
                        <a class="list-group-item list-group-item-action" id="list-feminine-list" data-toggle="list" href="#list-feminine" role="tab" aria-controls="feminine" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">생리대</a>
                        <a class="list-group-item list-group-item-action" id="list-beauty-list" data-toggle="list" href="#list-beauty" role="tab" aria-controls="beauty" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">화장품</a>
                        <a class="list-group-item list-group-item-action" id="list-school-list" data-toggle="list" href="#list-school" role="tab" aria-controls="school" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">학용품</a>
                        <a class="list-group-item list-group-item-action" id="list-book-list" data-toggle="list" href="#list-book" role="tab" aria-controls="book" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">도서</a>
                        <a class="list-group-item list-group-item-action" id="list-domestic-list" data-toggle="list" href="#list-domestic" role="tab" aria-controls="domestic" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">가전제품</a>
                        <a class="list-group-item list-group-item-action" id="list-daily-list" data-toggle="list" href="#list-daily" role="tab" aria-controls="daily" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">생활용품</a>
                        <a class="list-group-item list-group-item-action" id="list-furniture-list" data-toggle="list" href="#list-furniture" role="tab" aria-controls="furniture" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">가구침구</a>
                    </div>
                </div>             
        </div>
        <div class="col-*">
            <div id="categorytab">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade" id="list-cloth" role="tabpanel" aria-labelledby="list-cloth-list">
                        <div class="list-group">
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=남녀정장&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">남녀정장</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=캐주얼&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">캐주얼</br>의류</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=청바지&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">청바지</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=목도리&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">목도리/</br>담요</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=속옷&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">속옷/양말</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=신발&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">신발/가방/장갑</a>
                        </div>
                    </div>
                        <div class="tab-pane fade" id="list-baby" role="tabpanel" aria-labelledby="list-baby-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=유모차&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">유모차</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=아기띠&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">아기띠</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=기저귀&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">기저귀</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=보습크림&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">보습크림</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=유아교구&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">유아교구/완구</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=분유&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">분유/</br>이유식</a>
                                </div>
                            </div>  
                        <div class="tab-pane fade" id="list-feminine" role="tabpanel" aria-labelledby="list-feminine-list">
                            <div class="list-group">
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=일반생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">일반생리대</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=면생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">면생리대</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=오버나이트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">오버나이트</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=위생팬티&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">위생팬티</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=여성청결제&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">여성청결제</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">생리대</br>파우치</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-beauty" role="tabpanel" aria-labelledby="list-beauty-list">
                            <div class="list-group">
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=스킨&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">스킨/로션</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=바디로션&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">바디로션</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=마스크팩&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">마스크팩</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=클렌저&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">클렌저/</br>오일</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=기능성&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">기능성</br>화장품</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-school" role="tabpanel" aria-labelledby="list-school-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=볼펜&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">볼펜/연필</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=노트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">노트/</br>메모지</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=색종이&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">색종이</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=크레파스&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">크레파스</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=색연필&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">색연필/</br>물감</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=필통&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">필통</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-book" role="tabpanel" aria-labelledby="list-book-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=새책&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">새책/</br>중고책</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=영어도서&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">영어도서/원서</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=아동도서&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">아동도서</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=전집류&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">전집류</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-domestic" role="tabpanel" aria-labelledby="list-domestic-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=TV&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">TV/모니터</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=스피커&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">스피커</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=소형가전&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">소형가전</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=핸드폰&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">핸드폰/</br>타블렛</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=악기&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">악기</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=컴퓨터&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">컴퓨터/</br>노트북</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-daily" role="tabpanel" aria-labelledby="list-daily-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=주방용품&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">주방용품/세제</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=샴푸&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">샴푸/</br>클렌저</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=마스크&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">마스크</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=치약&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">치약/칫솔</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=세제&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">세제</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=물티슈&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">물티슈</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=화장지&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">화장지</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-furniture" role="tabpanel" aria-labelledby="list-furniture-list">
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=이불&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">이불/</br>침낭</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=책상&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">책상/</br>의자</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=수납장&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">수납장/</br>책장</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=인테리어&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">인테리어</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=매트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">매트/</br>러그</a>
                    </div>
                </div>
            </div>
        </div>
</div>
<%-- <div class="row">
<div class="col-*">
                <div id="categorybar" style="width: 100px;">
                    <div class="list-group" id="list-tab" role="tablist" >
                        <a class="list-group-item list-group-item-action" id="list-cloth-list" data-toggle="list" href="#list-cloth" role="tab" aria-controls="cloth" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">의류</a>
                        <a class="list-group-item list-group-item-action" id="list-baby-list" data-toggle="list" href="#list-baby" role="tab" aria-controls="baby" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">유아용품</a>
                        <a class="list-group-item list-group-item-action" id="list-feminine-list" data-toggle="list" href="#list-feminine" role="tab" aria-controls="feminine" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">생리대</a>
                        <a class="list-group-item list-group-item-action" id="list-beauty-list" data-toggle="list" href="#list-beauty" role="tab" aria-controls="beauty" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">화장품</a>
                        <a class="list-group-item list-group-item-action" id="list-school-list" data-toggle="list" href="#list-school" role="tab" aria-controls="school" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">학용품</a>
                        <a class="list-group-item list-group-item-action" id="list-book-list" data-toggle="list" href="#list-book" role="tab" aria-controls="book" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">도서</a>
                        <a class="list-group-item list-group-item-action" id="list-domestic-list" data-toggle="list" href="#list-domestic" role="tab" aria-controls="domestic" style="color:#403E38; background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">가전제품</a>
                        <a class="list-group-item list-group-item-action" id="list-daily-list" data-toggle="list" href="#list-daily" role="tab" aria-controls="daily" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">생활용품</a>
                        <a class="list-group-item list-group-item-action" id="list-furniture-list" data-toggle="list" href="#list-furniture" role="tab" aria-controls="furniture" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">가구침구</a>
                    </div>
                </div>             
        </div>
        <div class="col-*">
            <div id="categorytab">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade" id="list-cloth" role="tabpanel" aria-labelledby="list-cloth-list">
                        <div class="list-group">
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=남녀정장&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">남녀정장</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=캐주얼&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">캐주얼</br>의류</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=청바지&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">청바지</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=목도리&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">목도리/</br>담요</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=속옷&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">속옷/양말</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=신발&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">신발/가방/장갑</a>
                        </div>
                    </div>
                        <div class="tab-pane fade" id="list-baby" role="tabpanel" aria-labelledby="list-baby-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=유모차&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">유모차</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=아기띠&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">아기띠</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=기저귀&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">기저귀</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=보습크림&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">보습크림</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=유아교구&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">유아교구/완구</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=분유&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">분유/</br>이유식</a>
                                </div>
                            </div>  
                        <div class="tab-pane fade" id="list-feminine" role="tabpanel" aria-labelledby="list-feminine-list">
                            <div class="list-group">
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=일반생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">일반생리대</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=면생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">면생리대</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=오버나이트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">오버나이트</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=위생팬티&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">위생팬티</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=여성청결제&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">여성청결제</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=생리대&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">생리대</br>파우치</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-beauty" role="tabpanel" aria-labelledby="list-beauty-list">
                            <div class="list-group">
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=스킨&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">스킨/로션</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=바디로션&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">바디로션</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=마스크팩&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">마스크팩</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=클렌저&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">클렌저/</br>오일</a>
                                <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=기능성&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">기능성</br>화장품</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-school" role="tabpanel" aria-labelledby="list-school-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=볼펜&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">볼펜/연필</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=노트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">노트/</br>메모지</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=색종이&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">색종이</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=크레파스&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">크레파스</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=색연필&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">색연필/</br>물감</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=필통&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">필통</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-book" role="tabpanel" aria-labelledby="list-book-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=새책&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">새책/</br>중고책</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=영어도서&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">영어도서/원서</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=아동도서&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">아동도서</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=전집류&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">전집류</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-domestic" role="tabpanel" aria-labelledby="list-domestic-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=TV&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">TV/모니터</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=스피커&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">스피커</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=소형가전&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">소형가전</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=핸드폰&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">핸드폰/</br>타블렛</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=악기&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">악기</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=컴퓨터&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">컴퓨터/</br>노트북</a>
                                </div>
                        </div>
                        <div class="tab-pane fade" id="list-daily" role="tabpanel" aria-labelledby="list-daily-list">
                                <div class="list-group">
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=주방용품&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">주방용품/세제</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=샴푸&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">샴푸/</br>클렌저</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=마스크&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">마스크</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=치약&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">치약/칫솔</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=세제&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">세제</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=물티슈&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">물티슈</a>
                                    <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=화장지&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">화장지</a>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-furniture" role="tabpanel" aria-labelledby="list-furniture-list">
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=이불&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">이불/</br>침낭</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=책상&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">책상/</br>의자</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=수납장&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">수납장/</br>책장</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=인테리어&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">인테리어</a>
                            <a href="./filterByMinorCategory_entry?Stuff_MinorCategory_entry=매트&page=1" class="list-group-item list-group-item-action" style="color:#403E38;background-image: url('/Users/hyeonji/Desktop/부트스트랩_html/배경22222.jpg');">매트/</br>러그</a>
                    </div>
                </div>
            </div>
        </div>
</div> --%>