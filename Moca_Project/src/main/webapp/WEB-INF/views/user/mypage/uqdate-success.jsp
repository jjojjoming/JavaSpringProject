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
    swal('수정이 완료되었습니다.', '', 'success').then(function(){
        location.href = "/user/info";
    })
    // alert('수정이 완료되었습니다.')
    // location.href = "/user/info"
</script>
