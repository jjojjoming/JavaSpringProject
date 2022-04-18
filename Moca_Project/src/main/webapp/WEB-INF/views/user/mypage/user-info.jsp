<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/user-info.js"></script>

<style>
    .AccountProfileInfo__profileImg:hover {
        cursor:pointer;
    }
</style>
<!-- Service Start -->
<div class="container-xxl py-5" style="display: block">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/views/user/mypage/my_sidebar_mycopy.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div class="UserAccountContainerTemplate__content">

                    <div class="AccountProfile">
                        <div class="AccountProfile__part AccountProfile__part--info">
                            <div class="AccountProfileInfo">
                                <div class="AccountProfileInfo__img">
                                    <form action="/user/info/profile" modelAttribute="Users" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input id="profileImg" name="profileImg" type="file" autocomplete="off" style="display:none" accept="image/*"/>
                                        <c:if test="${empty User.profileImgName}">
                                            <img class="AccountProfileInfo__profileImg" alt="users profile image" src="https://d1ckd324hatig8.cloudfront.net/empty-user.png">
                                        </c:if>
                                        <c:if test="${not empty User.profileImgName}">
                                            <img class="AccountProfileInfo__profileImg" alt="users profile image" src="https://d1ckd324hatig8.cloudfront.net/${User.profileImgName}">
                                        </c:if>
                                        <button id="profileImgSubmit" type="submit" style="display: none"></button>
                                    </form>
                                </div>
                                <div class="AccountProfileInfo__detail">
                                    <span class="AccountProfileInfo__detail__name">환영합니다. ${ User.name }님</span>
                                </div>
                            </div>
                        </div>
                        <form id="mypageForm1" modelAttribute="Users" action="/user/info/change" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="AccountProfile__part AccountProfile__part--meta">
                                <div class="AccountProfile__row AccountProfile__row--email-age">
                                    <div class="AccountBox  uneditable " >
                                        <span class="AccountBox__title">이메일</span>
                                        <input type="text" id="email" name="email" value="${ User.email }" disabled="disabled" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
                                    </div>
                                    <div class="AccountBox  uneditable divChange" id="uneditable">
                                        <span class="AccountBox__title spanChange">이름</span>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                        <input type="text" id="name" name="name" value="${ User.name }" disabled style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                    </div>
                                </div>
                                <div class="AccountProfile__row AccountProfile__row--job-phone">
                                    <div class="AccountBox AccountProfile__job uneditable divChange">
                                        <span class="AccountBox__title spanChange" >주소</span>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                        <input type="text" id="address" name="address" value="${ User.address }" disabled style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                    </div>
                                    <div class="AccountBox AccountProfile__phoneNumber uneditable divChange">
                                        <span class="AccountBox__title spanChange">전화번호</span>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                        <input type="text" id="phone" name="phone" value="${ User.phone }" disabled style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
                                        <span class="spanIn" style="display: none;">&nbsp;</span>
                                    </div>
                                    <input type="hidden" name="passwordIn" value="Change"/>
                                </div>
                                <div class="UserAccountProfileContainerPassword__footer">
                                    <button type="button" class="UserAccountProfileContainerPassword__button" id="infoChange">
                                        <span>수정</span>
                                    </button>
                                    <button type="button" class="UserAccountProfileContainerPassword__button btnChange" id="cancelChange" style="display: none">
                                        <span>취소</span>
                                    </button>
                                    <button type="submit" class="UserAccountProfileContainerPassword__button btnChange" style="display: none">
                                        <span>완료</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <form id="mypageForm2" modelAttribute="Users" action="/user/info/change" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="UserAccountProfileContainerPassword">
                                <div class="UserAccountProfileContainerPassword__header">
                                    <h1 class="UserAccountProfileContainerPassword__title">비밀번호 변경</h1>
                                    <span class="UserAccountProfileContainerPassword__message ">영문 숫자 조합 6자 이상 입력해 주세요.</span>
                                </div>
                                <div class="AccountProfile__row AccountProfile__row--pw">

                                    <input type="password" id="passwordIn" name="passwordIn" class="UserAccountProfileContainerPassword__input"
                                           placeholder="이전 비밀번호" value=""/>
                                    <input type="password" id="newPassword" name="newPassword" class="UserAccountProfileContainerPassword__input"
                                           placeholder="새 비밀번호" value=""/>
                                    <input type="password" id="newPassword2" name="newPassword2" class="UserAccountProfileContainerPassword__input"
                                           placeholder="새 비밀번호 확인" value=""/>
                                </div>

                                <div class="UserAccountProfileContainerPassword__footer">
                                    <button type="submit" class="UserAccountProfileContainerPassword__button">
                                        <span>비밀번호 변경</span>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>



            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<script type="text/javascript" src="/resources/js/user-info.js"></script>
