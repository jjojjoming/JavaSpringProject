<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="/resources/css/pricing-table.css" rel="stylesheet">

<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>

                <div class="Register">
                    <div class="RegisterHeader">
                        <div class="RegisterHeader__content">
                            <div class="RegisterHeader__content--title"><span>"모카"</span> 모든 서비스를 <b>무제한 이용</b>하세요</div>
                            <div class="RegisterHeader__content--benefit">
                                <details>
                                    <summary>멤버십 혜택 보기</summary>
                                    <div class="RegisterHeader__content--benefit--box">
                                        <div>
                                            <p>
                                                <i class="fa-solid fa-circle-check"></i>
                                                헤드카피, 세일즈카피, 블로그 카피 및 각종 SNS 카피 무제한 이용
                                            </p>
                                            <p>
                                                <i class="fa-solid fa-circle-check"></i>
                                                카피 이용에 필요한 모든 50만건의 빅데이터 인공지능 서비스
                                            </p>
                                        </div>
                                        <div>
                                            <p>
                                                <i class="fa-solid fa-circle-check"></i>
                                                카톡 상담을 통한 실시간 질문
                                            </p>
                                            <p>
                                                <i class="fa-solid fa-circle-check"></i>
                                                유능한 카피라이터들 연결
                                            </p>
                                        </div>
                                    </div>
                                </details>
                            </div>
                        </div>
                    </div>
                    <div class="pay-section Register__wrapper">
                        <div class="RegisterOptions ">
                            <div id="RegisterOption__0" class="RegisterOption__wrapper RegisterOption__wrapper--gray">
                                <div class="RegisterOption RegisterOption--orange">
                                    <div class="RegisterOption__title highlightFont">1개월 멤버십<br/>베이직</div>
                                    <div class="RegisterOption__content">
                                        <div class="RegisterOption__info">
                                            <div class="RegisterOption__info--first">
                                                <div class="RegisterOption__info--retail">40,000원</div>
                                                <div class="RegisterOption__info--discount">-97%</div>
                                            </div>
                                            <div class="RegisterOption__info--second">
                                                <div class="RegisterOption__info--final highlightFont">
                                                    1,000<span>원</span></div>
                                            </div>
                                        </div>
                                        <div class="RegisterOption__button" onclick="window.open('http://www.payapp.kr/L/z2ztd7')">멤버십 선택</div>
                                    </div>
                                </div>
                            </div>
                            <div id="RegisterOption__1" class="RegisterOption__wrapper RegisterOption__wrapper--purple">
                                <div class="RegisterOption RegisterOption--purple">
                                    <div class="RegisterOption__title highlightFont">12개월 멤버십<br/>비지니스</div>
                                    <div class="RegisterOption__content">
                                        <div class="RegisterOption__info">
                                            <div class="RegisterOption__info--first">
                                                <div class="RegisterOption__info--retail">480,000원</div>
                                                <div class="RegisterOption__info--discount">-79%</div>
                                            </div>
                                            <div class="RegisterOption__info--second">
                                                <div class="RegisterOption__info--final highlightFont">
                                                    100,000<span>원</span></div>
                                            </div>
                                        </div>
                                        <div class="RegisterOption__button" onclick="window.open('http://www.payapp.kr/L/z2zthF') ">멤버십 선택</div>
                                    </div>
                                </div>
                            </div>
                            <div id="RegisterOption__2" class="RegisterOption__wrapper RegisterOption__wrapper--mint">
                                <div class="RegisterOption RegisterOption--mint">
                                    <div class="RegisterOption__title highlightFont">3개월 멤버십<br/>프리미엄</div>
                                    <div class="RegisterOption__content">
                                        <div class="RegisterOption__info">
                                            <div class="RegisterOption__info--first">
                                                <div class="RegisterOption__info--retail">120,000원</div>
                                                <div class="RegisterOption__info--discount">-50%</div>
                                            </div>
                                            <div class="RegisterOption__info--second">
                                                <div class="RegisterOption__info--final highlightFont">
                                                    60,0000<span>원</span></div>
                                            </div>
                                        </div>
                                        <div class="RegisterOption__button" onclick="window.open('http://www.payapp.kr/L/z2ztf1')">멤버십 선택</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<%--<script src="https://kit.fontawesome.com/a076d05399.js"></script>--%>

