<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/resources/css/signup-email.css">

<div class="SignUpContainer">
    <div class="SignUpHeader_container__gdFGp">
        <a href="/">
        <h1 class="m-0 signup-email">MoCa</h1>
        <p class="SignUpHeader_message__eOoP7">이미 회원이신가요?<a class="SignUpHeader_link__BIkIU" href="/login">로그인 하기</a></p></div>
    <div class="SignUpWithEmail">
        <form action="/signUp/complete" method="post" id="btnForm" name="Join_form" onsubmit="return validate()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class=" InputBase SignUpWithEmail__input">
                <input placeholder="이메일" name="email"  id="email" class="InputTextField_input___Fn4V InputTextField_withLabel__4m9f9" type="text" value="" required>
            <div class="check_email_cla">
                <span id="checkEmail"/>
            </div>
            </div>
            <div class=" InputBase SignUpWithEmail__input">
                <input type="password" placeholder="비밀번호 (문자,숫자조합 6자리 이상)" name="password" id="password"   class="InputTextField_input___Fn4V InputTextField_password__8Xb1C InputTextField_withLabel__4m9f9" type="text" value="" required>
            <div class="check_pw_cla">
                <span id="checkPwd1"/>
            </div>
            </div>
            <div class=" InputBase SignUpWithEmail__input">
                <input type="password" placeholder="비밀번호 확인" name="passwordch" id="passwordch" class="InputTextField_input___Fn4V InputTextField_password__8Xb1C InputTextField_withLabel__4m9f9" type="text" value="" required>
            <div class="check_pw_cla">
                 <span id="checkPwd2"/>
            </div>
            </div>
            <div class=" InputBase SignUpWithEmail__input">
                <input placeholder="이름" name="name" id="name" class="InputTextField_input___Fn4V InputTextField_password__8Xb1C InputTextField_withLabel__4m9f9" type="text" value="" required>
            <div class="check_name_cla">
                <span id="checkName"/>
            </div>
            </div>
            <div class=" InputBase SignUpWithEmail__input">
                <input placeholder="전화번호 :ex) 010-0000-0000  " name="phone" id="phone" class="InputTextField_input___Fn4V InputTextField_password__8Xb1C InputTextField_withLabel__4m9f9" type="tel" value="" required>
            <div class="check_name_cla">
                <span id="checkPhone"/>
            </div>
            </div>
            <div class=" InputBase SignUpWithEmail__input">
                <input placeholder="주소" name="address" id="address" class="InputTextField_input___Fn4V InputTextField_password__8Xb1C InputTextField_withLabel__4m9f9" type="text" value=""  required>
            <div class="check_name_cla">
                <span id="checkaddress"/>
            </div>
            </div>
            <div class="TermsCheckboxes_container__SGOlT">
                <button class="TermsCheckboxes_checkAllItems__AdL9R TermsCheckboxes_checkItem__COFES" type="button">
                    <span class="MuiCheckbox-root MuiCheckbox-colorPrimary MuiButtonBase-root MuiCheckbox-root MuiCheckbox-colorPrimary PrivateSwitchBase-root css-1860zjt">
                        <input class="PrivateSwitchBase-input css-1m9pwf3" id="full-terms" type="checkbox" data-indeterminate="false">
                    </span>
                    <span class="TermsCheckboxes_checkAllMessage__I58gi">전체 약관 동의</span>
                </button>
                <div class="CheckboxWithChevronButton TermsCheckboxes_checkItem__COFES">
                    <span class="MuiCheckbox-root MuiCheckbox-colorPrimary MuiButtonBase-root MuiCheckbox-root MuiCheckbox-colorPrimary PrivateSwitchBase-root css-1860zjt">
                        <input class="PrivateSwitchBase-input css-1m9pwf3"  id="essential1" type="checkbox" data-indeterminate="false"  name="chk"  required>
                    </span>
                    <label>[필수] 모카 이용 약관에 동의</label> &nbsp &nbsp
                    <button class="CheckboxWithChevronButton_button__vIriC" type="button" onclick="javascript:openWin()">
                        <svg stroke="#aaabb7" width="7" height="7" viewBox="0 0 7 7" xmlns="http://www.w3.org/2000/svg">
                            <path d="m2.887.583 2.888 2.888-2.888 2.887" stroke="#aaabb7" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg></button>
                    <div class="check_name_cla">
                        <span id="checkchoice" style="font-size:13px"/>
                    </div>
                </div>
                <div class="CheckboxWithChevronButton TermsCheckboxes_checkItem__COFES">
                    <span class="MuiCheckbox-root MuiCheckbox-colorPrimary MuiButtonBase-root MuiCheckbox-root MuiCheckbox-colorPrimary PrivateSwitchBase-root css-1860zjt">
                        <input class="PrivateSwitchBase-input css-1m9pwf3" id="essential2" type="checkbox" data-indeterminate="false" name="chk"  required>
                    </span>
                    <label>[필수] 개인정보 수집 및 이용에 동의</label> &nbsp &nbsp
                    <button class="CheckboxWithChevronButton_button__vIriC" type="button" onclick="javascript:openWin2()">
                        <svg stroke="#aaabb7" width="7" height="7" viewBox="0 0 7 7" xmlns="http://www.w3.org/2000/svg">
                            <path d="m2.887.583 2.888 2.888-2.888 2.887" stroke="#aaabb7" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg></button>
                    <div class="check_name_cla">
                        <span id="checkchoice1" style="font-size:13px"/>
                    </div>
                </div>
                <div class="CheckboxWithChevronButton TermsCheckboxes_checkItem__COFES">
                    <span class="MuiCheckbox-root MuiCheckbox-colorPrimary MuiButtonBase-root MuiCheckbox-root MuiCheckbox-colorPrimary PrivateSwitchBase-root css-1860zjt">
                        <input class="PrivateSwitchBase-input css-1m9pwf3" type="checkbox" data-indeterminate="false" name="chk" id="isMarketing">
                    </span>
                    <label>[선택] 마케팅 정보 수신 및 선택적 개인정보 제공</label>
                    <button class="CheckboxWithChevronButton_button__vIriC" type="button" onclick="javascript:openWin3()">
                        <svg stroke="#aaabb7" width="7" height="7" viewBox="0 0 7 7" xmlns="http://www.w3.org/2000/svg">
                            <path d="m2.887.583 2.888 2.888-2.888 2.887" stroke="#aaabb7" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg></button>
                </div>
            </div>
            <div class="SignForm__submitBtnWrapper">
                <button type="button" class="ButtonGeneral SignForm__submitBtn" id="btn"><span>가입하기</span>
                </button>
            </div>
        </form>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/resources/js/sign-up.js"/>


