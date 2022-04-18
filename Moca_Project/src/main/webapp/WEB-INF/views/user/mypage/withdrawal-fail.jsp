<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    .position-relative {
        display: none;
    }

    .container-fluid {
        display: none;
    }
    #kakao-talk-channel-chat-button {
        display: none;
    }
    .btn-secondary {
        display: none;
    }
</style>
<script>
    swal('잘못된 비밀번호입니다.', '', 'error').then(function(){
        location.href = "/user/withdrawal/check";
    })
    // alert('잘못된 비밀번호입니다.')
    // location.href = "/user/withdrawal/check"
</script>
