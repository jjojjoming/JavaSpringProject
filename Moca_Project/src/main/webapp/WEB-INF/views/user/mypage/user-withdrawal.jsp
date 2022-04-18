<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Service Start -->
<link href="/resources/css/user-withdrawal.css" rel="stylesheet">
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/views/user/mypage/my_sidebar_mycopy.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div class="UserAccountContainerTemplate__content" style="font-size: 12px">
                    <div id="container">
                        <!-- CONTENTS -->
                        <!-- CONTENTS -->
                        <div id="content">
                            <div class="c_header">
                                <h2>탈퇴 안내</h2>
                                <p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
                            </div>

                            <!-- [D] input type="text"에 focus 되었을때 class에 on 추가 (ie6,ie7 대응) -->
                            <div class="section_delete">
                                <h3 class="h_dropout">
                                    사용하고 계신 아이디(<em>${ User.email }</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
                                </h3>
                                <p class="dropout_dsc">
                                    <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
                                </p>
                                <h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
                                <p class="dropout_dsc">
                                    회원정보 및 헤드카피, 세일즈카피 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고
                                    필요한 데이터는 미리 백업을 해주세요.
                                </p>
                                <h3 class="h_dropout">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
                                <p class="dropout_dsc">문의게시판, 자유게시판 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
                                    <br>
                                    삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</em>

                                    <br>
                                    탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다. <br>

                                </p>

                                <form id="withdrawalForm" action="/user/withdrawal/check" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="dropout_agree_area">
                                        <p class="contxt">
                                            <strong>
                                                탈퇴 후에는 아이디 <em>${ User.email }</em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                                                <br>
                                                게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
                                            </strong>
                                        </p>
                                        <input type="checkbox" id="dropoutAgree" name="dropoutAgree">
                                        <label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
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