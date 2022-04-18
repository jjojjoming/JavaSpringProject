<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="/resources/css/copy.jae.css" rel="stylesheet">
<div class="copy_body">
<div class="copy_container">
    <div class="copy_title">세일즈카피 만들기</div>
    <div class="copy_content">
        <form action="/service/copy/sales/input/loading" method="get">
        <div class="copy_user-details">
            <div class="copy_input-box">
                <span class="copy_details">회사 / 제품 / 서비스명</span>
                <input type="text" name="sales_name" placeholder="입력하세요" required>
            </div>
            <div class="copy_input-box">
                <span class="copy_details">설명</span>
                <textarea class="copy_description" name="sales_description" placeholder="제품 / 서비스명에 대한 간단한 설명을 남겨주세요."></textarea>
            </div>
            <div class="copy_input-box">
                <span class="copy_details">카테고리를 선택하세요</span>
                <select name="sales_category">
                    <option value="1">가구/인테리어</option>
                    <option value="2">가전제품</option>
                    <option value="3">건강보조식품</option>
                    <option value="4">건설/부종산</option>
                    <option value="5">게임</option>
                    <option value="6">관공서 / 단체 / 공익 / 기업</option>
                    <option value="7">교육 / 대학</option>
                    <option value="8">금융</option>
                    <option value="9">레저</option>
                    <option value="10">명대사</option>
                    <option value="11">생활용품</option>
                    <option value="12">생활 / 가구 / 가정용품</option>
                    <option value="13" selected="selected">서비스</option>
                    <option value="14">쇼핑</option>
                    <option value="15">숙박업 / 호텔</option>
                    <option value="16">식품 / 음료</option>
                    <option value="17">애견</option>
                    <option value="18">앱</option>
                    <option value="19">언론</option>
                    <option value="20">여행</option>
                    <option value="21">영화/음악/미디어</option>
                    <option value="22">유통</option>
                    <option value="23">이동 / 정보통신</option>
                    <option value="24">자동차</option>
                    <option value="25">전기 / 전자제품</option>
                    <option value="26">제약 / 의료 / 복지</option>
                    <option value="27">출판 / 교육 / 문화</option>
                    <option value="28">콘텐츠</option>
                    <option value="29">패션</option>
                    <option value="30">항공</option>
                    <option value="31">메이크업</option>
                    <option value="32">종교</option>
                    <option value="33">기타</option>
                </select>
            </div>
            <div class="copy_input-box">
                <span class="copy_details">핵심 키워드</span>
                <input type="text" name="sales_main_key" placeholder="예) 자동차, 맛집, 학원 등" required>
            </div>
            <div class="copy_input-box">
                <span class="copy_details">서브 키워드 1</span>
                <input type="text" name="sales_sub_key1" placeholder="예) 식당, 교육, 컨설팅 등" required>
            </div>
            <div class="copy_input-box">
                <span class="copy_details">서브 키워드 2</span>
                <input type="text" name="sales_sub_key2" placeholder="예) 여행, 화장품, 호텔 등" required>
            </div>
        </div>
        <div class="copy_button">
            <input type="submit" value="카피 만들기">
        </div>
    </form>
    </div>
</div>
</div>