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
    swal('기존 비밀번호를 확인해주세요.', '', 'error').then(function(){
        location.href = "/user/info";
    })
    // alert('기존 비밀번호를 확인해주세요.')
    // location.href = "/user/info"
</script>