<%--<style>--%>
<%--    .price_all{--%>
<%--        margin: 0;--%>
<%--        padding: 0;--%>
<%--        box-sizing: border-box;--%>
<%--    }--%>
<%--    .price_all_body{--%>
<%--        display: flex;--%>
<%--        align-items: center;--%>
<%--        justify-content: center;--%>
<%--        padding: 20px;--%>
<%--        background: white;--%>
<%--        width: 1100px;--%>
<%--    }--%>
<%--    .wrapper{--%>
<%--        max-width: 1090px;--%>
<%--        width: 100%;--%>
<%--        margin: auto;--%>
<%--        display: flex;--%>
<%--        flex-wrap: wrap;--%>
<%--        justify-content: space-between;--%>
<%--    }--%>
<%--    .wrapper .table{--%>
<%--        background: #fff;--%>
<%--        width: calc(33% - 20px);--%>
<%--        padding: 30px 30px;--%>
<%--        position: relative;--%>
<%--        box-shadow: 0 5px 10px rgba(0,0,0,0.1);--%>
<%--    }--%>
<%--    .table .price-section{--%>
<%--        display: flex;--%>
<%--        justify-content: center;--%>
<%--    }--%>
<%--    .table .price-area{--%>
<%--        height: 120px;--%>
<%--        width: 120px;--%>
<%--        border-radius: 50%;--%>
<%--        padding: 2px;--%>
<%--    }--%>
<%--    .price-area .inner-area{--%>
<%--        height: 100%;--%>
<%--        width: 100%;--%>
<%--        border-radius: 50%;--%>
<%--        border: 3px solid #fff;--%>
<%--        line-height: 117px;--%>
<%--        text-align: center;--%>
<%--        color: #fff;--%>
<%--        position: relative;--%>
<%--    }--%>
<%--    .price-area .inner-area .text{--%>
<%--        font-size: 25px;--%>
<%--        font-weight: 400;--%>
<%--        position: absolute;--%>
<%--        top: -10px;--%>
<%--        left: 17px;--%>
<%--    }--%>
<%--    .price-area .inner-area .price{--%>
<%--        font-size: 45px;--%>
<%--        font-weight: 500;--%>
<%--        margin-left: 16px;--%>
<%--    }--%>

<%--    .price-area .inner-area .month {--%>
<%--        font-size: 10px;--%>
<%--        font-weight: 500;--%>
<%--        margin-right: 16px;--%>
<%--        color: black;--%>
<%--    }--%>

