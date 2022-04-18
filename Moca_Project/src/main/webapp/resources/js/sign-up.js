let token = $("input[name='_csrf']").val();
let header = "X-CSRF-TOKEN";

$(document).ajaxSend(function (e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$.ajaxSetup({
    error: function (xhr, status, err) {
        if (xhr.status == 401) {
            alert("잘못된 접근입니다. 로그인 페이지로 이동합니다.");
            location.href = "/login";
        } else if (xhr.status == 403) {
            alert("잘못된 접근입니다. 로그인 페이지로 이동합니다.");
            location.href = "/login";
        }
    }
});

//주소 api
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                //document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

//약관동의
$(document).ready(function() {
    $("#full-terms").click(function() {
        if($("#full-terms").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    });

    $("input[name=chk]").click(function() {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if(total != checked) $("#full-terms").prop("checked", false);
        else $("#full-terms").prop("checked", true);
    });

    $('#email').focusout( function() {
        console.log($(this).val());

        const email = $('#email').val();
        $.ajax({
            type: "POST",
            url: "/signup/emailCheck",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            data: email,
            datatype: "json",
            success: function (data) {
                console.log(data);
                if (data.confirm === "OK") {
                    if(checkEmail() == false) {
                        checkEmail();
                    }
                    else {
                        $('#checkEmail').text("유효한 이메일 입니다.")
                            .css("color", "green");
                        validateCheck.email = true;
                    }

                } else {
                    $('#checkEmail').text("중복된 이메일 입니다! 다시입력해 주세요.")
                        .css("color", "red");
                    validateCheck.email = false;
                    $('#email').attr("placeholder", $('#email').val());
                    $('#email').val("").focus();
                    e.preventDefault();
                }
            },
            error: function (error) {
                console.log("error : " + error);
            }
        });
    });

});

//약관동의 유효성 검사
$('#btn').click(function(e){
    if($('#essential1').is(":checked") == false){
        $("#checkchoice").text("필수 동의입니다.")
            .css("color", "red");
        e.preventDefault();
    }
    else if($('#essential1').is(":checked") == true){
        $("#checkchoice").text("")
            .css("color", "red");
    }
    if($('#essential2').is(":checked") == false){
        $("#checkchoice1").text("필수 동의입니다.")
            .css("color", "red");
        e.preventDefault();
    }
    else if($('#essential2').is(":checked") == true){
        $("#checkchoice1").text("")
            .css("color", "red");
        $('#btnForm').submit();
    }
});

//유효성검사
var validateCheck = {
    "email" : false,
    "password" : false,
    "passwordch" : false,
    "name" : false,
    "phone" : false,
    "address" : false,
}


function checkEmail(){
    var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

    var value = $("#email").val();
    if(!regExp.test(value)){
        $("#checkEmail").text("이메일 형식이 유효하지 않습니다.")
            .css("color", "red");
        validateCheck.email = false;
        e.preventDefault();
    }else{
        $("#checkEmail").text("유효한 이메일 형식입니다.")
            .css("color", "green");
        validateCheck.email = true;
        return true;
    }
}



// 비밀번호 유효성 검사
$("#password, #passwordch").on("input", function(){
    var regExp = /^[a-zA-Z\d]{6,12}$/;

    var v1 = $("#password").val();
    var v2 = $("#passwordch").val();

    if(!regExp.test(v1)){
        $("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.")
            .css("color", "red")
        validateCheck.password = false;
        e.preventDefault();
    } else{
        $("#checkPwd1").text("유효한 비밀번호 형식입니다.")
            .css("color", "green");
        validateCheck.password = true;
    }

    // 비밀번호가 유효하지 않은 상태에서 비밀번호 확인 작성 시
    if(!validateCheck.password && v2.length > 0){
        swal("유효한 비밀번호를 먼저 작성해주세요.");
        $("#passwordch").val(""); // 비밀번호 확인에 입력한 값 삭제
        $("#password").focus();
        e.preventDefault();
        return false;
    }else {
        // 비밀번호, 비밀번호 확인의 일치 여부
        if(v1.length == 0 || v2.length == 0){
            $("#checkPwd2").text("");
        }else if(v1 == v2){
            $("#checkPwd2").text("비밀번호 일치")
                .css("color", "green");
            validateCheck.pwd2 = true;
            return true;
        }else{
            $("#checkPwd2").text("비밀번호 불일치")
                .css("color", "red");
            validateCheck.pwd2 = false;
            e.preventDefault();
            return false;

        }
    }
});


function checkPass(){
    var regExp = /^[a-zA-Z\d]{6,12}$/;

    var v1 = $("#password").val();
    var v2 = $("#passwordch").val();

    if(!regExp.test(v1)){
        $("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.")
            .css("color", "red")
        validateCheck.password = false;
        e.preventDefault();
    } else{
        $("#checkPwd1").text("유효한 비밀번호 형식입니다.")
            .css("color", "green");
        validateCheck.password = true;
    }

    // 비밀번호가 유효하지 않은 상태에서 비밀번호 확인 작성 시
    if(!validateCheck.password && v2.length > 0){
        swal("유효한 비밀번호를 먼저 작성해주세요.");
        $("#passwordch").val(""); // 비밀번호 확인에 입력한 값 삭제
        $("#password").focus();
        e.preventDefault();
        return false;
    }else {
        // 비밀번호, 비밀번호 확인의 일치 여부
        if(v1.length == 0 || v2.length == 0){
            $("#checkPwd2").text("");
        }else if(v1 == v2){
            $("#checkPwd2").text("비밀번호 일치")
                .css("color", "green");
            validateCheck.pwd2 = true;
            return true;
        }else{
            $("#checkPwd2").text("비밀번호 불일치")
                .css("color", "red");
            validateCheck.pwd2 = false;
            e.preventDefault();
            return false;

        }
    }
}

/*
이름 유효성 검사
/^[가-힣]{2,}$/; // 한글 두 글자 이상
*/
$("#name").on("input", function(){
    var regExp = /^[가-힣]{2,}$/;

    var value = $("#name").val();
    if(!regExp.test(value)){
        $("#checkName").text("이름 형식이 유효하지 않습니다.")
            .css("color", "red");
        validateCheck.name = false;
        e.preventDefault();
    }else {
        $("#checkName").text("유효한 이름 형식입니다.")
            .css("color", "green");
        validateCheck.name = true;
    }
});

function checkName(){
    var regExp = /^[가-힣]{2,}$/;

    var value = $("#name").val();
    if(!regExp.test(value)){
        $("#checkName").text("이름 형식이 유효하지 않습니다.")
            .css("color", "red");
        validateCheck.name = false;
        e.preventDefault();
    }else {
        $("#checkName").text("유효한 이름 형식입니다.")
            .css("color", "green");
        validateCheck.name = true;
        return true;
    }
}

// 전화번호 유효성 검사
$("#phone").on("input", function(){
    var regExp = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;

    출처: https://whiterussian.tistory.com/70 [화이트 러시안]

    var value = $("#phone").val();
    if(!regExp.test(value)){
        $("#checkPhone").text("전화번호 형식이 유효하지 않습니다.")
            .css("color", "red");
        validateCheck.phone = false;
        e.preventDefault();
    }else {
        $("#checkPhone").text("유효한 전화번호 형식입니다.")
            .css("color", "green");
        validateCheck.phone = true;
        return true;
    }
});

function checkPhone() {
    var regExp = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
    var value = $("#phone").val();
    if(!regExp.test(value)){
        $("#checkPhone").text("전화번호 형식이 유효하지 않습니다.")
            .css("color", "red");
        validateCheck.phone = false;
        e.preventDefault();
    }else {
        $("#checkPhone").text("유효한 전화번호 형식입니다.")
            .css("color", "green");
        validateCheck.phone = true;
        return true;
    }
}
$(document).ready(function () {
    $('#btnForm').submit(function () {
        validate();
    })
})


//전체검사
function validate(e) {
    if (document.Join_form.email.value == "" || checkEmail() === false) { //id값이 없을 경우
        $("#checkEmail").text("아이디를 입력하세요")
        .css("color", "red");       //메세지 경고창을 띄운 후
        document.Join_form.email.focus();     // id 텍스트박스에 커서를 위치
        e.preventDefault();

    } else if (document.Join_form.password.value == "" || checkPass() === false) {
        $("#checkPwd1").text("비밀번호를 입력하세요.")
            .css("color", "red");
        document.Join_form.password.focus();
        e.preventDefault();

    } else if (document.Join_form.passwordch.value == "" || checkPass() === false) {
        $("#checkPwd1").text("유효한 비밀번호를 입력하세요.")
            .css("color", "red");
        document.Join_form.passwordch.focus();
        e.preventDefault();

    } else if (document.Join_form.name.value == "" || checkName() === false) {
        $("#checkName").text("이름을 입력하세요.")
            .css("color", "red");
        document.Join_form.name.focus();
        e.preventDefault();

    } else if (document.Join_form.phone.value == "" || checkPhone() === false) {
        $("#checkPhone").text("전화번호 입력하세요.")
            .css("color", "red");
        document.Join_form.phone.focus();
        e.preventDefault();

    } else if (document.Join_form.address.value == "" ) {
        $("#checkaddress").text("주소를 입력하세요.")
            .css("color", "red");
        document.Join_form.address.focus();
        e.preventDefault();
    }

};

//약관동의 새창
function openWin() {
    window.open("/signup/email/mocaagree", "약관동의", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
}

function openWin2() {
    window.open("/signup/email/infoagree", "약관동의", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
}

function openWin3() {
    window.open("/signup/email/choiceagree", "약관동의", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
}














