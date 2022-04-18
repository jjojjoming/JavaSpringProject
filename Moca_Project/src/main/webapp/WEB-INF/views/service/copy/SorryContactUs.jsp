<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="/resources/css/copy.jae.css" rel="stylesheet">

<style>
    .title h2{
        color: #831be8;
        font-size: 28px;
        text-align: center;
    }
    .title h3{
        color: #9464d3;
        text-align: center;
        margin-bottom: 20px;
    }
</style>

<div class="contactUs">
    <div class="title">
        <h2>죄송합니다. 해당 서비스는 모카가 학습중입니다.</h2>
    </div>
    <div class="title">
        <h3>이메일을 남겨주시면 가장먼저 오픈 소식을 알려드릴게요!</h3>
    </div>
    <div class="box">
        <div class="contact form">
            <h3>Send a Message</h3>
            <%--<form onsubmit="sendEmail(); reset(); return false;">--%>
            <form action="https://formspree.io/f/xpzbrweb" method="POST" id="my-form">
                <div class="formBox">
                    <div class="row50">
                        <div class="inputBox">
                            <span>이름</span>
                            <input type="text" name="Customer_Name" placeholder="홍길동" id="person_name">
                        </div>
                        <div class="inputBox">
                            <span>기업 / 서비스명</span>
                            <input type="text" name="Business_Name" placeholder="솔데스크" id="business_name">
                        </div>
                    </div>
                    <div class="row50">
                        <div class="inputBox">
                            <span>이메일 주소</span>
                            <input type="text" name="Email" placeholder="soldesk@gmail.com" id="email">
                        </div>
                        <div class="inputBox">
                            <span>핸드폰</span>
                            <input type="text" name="Phone_Number" placeholder="010-3377-2985" id="phone">
                        </div>
                    </div>
                    <div class="row100">
                        <div class="inputBox">
                            <span>요청사항, 남기고싶은 말</span>
                            <textarea name="Message" placeholder="메시를 입력하세요.." id="message"></textarea>
                        </div>
                    </div>
                    <div class="row100">
                        <div class="inputBox">
                            <input type="submit" value="보내기">
                        </div>
                        <p id="my-form-status"></p>
                    </div>
                </div>
            </form>
        </div>

        <%--info Box--%>
        <div class="contact info">
            <h3>Contact Info</h3>
            <div class="infoBox">
                <div>
                    <span><ion-icon name="location-outline"></ion-icon></span>
                    <p>서울특별시,종로구<br>대한민국</p>
                </div>
                <div>
                    <span><ion-icon name="mail-outline"></ion-icon></span>
                    <a href="mailto:astarcompany6@gmail.com">astarcompany6@gmail.com</a>
                </div>
                <div>
                    <span><ion-icon name="call-outline"></ion-icon></span><br>
                    <a href="tel:+8201092475839">+82 010 9247 5839</a>
                </div>
                <%--Social Media Links--%>
                <ul class="sci">
                    <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
                    <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
                    <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
                    <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
                </ul>
            </div>
        </div>

        <%--Map--%>
        <div class="contact map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.3943915952245!2d126.98381791607608!3d37.56932973172423!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e89e08e16b%3A0xf8955b2100de16c3!2z7IaU642w7Iqk7YGs!5e0!3m2!1sko!2skr!4v1645345295187!5m2!1sko!2skr"
                    style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<%--<script src="https://smtpjs.com/v3/smtp.js"></script>
<script>
    function sendEmail(){
        Email.send({
            SecureToken: "f4c8203b-d458-4e50-8317-350f74e88bd3",
/*            Host : "smtp.gmail.com",
            Username : "astarcompany6@gmail.com",
            Password : "dktmxkzjavjsl*",*/
            To : "MocaContact@gmail.com",
            From : document.getElementById("email").value,
            Subject : "Moca 새로운 문의사항 도착",
            Body : "Name : "+document.getElementById("person_name").value
            +"<br> Email : "+document.getElementById("email").value
                +"<br> Business Nmae : "+document.getElementById("business_name").value
            +"<br> Phone no : "+document.getElementById("phone").value
            +"<br> Message : "+document.getElementById("message").value
        }).then(
            message => alert("접수가 완료되었습니다.")
        );
    }
</script>--%>

<script>
    var form = document.getElementById("my-form");

    async function handleSubmit(event) {
        event.preventDefault();
        var status = document.getElementById("my-form-status");
        var data = new FormData(event.target);
        fetch(event.target.action, {
            method: form.method,
            body: data,
            headers: {
                'Accept': 'application/json'
            }
        }).then(response => {
            if (response.ok) {
                status.innerHTML = "제출이 완료되었습니다!";
                form.reset()
            } else {
                response.json().then(data => {
                    if (Object.hasOwn(data, 'errors')) {
                        status.innerHTML = data["errors"].map(error => error["message"]).join(", ")
                    } else {
                        status.innerHTML = "Oops! 입력하신 정보를 다시한번 확인해주세요."
                    }
                })
            }
        }).catch(error => {
            status.innerHTML = "Oops! 입력하신 정보를 다시한번 확인해주세요."
        });
    }
    form.addEventListener("submit", handleSubmit)
</script>