<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="/resources/css/team.css" rel="stylesheet">
<style>
  .team-top-section {
    background: var(--astar) !important;
    color: transparent;
  }

  .m-0{
    background: linear-gradient(to right top, #7928CA, #FF0080) !important;
    color: transparent;
    -webkit-background-clip: text !important;
  }

  .SignForm__submitBtnWrapper.header a:before {
    background-image: linear-gradient(273deg, #7928CA, #FF0080) !important;
  }

  .SignForm__submitBtnWrapper.header a {
    background-image: linear-gradient(276deg, #6c28af, #ab2d6d) !important;
  }
  .container-xxxl.py-5{
    padding-left: 0;
    padding-right: 0;
  }

  .bg-moca {
    background: var(--astar) !important;
    color: transparent;
  }

  button > img{
    width: 100%;
    padding: 15px;
  }

  .active{
    border-color: #fff;
  }
  .TeamsIntroduction_subject__2hMt3{
    font-size: 15px !important;
  }

  .skill-section{
    height: 225px;
  }

  .fa-brands.fa-github{
    font-size: 30px;
  }
</style>

<div class="container-xxxl py-5" style="margin-bottom: 25em">
    <div class="Layout_Layout__content__2lFnN">
        <div class="TeamsContainer_TeamsContainer__9P6w8">
            <div class="TeamsBackground_TeamsBackground__2p_tn">
                <div class="TeamsBackground_topCoverImage__1JIAb team-top-section"></div>
                <div class="TeamsBackground_darkBox__2HVJX"></div>
                <div class="TeamsBackground_grayBox__1Nh73"></div>
            </div>
            <div class="TeamsContainer_positionAligner__3jxbn">
                <div class="TeamsContainer_teamsContentBox__1849w">
                    <div class="TeamsCoreValues_TeamsCoreValues__wpltI">
                        <div class="TeamsCoreValues_slogan__3GCtm">
                            <p>MUST TO TRY</p>
                            <p>WE'RE THE BEST</p>
                        </div>
                        <div class="TeamsCoreValues_coreValuesContainer__rEhSl">
                            <p class="TeamsCoreValues_title__5Tg2H">
                            <b>우리가 사용한 기술</b>
                            </p>
                            <div class="TeamsCoreValues_verticalDivider__gMBQ9"></div>
                            <div class="TeamsCoreValues_contentBox__1Pu8j">
                                <div class="TeamsCoreValues_iconBox__1wN-H" id="myTab">
                                    <button href="#button1" aria-controls="button1" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/cloud.png">
                                    </button>
                                    <button href="#button2" aria-controls="button2" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/github.png">
                                    </button>
                                    <button href="#button3" aria-controls="button3" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/security.png">
                                    </button>
                                    <button href="#button4" aria-controls="button4" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/crawler.png">
                                    </button>
                                    <button href="#button5" aria-controls="button5" role="tab" data-toggle="tab" class="active skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/ai.png">
                                    </button>
                                    <button href="#button6" aria-controls="button6" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/membership.png">
                                    </button>
                                    <button href="#button7" aria-controls="button7" role="tab" data-toggle="tab" class="skill-btn TeamsCoreValuesIconButton_TeamsCoreValuesIconButton__1uM6r TeamsCoreValuesIconButton_unselected__2PGIE">
                                        <img src="resources/img/team/etc.png">
                                    </button>
                                </div>

                                <div class="skill-section tab-content">
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button1">
                                        <p class="TeamsCoreValues_orderText__1fB3a">AWS CLOUD SERVER</p>
                                        <p class="TeamsCoreValues_subject__12T-5">우리는 클라우드 서버를 사용하고 있어요.</p>
                                        <ul class="TeamsCoreValues_description__2e02t">
                                            <li>EC2</li>
                                            <li>RDS - maridaDB</li>
                                            <li>S3</li>
                                            <li>CLOUD-FRONT</li>
                                            <li>ROUTE53</li>
                                            <li>ELB(LOAD BALANCER)</li>
                                            <li>SSL CERTIFICATE - https</li>
                                        </ul>
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button2">
                                        <p
                                            class="TeamsCoreValues_orderText__1fB3a">Github : Git-flow</p>
                                        <p class="TeamsCoreValues_subject__12T-5">우린 Git-flow를 사용하고 있어요</p>
                                        <p class="TeamsCoreValues_description__2e02t">
                                            팀 프로젝트의 핵심은 소스를 어떻게 관리하느냐 입니다.<br>
                                            모카팀은 소스를 깃허브로 관리 하면서 git-flow 전략을 적극 활용 하였습니다.<br>
                                            모카팀은 각 분배된 업무에 따라 작업 브랜치를 생성하고 병렬로 처리하던 작업들이 완료가 되면<br>
                                            각 브랜치드를 하나로 병합 -> 개발 브랜치 -> 릴리즈 브랜치 -> 테스트 -> 메인 브랜치 -> 배포<br>
                                            의 순으로 진행 하였습니다.
                                        </p>
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button3">
                                        <p class="TeamsCoreValues_orderText__1fB3a">Spring Security</p>
                                        <p class="TeamsCoreValues_subject__12T-5">인증(Authorizatoin)과 인가(Authentication)</p>
                                        <p class="TeamsCoreValues_description__2e02t">
                                            Spring Security는 스프링 기반 애플리케이션의 보안(인증과 권한, 인가 등)을 담당하는 기능입니다.<br>
                                            인증(Authentication)은 해당 사용자가 본인이 맞는지를 확인하는 절차입니다.<br>
                                            인가(Authorization)는 인증된 사용자가 요청한 자원에 접근 가능한지를 결정하는 절차입니다.<br>
                                            Spring Security는 기본적으로 인증 절차를 거친 후에 인가 절차를 진행하게 되며, 인가 과정에서 해당 페이자에 대한 접근 권한이 있는지를 확인하게 됩니다.
                                        </p>
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button4">
                                        <p class="TeamsCoreValues_orderText__1fB3a">Web Crawling</p>
                                        <p class="TeamsCoreValues_subject__12T-5">우리는 크롤링으로 데이터를 수집하고 있어요.</p>
                                        <p class="TeamsCoreValues_description__2e02t">
                                            웹 크롤러란 인터넷에 있는 웹페이지를 방문해서 자료를 수집하는 일을 하는 프로그램을 말합니다.<br>
                                            모카 서비스는 빅데이터를 필요로하는 인공지능 서비스입니다.<br>
                                            인공지능 학습에는 많은 데이터들이 필요로 합니다.<br>
                                            그래서 네이버, 구글등 많은 곳에서 데이터를 수집 하고 있습니다.
                                        </p>
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button5">
                                        <p class="TeamsCoreValues_orderText__1fB3a">Big data, Ai</p>
                                        <p class="TeamsCoreValues_subject__12T-5">우리는 빅데이터 인공지능을 사용하고 있어요.</p>
                                        <p class="TeamsCoreValues_description__2e02t">
                                            웹크롤러를 이용해 수집된 빅데이터와 세계에서 가장 진보된 AI 언어 모델을 기반으로<br>
                                            구축된 모카는 수천 명의 사람들이 창의력을 발휘할 수 있도록 돕고 그 과정에서 마음을 사로잡습니다.<br>
                                            수십만개의 카피 문구를 분석해 모카 AI가 최적화환 메시지를 제공 합니다.
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button6">
                                        <p class="TeamsCoreValues_orderText__1fB3a">멈버십</p>
                                        <p class="TeamsCoreValues_subject__12T-5">결제기능을 통해 멤버십 전략을 이용했어요.</p>
                                        <p class="TeamsCoreValues_description__2e02t">
                                            멤버십 결제를 통해 1개월, 3개월 12개월 이용 권한을 설정했습니다.
                                        </p>
                                    </div>
                                    <div class="TeamsCoreValues_content__3JGoL tab-pane" role="tabpanel" id="button7">
                                        <p class="TeamsCoreValues_orderText__1fB3a">그 밖에..</p>
                                        <p class="TeamsCoreValues_subject__12T-5">우리는 여러가지를 시도해 봤어요</p>
                                        <ul class="TeamsCoreValues_description__2e02t">
                                           <li>소셜 상담</li>
                                           <li>소셜 로그인</li>
                                           <li>메일 인증</li>
                                           <li>문자 보내기</li>
                                           <li>구글 OTP - 관리자 페이지</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="TeamsIntroduction_TeamsIntroduction__2Kr6B"><p class="TeamsIntroduction_title__16nLY">
                        Our
                        Teams</p>
                        <div class="TeamsIntroduction_navigatorItems__1yzCs" id="myTab2">
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_unselected__37wkq">
                                <button href="#team1" aria-controls="team1" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">길동영</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_unselected__37wkq">
                                <button href="#team2" aria-controls="team2" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">김도연</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_unselected__37wkq">
                                <button href="#team3" aria-controls="team3" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">김현조</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_selected__37wkq">
                                <button href="#team4" aria-controls="team4" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">이재원</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_unselected__37wkq">
                                <button href="#team5" aria-controls="team5" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">이태한</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                            <div class="self-intro TeamsIntroductionNavigatorItem_navigatorItem__2d6HW TeamsIntroductionNavigatorItem_unselected__37wkq">
                                <button href="#team6" aria-controls="team6" role="tab" data-toggle="tab" class="TeamsIntroductionNavigatorItem_navigatorButton__LJmw7">장민</button>
                                <div class="TeamsIntroductionNavigatorItem_circle__Exbjm"></div>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane" role="tabpanel" id="team1">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/gild.png" alt="">
                                            <p>FullStack Engineer</p>
                                            <a href="https://github.com/kildongyoung" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">길동영</p>
                                        <ul class="TeamsIntroduction_description__3VEMm">
                                            <li>- 문의 게시판 DB 설계</li>
                                            <li>- 문의 게시판 CRUD 기능 구현</li>
                                            <li>- 문의 게시판 UI 디자인</li>
                                            <li>- 스크랩 데이터 가공</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane" role="tabpanel" id="team2">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/dbelle.png" alt="">
                                            <p>FullStack Engineer</p>
                                            <a href="https://github.com/dbelleK" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">김도연</p>
                                        <ul class="TeamsIntroduction_description__3VEMm">
                                            <li>- 스프링 시큐리티 적용 폼 로그인 기능 구현</li>
                                            <li>- 로그인 페이지 디자인</li>
                                            <li>- 소셜(카카오) 로그인 기능 구현</li>
                                            <li>- 소셜(카카오) 화원가입 CRUD 구현</li>
                                            <li>- 이메일로 비밀번호 찾기 구현</li>
                                            <li>- javascript 와 jQuery ajax 이용 유효성 검사 및 중복 검사</li>
                                            <li>- Youtube 웹 크롤링 (Youtube API) </li>
                                            <li>- 스크랩 데이터 가공 </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane" role="tabpanel" id="team3">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/kimh.png" alt="">
                                            <p>FullStack Engineer</p>
                                            <a href="https://github.com/jjojjoming" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">김현조</p>
                                        <ul class="TeamsIntroduction_description__3VEMm">
                                            <li>- 회원 DB 설계</li>
                                            <li>- 회원 가입 및 권한 등록 기능 구현</li>
                                            <li>- 회원 CRUD 기능 구현</li>
                                            <li>- BCryptPasswordEncoder 암호화</li>
                                            <li>- 회원 가입 페이지 디자인</li>
                                            <li>- 주소 API 기능 적용</li>
                                            <li>- javascript 와 jQuery ajax 이용 유효성 검사 및 중복 검사</li>
                                            <li>- 스크랩 데이터 가공</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane active" role="tabpanel" id="team4">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/leej.png" alt="">
                                            <p>CEO</p>
                                            <a href="https://github.com/PatrickJaeWon" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">이재원</p>
                                        <ul class="TeamsIntroduction_description__3VEMm">
                                            <li> - 서비스 기획 및 총괄</li>
                                            <li> - 카피 문구 테이블 설계</li>
                                            <li> - 헤드카피 문구 CRUD 기능 구현</li>
                                            <li> - 세일즈카피 문구 CRUD 기능 구현</li>
                                            <li> - 결제 기능 구현(비대면 결제서비스 페이앱 API)</li>
                                            <li>- javascript 와 jQuery ajax 이용 유효성 검사</li>
                                            <li> - 스크랩 데이터 수집</li>
                                            <li> - 스크랩 데이터 가공</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane" role="tabpanel" id="team5">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/leet.png" alt="">
                                            <p>Data Engineer</p>
                                            <a href="https://github.com/thanlee1216" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">이태한</p>
                                        <ul class="TeamsIntroduction_description__3VEMm">
                                            <li>- DB 테이블 설계</li>
                                            <li>- 마이 페이지 CRUD 기능 구현</li>
                                            <li>- 마이 페이지 디자인</li>
                                            <li>- 내가 검색했던 카피 문구 출력 기능 구현</li>
                                            <li>- 회원탈퇴 기능 구현</li>
                                            <li>- 이메일 인증번호 발송 및 검증 기능 구현</li>
                                            <li>- javascript 와 jQuery ajax 이용 유효성 검사</li>
                                            <li>- 주소 API 기능 적용</li>
                                            <li>- 네이버 파워 링크 웹 크롤링 기능 구현(jsoup)</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="TeamsIntroduction_contentBox__b9Alt tab-pane" role="tabpanel" id="team6">
                                <div style="display: flex">
                                    <div class="TeamsIntroduction_subject__2hMt3">
                                        <div class="text-center">
                                            <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/jm.png" alt="">
                                            <p>CTO</p>
                                            <a href="https://github.com/m-veloper" target="_blank">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="TeamsIntroduction_content__2-64Q">
                                        <p class="TeamsIntroduction_teamName__mnu4f">장민</p>
                                        <div style="display: flex">
                                            <ul class="TeamsIntroduction_description__3VEMm">
                                                <li>- 클라이언트, 어드민 서버 프로젝트 구축 및 세팅</li>
                                                <li>- UI 레이아웃 설계</li>
                                                <li>- Git 버전 및 소스 통합 관리</li>
                                                <li>- AWS 인프라 구축</li>
                                            </ul>
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
</div>
<div class="container-xxxl py-5">
    <div class="container py-5 px-lg-5">
        <div class="wow fadeInUp" data-wow-delay="0.1s">
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/leej.png" alt="">
                        <h5>이재원</h5>
                        <span>CEO</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/PatrickJaeWon" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/jm.png" alt="">
                        <h5>장민</h5>
                        <span>CTO</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/m-veloper" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/leet.png" alt="">
                        <h5>이태한</h5>
                        <span>Data Engineer</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/thanlee1216" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/dbelle.png" alt="">
                        <h5>김도연</h5>
                        <span>FullStack Engineer</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/dbelleK" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/kimh.png" alt="">
                        <br>
                        <br>
                        <h5>김현조</h5>
                        <span>FullStack Engineer</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/jjojjoming" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="team-item bg-light rounded">
                    <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4" src="/resources/img/team/gild.png" alt="">
                        <h5>길동영</h5>
                        <span>FullStack Engineer</span>
                    </div>
                    <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href="https://github.com/kildongyoung" target="_blank"><i class="fa-brands fa-github"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%--<script src="/resources/js/team.js"></script>--%>

<script>
  $(function () {
    $('#myTab button:nth-child(5)').tab('show')
    // $('#myTab2 button:first').tab('show')

    $('.skill-btn').click(function(e){
      $('.skill-btn').removeClass('active');
      $(this).addClass('active');
    });

    $('.self-intro').click(function(e){

      $('.self-intro').removeClass('TeamsIntroductionNavigatorItem_selected__37wkq');
      $('.self-intro').addClass('TeamsIntroductionNavigatorItem_unselected__37wkq');

      $(this).removeClass('TeamsIntroductionNavigatorItem_unselected__37wkq');
      $(this).addClass('TeamsIntroductionNavigatorItem_selected__37wkq');
    });
  })
</script>
