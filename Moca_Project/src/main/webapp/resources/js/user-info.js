$(document).ready(function() {
    $('#infoChange').click(function () {
        $('#name').removeAttr("disabled");
        $('#address').removeAttr("disabled");
        $('#phone').removeAttr("disabled");
        $('.btnChange').removeAttr("style");
        $('#infoChange').attr("style", "display: none");

        $('#name').attr("style", "background-color: #ffffff; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; padding: 5px 10px;");
        $('#address').attr("style", "background-color: #ffffff; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; padding: 5px 10px;");
        $('#phone').attr("style", "background-color: #ffffff; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; padding: 5px 10px;");

    })

    $('#cancelChange').click(function () {
        location.href="/user/info";
    })



});

$('.AccountProfileInfo__profileImg').click(function () {
    $('#profileImg').click();
})
$('#profileImg').on("change", profileSubmit);

function profileSubmit() {
    $('#profileImgSubmit').click();
}

$(function(){
    if($("#mypageForm1").submit(function(){
        if($("#name").val() == ""){
            alert("이름을 입력하세요.");
            return false;
        }
        else if($("#phone").val() == ""){
            alert("전화번호를 입력하세요.");
            return false;
        }
    }));
    if($("#mypageForm2").submit(function(){
        if($("#newPassword").val() !== $("#newPassword2").val()){
            alert("비밀번호가 다릅니다.");
            $("#newPassword").val("").focus();
            $("#newPassword2").val("");
            return false;
        }else if ($("#newPassword").val().length < 6) {
            alert("비밀번호는 6자 이상으로 설정해야 합니다.");
            $("#newPassword").val("").focus();
            return false;
        }else if ($("#newPassword").val().length > 12) {
            alert("비밀번호는 12자 이하로 설정해야 합니다.");
            $("#newPassword").val("").focus();
            return false;
        }else if($.trim($("#newPassword").val()) !== $("#newPassword").val()){
            alert("공백은 입력이 불가능합니다.");
            return false;
        }

    }));
})

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