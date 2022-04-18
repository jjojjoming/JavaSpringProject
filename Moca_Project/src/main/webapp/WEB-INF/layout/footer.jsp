<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
  .col-md-6.col-lg-3 {
    width: 50% !important;
  }

  .col-md-6.col-lg-3 p {
    font-size: 20px;
  }
  .container.py-5.px-lg-5{
    font-weight: bold;
  }

</style>
<!-- Footer Start -->
<div class="container-fluid bg-moca text-light footer wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5 px-lg-5">
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <p class="section-title text-white h5 mb-4">주소<span></span></p>
                <p><i class="fa fa-map-marker-alt me-3"></i>서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
                <p><i class="fa fa-phone-alt me-3"></i>010-1234-5678</p>
                <p><i class="fa fa-envelope me-3"></i>astarcompany6@gmail.com</p>
            </div>
            <div class="col-md-6 col-lg-3">
                <p class="section-title text-white h5 mb-4">바로가기<span></span></p>
                <a href="/service"><p>- SERVICE</p></a>
                <a href="/team"><p>- TEAM</p></a>
                <a href="/cs/faq"><p>- CS</p></a>
            </div>
        </div>
    </div>
    <div class="container px-lg-5">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">ASTAR COMPANY</a>, All Right Reserved.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->


<div
        id="kakao-talk-channel-chat-button"
        data-channel-public-id="_Vcqxeb"
        data-title="consult"
        data-size="small"
        data-color="yellow"
        data-shape="pc"
        data-support-multiple-densities="true"
        class="back-to-top-kakao"
></div>


<!-- Back to Top -->
<button class="btn btn-lg btn-secondary btn-lg-square back-to-top" onclick="window.scrollTo(0,0);">
    <i class="bi bi-arrow-up"></i>
</button>

<script>
  window.kakaoAsyncInit = function () {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>

<%--<script type="text/javascript">--%>
<%--  // 사용할 앱의 JavaScript 키를 설정해 주세요.--%>
<%--  Kakao.init('5f47c843352a3fd78a4114eaed7e3366');--%>
<%--  // 채널 1:1 채팅 버튼을 생성합니다.--%>
<%--  Kakao.Channel.createChatButton({--%>
<%--    container: '#kakao-talk-channel-chat-button',--%>
<%--    channelPublicId: 'moca',--%>
<%--    title: 'consult',--%>
<%--    size: 'small',--%>
<%--    color: 'yellow',--%>
<%--    shape: 'pc',--%>
<%--    supportMultipleDensities: true,--%>
<%--  });--%>
<%--</script>--%>