<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Email Sign up</title>--%>
<%--    <link rel="stylesheet" href="/resources/css/signup-email.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="wrapper" style=" text-align: center;">--%>
<%--    <div class="title"><h4 style="font-size: 60px;">MOCA</h4></div>--%>
<%--    <div class="email">--%>
<%--        <input id="email" type="text" placeholder="이메일을 입력해주세요.">--%>
<%--        <div id="emailError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="name" style=" text-align: center;">--%>
<%--        <input id="name"  type="text" placeholder="이름을 입력해 주세요.">--%>
<%--        <div id="nameError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="password" style=" text-align: center;">--%>
<%--        <input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">--%>
<%--        <div id="passwordError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="passwordCheck" style=" text-align: center;">--%>
<%--        <input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">--%>
<%--        <div id="passwordCheckError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="phonenumber" style=" text-align: center;">--%>
<%--        <input id="phonenumber" type="phone" placeholder="연락처를 입력해 주세요.">--%>
<%--        <div id="phonenumberCheckError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="address" style=" text-align: center;">--%>
<%--        <input id="address" type="addr" placeholder="주소를 입력해 주세요.">--%>
<%--        <div id="addressCheckError" class="error"></div>--%>
<%--    </div>--%>
<%--    <div class="agree">--%>
<%--        <div class="all_agree">--%>
<%--            <input type="checkbox" id="a1" name="전체동의" />--%>
<%--            <label for="a1"><span>전체약관동의</span></label>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <ul>--%>
<%--        <li><input type="checkbox" id="a2" name="전체동의" /> <label--%>
<%--                for="a2"><span>[필수] MOCA이용약관동의</span></label></li>--%>

<%--        <li><input type="checkbox" id="a3" name="전체동의" /> <label--%>
<%--                for="a3"><span>[필수] 개인정보수집이용 동의</span></label></li>--%>

<%--        <li><input type="checkbox" id="a4" name="전체동의" /> <label--%>
<%--                for="a4"><span>[필수] 마케팅 정보 수신 및 선택적 개인정보 제공</span></label></li>--%>
<%--    </ul>--%>


<%--    <div class="line">--%>
<%--        <hr>--%>
<%--    </div>--%>
<%--    <div class="signUp">--%>
<%--        <button id="signUpButton" disabled onclick="signUpCheck()">MOCA 가입하기</button>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>