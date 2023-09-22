<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:title" content="project5 Milrim">
    <meta property="og:url" content="https://mrrobotcorp.github.io/project5_Milrim/">
    <meta property="og:image" content="https://mrrobotcorp.github.io/project5_Milrim//source/thumbnail.png">
    <meta property="og:description" content="4조 프로젝트 사이트 - Milrim">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="project5 Milrim">
    <meta name="twitter:url" content="https://mrrobotcorp.github.io/project5_Milrim/">
    <meta name="twitter:image" content="https://mrrobotcorp.github.io/project5_Milrim//source/thumbnail.png">
    <meta name="twitter:description" content="4조 프로젝트 사이트 - Milrim">
    <meta name="description" content="4조 프로젝트 사이트 - Milrim">
    <meta name='keywords' content='project, milrim, toy project, community, ott service'>

    <link rel="icon" href="./source/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="./source/apple-icon-180x180.png" sizes="180x180">
    <title>Milrim | 밀림</title>
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/membership.css">
   	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {
    // 클릭 이벤트를 처리합니다.
	var id = "${userInfo.id}";
	var name = "${userInfo.name}";
	var auth = "${userInfo.auth}";
console.log("${memSh}")
	/* if(id == ""){
		alert("로그인페이지로 이동합니다~")
		location.href="${path}/login.do";
	} */
    $("#getCardValues").click(function() {
        var cardNum1 = $("input[name='cardNum1']").val();
        var cardNum2 = $("input[name='cardNum2']").val();
        var cardNum3 = $("input[name='cardNum3']").val();
        var cardNum4 = $("input[name='cardNum4']").val();
        var combinedValue = cardNum1 + cardNum2 + cardNum3 + cardNum4;
        $.ajax({
            url: "${path}/insCard.do?",
            type: "get",
            data:"id="+id+"&cardNum="+combinedValue+"&mmyy="+$("#dateInput").val()+"&bday="+$("#birthInput").val()+"&cardPass="+$("#cardPass").val(),
            dataType: "text",
            success: function(ins) {
				if(ins=="Y"){
            	console.log(ins)
	                const inputsFilled = checkInputValues();
	                const lastCheckbox = document.querySelector('.cardAgree input[type="checkbox"]');

	                var easyPay = document.querySelector('.easyPay');
	                easyPay.classList.add('active');

	                var easyBtn = document.querySelector('.easyPay button');
	                easyBtn.style.display='none';
	                var easySpan = document.querySelector('.easyPay span');
	                easySpan.style.display='none';
	                
	                if (inputsFilled && lastCheckbox.checked) {
	                    openPayModal();
	                  } else {
	                    alert('가격 및 유의사항을 확인하였으며, 매월 정기결제에 동의해주세요.');
	                  }
				}
            },
            error: function(err) {
                console.log(err);
          }
    	});
	});
    
    $("#lastBtn").click(function(){
    	$.ajax({
            url: "${path}/insMemship.do?",
            type: "get",
            data:"id="+id,
            dataType: "text",
            success: function(ys) {
            	console.log("${memSh1}")
				if(ys=="Y"){
					alert("밀림 멤버가되신걸 환영합니다 ^__^")	
					location.href="${path}/main02.do";
				}
            },
            error: function(err) {
                console.log(err);
          	}
    	})
    })
    

    
    
    
});


