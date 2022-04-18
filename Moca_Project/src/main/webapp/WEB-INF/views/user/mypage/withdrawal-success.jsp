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
    $(document).ready(function() {
        $('#submit').click();
    });
    swal('회원탈퇴가 완료되었습니다.', '', 'success')
    // alert('회원탈퇴가 완료되었습니다.')
</script>


<form name="logoutForm" method="post" action="/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button type="submit" class="dropdown-item" id="submit"><i class="fa-solid fa-arrow-right-to-bracket"></i>로그아웃</button>
</form>
