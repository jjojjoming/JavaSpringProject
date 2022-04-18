<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/views/user/mypage/my_sidebar_mycopy.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div class="UserAccountContainerTemplate__content" style="font-size: 12px">
                    <div class="UserAccountProfileContainerPassword">
                        <div class="UserAccountProfileContainerPassword__header">
                            <h1 class="UserAccountProfileContainerPassword__title" style="margin-left: 60px; margin-top: 30px">비밀번호를 입력하시면 회원탈퇴가 진행됩니다.</h1>
                        </div>
                        <form action="/user/withdrawal/Code" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="AccountProfile__row AccountProfile__row--pw">
                                <div class="UserAccountContainerTemplate__content" style="font-size: 12px">
                                    <input type="password" id="passwordIn" name="passwordIn" class="UserAccountProfileContainerPassword__input"
                                           placeholder="비밀번호를 입력해 주세요." value=""/>
                                </div>
                                <div class="UserAccountContainerTemplate__content" style="font-size: 12px"></div>
                            </div>
                            <div class="UserAccountProfileContainerPassword__footer">
                                <button type="submit" class="UserAccountProfileContainerPassword__button">
                                    <span>확인</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->