<%--    .table .package-name{--%>
<%--        width: 100%;--%>
<%--        height: 2px;--%>
<%--        margin: 35px 0;--%>
<%--        position: relative;--%>
<%--    }--%>
<%--    .table .package-name::before{--%>
<%--        position: absolute;--%>
<%--        top: 50%;--%>
<%--        left: 50%;--%>
<%--        font-size: 25px;--%>
<%--        font-weight: 500;--%>
<%--        background: #fff;--%>
<%--        padding: 0 15px;--%>
<%--        transform: translate(-50%, -50%);--%>
<%--    }--%>
<%--    .table .features li{--%>
<%--        margin-bottom: 15px;--%>
<%--        list-style: none;--%>
<%--        display: flex;--%>
<%--        justify-content: space-between;--%>
<%--    }--%>
<%--    .features li .list-name{--%>
<%--        font-size: 17px;--%>
<%--        font-weight: 400;--%>
<%--    }--%>
<%--    .features li .icon{--%>
<%--        font-size: 15px;--%>
<%--    }--%>
<%--    .features li .icon.check{--%>
<%--        color: #2db94d;--%>
<%--    }--%>
<%--    .features li .icon.cross{--%>
<%--        color: #cd3241;--%>
<%--    }--%>
<%--    .table .btn{--%>
<%--        width: 100%;--%>
<%--        display: flex;--%>
<%--        margin-top: 35px;--%>
<%--        justify-content: center;--%>
<%--    }--%>
<%--    .table .btn button{--%>
<%--        width: 80%;--%>
<%--        height: 50px;--%>
<%--        color: #fff;--%>
<%--        font-size: 20px;--%>
<%--        font-weight: 500;--%>
<%--        border: none;--%>
<%--        outline: none;--%>
<%--        border-radius: 25px;--%>
<%--        cursor: pointer;--%>
<%--        transition: all 0.3s ease;--%>
<%--    }--%>
<%--    .table .btn button:hover{--%>
<%--        border-radius: 5px;--%>
<%--    }--%>
<%--    .basic .features li::selection{--%>
<%--        background: #ffd861;--%>
<%--    }--%>
<%--    .basic ::selection,--%>
<%--    .basic .price-area,--%>
<%--    .basic .inner-area{--%>
<%--        background: #ffd861;--%>
<%--    }--%>
<%--    .basic .btn button{--%>
<%--        border: 2px solid #ffd861;--%>
<%--        background: #fff;--%>
<%--        color: #ffd861;--%>
<%--    }--%>
<%--    .basic .btn button:hover{--%>
<%--        background: #ffd861;--%>
<%--        color: #fff;--%>
<%--    }--%>
<%--    .premium ::selection,--%>
<%--    .premium .price-area,--%>
<%--    .premium .inner-area,--%>
<%--    .premium .btn button{--%>
<%--        background: #a26bfa;--%>
<%--    }--%>
<%--    .premium .btn button:hover{--%>
<%--        background: #833af8;--%>
<%--    }--%>
<%--    .ultimate ::selection,--%>
<%--    .ultimate .price-area,--%>
<%--    .ultimate .inner-area{--%>
<%--        background: #43ef8b;--%>
<%--    }--%>
<%--    .ultimate .btn button{--%>
<%--        border: 2px solid #43ef8b;--%>
<%--        color: #43ef8b;--%>
<%--        background: #fff;--%>
<%--    }--%>
<%--    .ultimate .btn button:hover{--%>
<%--        background: #43ef8b;--%>
<%--        color: #fff;--%>
<%--    }--%>
<%--    .basic .package-name{--%>
<%--        background: #ffecb3;--%>
<%--    }--%>
<%--    .premium .package-name{--%>
<%--        background: #d0b3ff;--%>
<%--    }--%>
<%--    .ultimate .package-name{--%>
<%--        background: #baf8d4;--%>
<%--    }--%>
<%--    .basic .package-name::before{--%>
<%--        content: "베이직";--%>
<%--    }--%>
<%--    .premium .package-name::before{--%>
<%--        content: "프리미엄";--%>
<%--        font-size: 24px;--%>
<%--    }--%>
<%--    .ultimate .package-name::before{--%>
<%--        content: "비즈니스";--%>
<%--        font-size: 24px;--%>
<%--    }--%>
<%--    @media (max-width: 1020px) {--%>
<%--        .wrapper .table{--%>
<%--            width: calc(50% - 20px);--%>
<%--            margin-bottom: 40px;--%>
<%--        }--%>
<%--    }--%>
<%--    @media (max-width: 698px) {--%>
<%--        .wrapper .table{--%>
<%--            width: 100%;--%>
<%--        }--%>
<%--    }--%>
<%--    ::selection{--%>
<%--        color: #fff;--%>
<%--    }--%>
<%--    .table .ribbon{--%>
<%--        width: 150px;--%>
<%--        height: 150px;--%>
<%--        position: absolute;--%>
<%--        top: -10px;--%>
<%--        left: -10px;--%>
<%--        overflow: hidden;--%>
<%--    }--%>
<%--    .table .ribbon::before,--%>
<%--    .table .ribbon::after{--%>
<%--        position: absolute;--%>
<%--        content: "";--%>
<%--        z-index: -1;--%>
<%--        display: block;--%>
<%--        border: 7px solid #4606ac;--%>
<%--        border-top-color: transparent;--%>
<%--        border-left-color: transparent;--%>
<%--    }--%>
<%--    .table .ribbon::before{--%>
<%--        top: 0px;--%>
<%--        right: 15px;--%>
<%--    }--%>
<%--    .table .ribbon::after{--%>
<%--        bottom: 15px;--%>
<%--        left: 0px;--%>
<%--    }--%>
<%--    .table .ribbon span{--%>
<%--        position: absolute;--%>
<%--        top: 30px;--%>
<%--        right: 0;--%>
<%--        transform: rotate(-45deg);--%>
<%--        width: 200px;--%>
<%--        background: #a26bfa;--%>
<%--        padding: 10px 0;--%>
<%--        color: #fff;--%>
<%--        text-align: center;--%>
<%--        font-size: 17px;--%>
<%--        text-transform: uppercase;--%>
<%--        box-shadow: 0 5px 10px rgba(0,0,0,0.12);--%>
<%--    }--%>

