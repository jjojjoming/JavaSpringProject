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

Kakao.init('5f47c843352a3fd78a4114eaed7e3366'); //발급받은 키 중 javascript키를 사용해준다.
// 로그인 페이지 접속시 로그아웃 시켜준다
kakaoLogout();
//카카오로그인
function kakaoLogin() {

    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    let email = response.kakao_account.email;
                    let id = response.id;
                    if (email === '' || email === undefined){
                        alert("선택 제공 항목의 카카오계정(이메일)을 체크해주셔야 가입할 수 있습니다.");
                        kakaoLogout();
                        return false;
                    }else {
                        kakaoLoginProcess(id, email);
                    }
                },
                fail: function (error) {
                    console.log(error)
                },
            })
        },
        fail: function (error) {
            console.log(error)
        },
    })
}
//카카오로그아웃
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
            },
            fail: function (error) {
                console.log(error)
            },
        })
        Kakao.Auth.setAccessToken(undefined)
    }
}

function kakaoLoginProcess(id, email) {
    $.ajax({
            type: "POST",
            url: '/sns/kakaoLoginProcess',
            // dataType: "text",
            data:{
                "id" : id,
                "email" : email
            },
            success: function(response){
                let html = $.parseHTML(response);
                if (html.length === 0){
                    location.href="/";
                }else {
                    alert("ERROR MESSAGE: 혹시 탈퇴한 계정으로 로그인을 시도하셨는지 확인 후 다시 시도해주세요. 탈퇴한 계정이 아니시라면 관리자에게 문의해주세요.");
                    kakaoLogout();
                }
            },
            error:function(request,status,error){
                kakaoLogout();
                const errorMsg = JSON.parse(request.responseText);
                alert("ERROR CODE: "+request.status+"\n"+
                    "ERROR MESSAGE: "+errorMsg.message+"\n"+
                    "상태가 지속될 경우 관리자에게 문의해주세요");
            }
        }
    );
}
