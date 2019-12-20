<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div id="searchbar">
                        <form action = "./searchByReceiverName" class="row" id="search-bar-row">
                            <input name = Member_Receiver_name type="text" class="col form-control" placeholder="기관명검색" id="address">
                            <button type="submit" style="background-color:#736663; color: white; font-size: 14px; border-radius:5px 5px 5px 5px;" id="address">&nbsp;검색&nbsp;</button>
                        </form>
                    </div>
                </div>
                <div class="col-2">
                    <div id="specific-search">
                        <div class="list-group" id="list-tab" role="tablist" style = "width : 100px; height : 45px; color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg'); ">
                            <a class="list-group-item list-group-item-action" id="list-detail-list" data-toggle="list" href="#listDetail" role="tab" aria-controls="detail" style="color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">상세검색</a>
                        </div>
                    </div>
                </div>
        <div class="row" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
            <div class="col-*" id="sp-form" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                <div id="formsizing" style="width: 800px; color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                        <form id="specificSearchbar" method="GET" action="./filterReceiverListByAll">
                                <div class="tab-content" id="nav-tabContent" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                            <div class="tab-pane fade show" id="listDetail" role="tabpanel" aria-labelledby="list-detail-list"style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                <ul class="list-group list-group-flush" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                    <li class="list-group-item" id="spsp" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');"><h6>상세검색</h6></li>
                                                    <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">지역별 </br> 
                                                      <ul class="list-group list-group-horizontal-lg" id="area">
                                                          <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck1" name = "Member_Receiver_AdCategory" value = "서울특별시">
                                                                  <label class="custom-control-label" for="customCheck1">서울</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck2" name = "Member_Receiver_AdCategory" value = "세종특별자치시">
                                                                  <label class="custom-control-label" for="customCheck2">세종</label>
                                                              </div>        
                                                          </li>
                                                          <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                              <div class="custom-control custom-checkbox  custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck3" name = "Member_Receiver_AdCategory" value = "광주광역시">
                                                                  <label class="custom-control-label" for="customCheck3">광주</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck4" name = "Member_Receiver_AdCategory" value = "대구광역시">
                                                                  <label class="custom-control-label" for="customCheck4">대구</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck5" name = "Member_Receiver_AdCategory" value = "대전광역시">
                                                                  <label class="custom-control-label" for="customCheck5">대전</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck6" name = "Member_Receiver_AdCategory" value = "부산광역시">
                                                                  <label class="custom-control-label" for="customCheck6">부산</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck7" name = "Member_Receiver_AdCategory" value = "울산광역시">
                                                                  <label class="custom-control-label" for="customCheck7">울산</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck8" name = "Member_Receiver_AdCategory" value = "인천광역시">
                                                                  <label class="custom-control-label" for="customCheck8">인천</label>
                                                              </div>  
                                                          </li>
                                                          <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck9" name = "Member_Receiver_AdCategory" value = "강원도">
                                                                  <label class="custom-control-label" for="customCheck9">강원</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck10" name = "Member_Receiver_AdCategory" value = "경기도">
                                                                  <label class="custom-control-label" for="customCheck10">경기</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck11" name = "Member_Receiver_AdCategory" value = "경상남도">
                                                                  <label class="custom-control-label" for="customCheck11">경남</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck12" name = "Member_Receiver_AdCategory" value = "경상북도">
                                                                  <label class="custom-control-label" for="customCheck12">경북</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck13" name = "Member_Receiver_AdCategory" value = "전라남도">
                                                                  <label class="custom-control-label" for="customCheck13">전남</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck14" name = "Member_Receiver_AdCategory" value = "전라북도">
                                                                  <label class="custom-control-label" for="customCheck14">전북</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck15" name = "Member_Receiver_AdCategory" value = "제주도">
                                                                  <label class="custom-control-label" for="customCheck15">제주</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck16" name = "Member_Receiver_AdCategory" value = "충청남도">
                                                                  <label class="custom-control-label" for="customCheck16">충남</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck17" name = "Member_Receiver_AdCategory" value = "충청북도">
                                                                  <label class="custom-control-label" for="customCheck17">충북</label>
                                                              </div>
                                                          </li>
                                                      </ul>
                                                    </li>
                                                    <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">기관분야별
                                                      <ul class="list-group list-group-horizontal-lg" id="category">
                                                          <li class="list-group-item" style = "color:#403E38; background-image: url('${pageContext.request.contextPath}/resources/img/배경.jpg');">
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck21" name = "Member_Receiver_Category" value = "노인">
                                                                  <label class="custom-control-label" for="customCheck21">노인</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck22" name = "Member_Receiver_Category" value = "아동">
                                                                  <label class="custom-control-label" for="customCheck22">아동(청소년 및 영유아 포함)</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck23" name = "Member_Receiver_Category" value = "정신질환자">
                                                                  <label class="custom-control-label" for="customCheck23">정신질환자</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck24" name = "Member_Receiver_Category" value = "노숙인">
                                                                  <label class="custom-control-label" for="customCheck24">노숙인</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck25" name = "Member_Receiver_Category" value = "지역주민">
                                                                  <label class="custom-control-label" for="customCheck25">지역주민</label>
                                                              </div>
                                                              <div class="custom-control custom-checkbox custom-control-inline">
                                                                  <input type="checkbox" class="custom-control-input" id="customCheck26" name = "Member_Receiver_Category" value = "기타시설">
                                                                  <label class="custom-control-label" for="customCheck26">기타시설</label>
                                                              </div>
                                                          </li>
                                                      </ul>  
                                                    </li>
                                                    <input type="submit" id="filterbtn" style="background-color: #7366636c; text-align: center; color: #403E38;" value = "필터링적용" >
                                                    <button type="button" style="color: #403E38;" onclick="location.reload();">닫기</button>
                                                </ul>
                                            </div>
                                        </div>
                                </form>
                    </div>
                </div>
            </div>
        </div>