<%--    #table_basic{--%>
<%--        border: 2px solid #ffd861;--%>
<%--    }--%>

<%--    #table_premium{--%>
<%--        border: 2px solid #a26bfa;--%>
<%--    }--%>

<%--    #table_ultimate{--%>
<%--        border: 2px solid #43ef8b;--%>
<%--    }--%>
<%--</style>--%>



<%--<div class="price_all">--%>
<%--    <div class="price_all_body">--%>
<%--        <div class="wrapper">--%>
<%--            <div class="table basic" id="table_basic">--%>
<%--                <div class="price-section">--%>
<%--                    <div class="price-area">--%>
<%--                        <div class="inner-area">--%>
<%--                            <span class="text">$</span>--%>
<%--                            <span class="price">19</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="package-name"></div>--%>
<%--                <ul class="features">--%>
<%--                    <li>--%>
<%--                        <span class="list-name">헤드카피 제작(10개)</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">세일즈 카피 제작(10개)</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">SNS 카피 제작</span>--%>
<%--                        <span class="icon cross"><i class="fas fa-times"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">자동 카피 변환 API</span>--%>
<%--                        <span class="icon cross"><i class="fas fa-times"></i></span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <div class="btn"><button type="button" onclick="window.open('http://www.payapp.kr/L/z2ztd7') ">이용하기</button></div>--%>
<%--            </div>--%>
<%--            <div class="table premium" id="table_premium">--%>
<%--                <div class="ribbon"><span>베스트상품</span></div>--%>
<%--                <div class="price-section">--%>
<%--                    <div class="price-area">--%>
<%--                        <div class="inner-area">--%>
<%--                            <span class="text">$</span>--%>
<%--                            <span class="price">59</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="package-name"></div>--%>
<%--                <ul class="features">--%>
<%--                    <li>--%>
<%--                        <span class="list-name">헤드카피 무제한 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">세일즈 카피 무제한 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">SNS 카피 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">자동 카피 변환 API</span>--%>
<%--                        <span class="icon cross"><i class="fas fa-times"></i></span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <div class="btn"><button type="button" onclick="window.open('http://www.payapp.kr/L/z2ztf1') ">이용하기</button></div>--%>
<%--            </div>--%>
<%--            <div class="table ultimate" id="table_ultimate">--%>
<%--                <div class="price-section">--%>
<%--                    <div class="price-area">--%>
<%--                        <div class="inner-area">--%>
<%--                            <span class="text">$</span>--%>
<%--                            <span class="price">99</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="package-name"></div>--%>
<%--                <ul class="features">--%>
<%--                    <li>--%>
<%--                        <span class="list-name">헤드카피 무제한 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">세일즈 카피 무제한 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">SNS 카피 제작</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <span class="list-name">자동 카피 변환 API</span>--%>
<%--                        <span class="icon check"><i class="fas fa-check"></i></span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <div class="btn"><button type="button" onclick="window.open('http://www.payapp.kr/L/z2zthF') ">이용하기</button></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>