</script>
<body>
    <header>
        <nav>
            <ul class="gnb">
                <li>
                    <a href="/milrim/main02.do"><img class="headLogo" src="./source/logo_noBg_b.png"></a>
                </li>
                <li><a href="/milrim/community.do">밀림의 숲</a></li>
            </ul>
            <div class="mypageAll">
                <div class="myProfile">
                    <img class="profImg" src="./source/none.png">
                    <span>${userInfo.name}</span>
                </div>
                <ul class="mpList">
                    <li>
                        <img class="profImg" src="./source/none.png">
                        <span>${userInfo.name}</span>
                    </li>
                    <li>
                        <a href="/milrim/mypage.do">프로필 관리</a>
                    </li>
                    <li>
                        <a href="/milrim/mypage.do">보관함</a>
                    </li>
                    <li>
                        <a href="/milrim/mypage.do">설정</a>
                    </li>
                    <li>
                        <a href="/milrim/logout.do">로그아웃</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <section class="mem">
            <video class="memvideo" autoplay muted loop src="./source/membership_video.mp4" type="video/mp4">
            </video>
            <div class="memshipWrap">
                <div class="memshipInner">
                    <h1>다양한 애니메이션을 즐기고 <br>
                        밀림의 숲 커뮤니티로 소통하는 새로운 플랫폼</h1>
                    <input type="button" value="멤버십 시작하기" onclick="openPay()">
                </div>
            </div>


        <!-- --- 멤버십 결제 모달창 --- -->
        <div class="payModal">
            <div class="payWrap">
                <div class="payInner">
                    <div class="cencel">
                        <h1>멤버십 결제</h1>
                        <button  onclick="cancel()"></button>
                    </div>
                    <p>언제든 해지 가능!</p>
                    <div class="payInfo">
                        <h2>밀림의 타잔</h2>
                        <p>광고 없이 감상, 프로필 1인 · 동시재생 1회선, 최신화 시청,
                            다운로드 지원, FHD화질 지원, TV 앱 지원, 밀림의 숲 이용 가능</p>
                    </div>
                    <div class="payTot">
                        <h3>정기 결제(매월)</h3>
                        <h2>월 9,900원</h2>
                    </div>
                    <div class="pLine"></div>
                    <h2>결제 수단</h2>
                    <div class="payFor">
                        <label class="payRadioBtn">
                            <input type="radio" name="selectPay" id="firstSelect" onclick="firstpay()">
                            <span>간편 결제</span>
                        </label>
                        <div class="easyInner">
                        <div class="easyPay" onclick="easyPay()">
                            <button> </button>
                            <span>간편 결제 추가</span>
                        </div>
                        </div>
                        <label class="payRadioBtn">
                            <input type="radio" name="selectPay" id="secondSelect" onclick="secondpay()">
                            <span>다른 결제 수단</span>
                        </label>

                        <div class="otherPay">                      
                                <input type="radio" name="another" id="kakao">
                                <label for="kakao">
                                    <img src="./source/kakao.png" alt="">
                                    카카오 페이
                                </label>

                                <input type="radio" name="another" id="toss">
                                <label for="toss">
                                    <img src="./source/toss.png" alt="">
                                    토스 페이
                                </label>
      
                                <input type="radio" name="another" id="phone">
                                <label for="phone">
                                    <img src="./source/phone.png" alt="">
                                    휴대폰
                                </label>
                       
                        </div>
                    </div>
                    <div class="pLine"></div>
                    <div class="coment">
                        <p>
                            구매안내<br>
                            - 결제 금액은 부가세(VAT)가 포함된 가격입니다. <br>
                            - 멤버십은 구매한 시점부터 바로 적용됩니다. <br>
                            - 매월 정기 결제일에 자동으로 결제됩니다.<br>
                            - 멤버십은 언제든 해지할 수 있으며 해지해도 결제 만료일까지 사용 가능합니다.<br>
                            - 쿠폰, 분분 무료 혜택과 중복으로 이용할 수 없으며 무료 혜택 도중 멤버십을 구매할 경우 <br>
                            남은 이용 기간은 사라지고 재사용할 수 없습니다.<br>
                            - 미성년 회원의 결제는 원칙적으로 법정대리인의 명의 또는 동의를 받고 이루어져야 하고, <br>
                            법정대리인은 본인 동의 없이 체결된 자녀(미성년자)의 계약을 취소할 수 있습니다.
                        </p>
                        <p>
                            이용 안내 <br>
                            - 영상은 스트리밍으로 제공되며 해외에서는 이용할 수 없습니다.<br>
                            - 멤버십에는 청소년 관람 불가 작품이 일부 포함되어 있습니다.<br>
                            - 저작권자의 요청에 따라 멤버십에 제외되는 작품이 있을 수 있습니다.<br>
                            - 지원하는 TV에 대한 자세한 내용은 이곳에서 확인하실 수 있습니다.
                        </p>
                        <p>
                            환불 안내<br>
                            - 환불은 멤버십 해당 작품을 재생하지 않은 경우 결제 후 7일 이내 가능합니다.<br>
                            - 멤버십 사용 중에는 남은 기간에 대한 금액이 환불되지 않습니다.
                        </p>
                        <p>
                            기타 <br>
                            - 기타 문의 사항은 MY의 고객센터에서 1:1 문의 부탁드립니다.
                        </p>
                    </div>
                    <div class="last">
                        <label class="agreeck">
                            <input type="checkbox" name="" id="">
                            <span>가격 및 유의사항을 확인하였으며, 매월 정기결제에 동의합니다.</span>
                        </label>
                        <form>
                        <button class="subm" id="lastBtn" type="button">
                            <span class="cardReMem">9,900원 결제하기</span>
                        </button>
                        </form>
                    </div>

                </div>
                </div>
           </div>
           <div class="cardReg">
                <div class="cardWrap">
                    <div class="payInner card">
                        <div class="cardTop">
                            <button  onclick="prev()"></button>
                            <h1>간편 결제 등록</h1>
                            <button  onclick="cancel2()"></button>    
                        </div>
                        <h3>카드 정보 입력</h3>
                        <div class="cardInfo">
                            <p>카드 번호</p>
	                            <div class="cardInput">
	                                <label>
	                                    <input type="tel" name="cardNum1" class="showNum" name="cardNum1"
	                                    placeholder="0000"  onfocus="this.placeholder=''" value=""
	                                    onblur="this.placeholder='0000'"size="10"  maxlength="4">
	                                </label>
	                                <div class="flDsCt"></div>
	                                <label>
	                                    <input type="password" name="cardNum2" class="showNum" name="cardNum2"
	                                    placeholder="0000"  onfocus="this.placeholder=''" value=""
	                                    onblur="this.placeholder='0000'"size="10"  maxlength="4">
	                                </label>
	                                <div class="flDsCt"></div>
	                                <label>
	                                    <input type="password" name="cardNum3" class="showNum" name="cardNum3"
	                                    placeholder="0000"  onfocus="this.placeholder=''" value=""
	                                    onblur="this.placeholder='0000'"size="10"  maxlength="4">
	                                </label>
	                                <div class="flDsCt"></div>
	                                <label>
	                                    <input type="tel" name="cardNum4" class="showNum" name="cardNum4"
	                                    placeholder="0000"  onfocus="this.placeholder=''" value=""
	                                    onblur="this.placeholder='0000'"size="10"  maxlength="4">
	                                </label>
	                            </div>
                            <div class="cardDeepInfo">
                                    <label for="dateInput">
                                        <p>유효기간</p>
                                        <input type="tel"value="" id="dateInput" oninput="formatDate()"
                                        placeholder="MM/YY"  onfocus="this.placeholder=''" name="mmyy"
                                        onblur="this.placeholder='MM/YY'"  maxlength="4">
                                    </label>
                                    <label for="birthInput">
                                        <p>생년월일</p>
                                        <input type="number" name="bday" id="birthInput" 
                                        placeholder="YYMMDD(6자리)"  onfocus="this.placeholder=''" 
                                        onblur="this.placeholder='YYMMDD(6자리)'" maxlength="6">
                                    </label>
                            </div>
                            <div class="cardPwd">
                                <label for="">
                                    <p>카드 비밀번호</p>
                                    <input type="password" name="cardPass" id="cardPass"
                                    placeholder="비밀번호 앞 2자리"  onfocus="this.placeholder=''" 
                                    onblur="this.placeholder='비밀번호 앞 2자리'" maxlength="2">
                                </label>
                            </div> 
                            </div>
                            <div class="cardAgree">
                                <label for="">
                                    <input type="checkbox" name="" id="">
                                    <span>결제사 정보 제공에 동의합니다.</span>
                                </label>
                                <button class="BbRMj" id="getCardValues" onclick="movePage()">
                                    <span class="cardReMem">등록하기</span>
                                </button>
                                <script type="text/javascript">

                                </script>
                        </div>
                    </div>
                </div>               
           </div>
    </section>

    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>


    <script src="./js/header.js"></script>
    <script src="./js/mem.js"></script>


</body>

</html>