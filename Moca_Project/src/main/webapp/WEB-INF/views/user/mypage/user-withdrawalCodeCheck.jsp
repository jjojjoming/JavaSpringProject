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
                            <div><h1 class="UserAccountProfileContainerPassword__title" style="margin-left: 60px; margin-top: 30px">고객님의 메일(${User.email})로 인증번호를 보내드렸습니다.</h1></div>
                            <div><h1 class="UserAccountProfileContainerPassword__title" style="margin-left: 60px; margin-top: 30px">인증번호 입력시 회원탈퇴가 진행됩니다.</h1></div>
                        </div>
                        <form action="/user/withdrawal/success" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="AccountProfile__row AccountProfile__row--pw">
                                <div class="UserAccountContainerTemplate__content" style="font-size: 12px">
                                    <input type="text" id="verificationCode" name="verificationCode" class="UserAccountProfileContainerPassword__input"
                                           placeholder="인증번호를 입력해 주세요." value=""/>
                                </div>
                                <div class="UserAccountContainerTemplate__content" style="font-size: 12px"></div>
                            </div>
                            <div class="UserAccountProfileContainerPassword__footer">
                                <button type="submit" class="UserAccountProfileContainerPassword__button">
                                    <span>회원 탈퇴</span>
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
<script>
    $(function(){
        if($("#withdrawalForm").submit(function(){
            if($("#dropoutAgree").is(":checked") == false){
                alert("안내사항을 확인 후 동의해 주셔야 합니다.");
                return false;
            }
        }));
    })
</script>