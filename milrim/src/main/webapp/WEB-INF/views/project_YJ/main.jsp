<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
	<c:set var="path" 
			value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
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
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" type="text/css" href="./css/slick.css" />
    <link rel="stylesheet" type="text/css" href="./css/slick_theme.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
console.log("${userInfo}")
console.log("${userInfo.id}")
console.log("${userInfo.name}")
console.log("${userInfo.auth}")
console.log("${memSh}")

var id = "${userInfo.id}";
var name = "${userInfo.name}";
var auth = "${userInfo.auth}";
console.log(id)
$(document).ready(function (){
	
	if(id == ""){
		alert("로그인페이지로 이동합니다~")
		location.href="${path}/login.do";
	}
	
	if(auth != "admin"){
		console.log("111")
		$(".abminBtn").hide()
	}
	$(".abminBtn").click(function(){
		location.href="${path}/admin_mem.do";
	})
	
})
</script> 
<body>
    <header>
        <nav>
            <ul class="gnb">
                <li>
                    <a href="/milrim/main02.do"><img class="headLogo" src="./source/logo_noBg_b.png"></a>
                </li>
                <li><a href="/milrim/community.do" onclick="search()">밀림의 숲</a></li>

            </ul>
            <div class="navRight">
                <button class="abminBtn">관리자</button>
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
            </div>
        </nav>
    </header>

	<section class="banner">
	        <h3 class="blind">밀림 애니메이션 배너</h3>
	        <div class="slider">
	            <div class="bn01 bn">
	                <div class="bContent01 bContent ">
	                    <img src="./source/banner_title01.png">
	                </div>
	            </div>
	            <div class="bn02 bn">
	                <div class="bContent02 bContent ">
	                    <img src="./source/banner_title02.png">
	                </div>
	            </div>
	            <div class="bn03 bn">
	                <div class="bContent03 bContent ">
	                    <img src="./source/banner_title03.png">
	                </div>
	            </div>
	            <div class="bn04 bn">
	                <div class="bContent04 bContent ">
	                    <img src="./source/banner_title04.png">
	                </div>
	            </div>
	            <div class="bn05 bn">
	                <div class="bContent05 bContent ">
	                    <img src="./source/banner_title05.png">
	                </div>
	            </div>
	        </div>
	    </section>

    <section class="inner">
        <h3 class="blind">작품 검색</h3>
        <form class="textSch" action="" method="" data-aos="fade-up" data-aos-duration="600">
            <input type="text"  id="title" name="title" placeholder="제목을 입력하세요">
            <button type="button" id="schBtn" ></button>
        </form>

        <form class="tagSch" action="" method="" data-aos="fade-up" data-aos-duration="900">
            <input name="tag" type="radio" id="tag1" value="SF">
            <label for="tag1">SF</label>
            <input name="tag" type="radio" id="tag2" value="공포">
            <label for="tag2">공포</label>
            <input name="tag" type="radio" id="tag3" value="드라마">
            <label for="tag3">드라마</label>
            <input name="tag" type="radio" id="tag4" value="미스터리">
            <label for="tag4">미스터리</label>
            <input name="tag" type="radio" id="tag5" value="로맨스">
            <label for="tag5">로맨스</label>
            <input name="tag" type="radio" id="tag6" value="스릴러">
            <label for="tag6">스릴러</label>
            <input name="tag" type="radio" id="tag7" value="액션">
            <label for="tag7">액션</label>
            <input name="tag" type="radio" id="tag8" value="코미디">
            <label for="tag8">코미디</label>
            <input name="tag" type="radio" id="tag9" value="판타지">
            <label for="tag9">판타지</label>
        </form>

        <div class="dayListAll" data-aos="fade-up" data-aos-duration="1300">
            <div class="dayList listMon" >
                <h4>월요일</h4>
                <ul id="listMON">

                </ul>
            </div>
            <div class="dayList listTue">
                <h4>화요일</h4>
                <ul id="listTUE">
                    
                </ul>
            </div>
            <div class="dayList listWed">
                <h4>수요일</h4>
                <ul id="listWED">
                    
                </ul>
            </div>
            <div class="dayList listThu">
                <h4>목요일</h4>
                <ul id="listTHU">

                </ul>
            </div>
            <div class="dayList listFri">
                <h4>금요일</h4>
                <ul id="listFRI">

                </ul>
            </div>
            <div class="dayList listSat">
                <h4>토요일</h4>
                <ul id="listSAT">

                </ul>
            </div>
            <div class="dayList listSun">
                <h4>일요일</h4>
                <ul id="listSUN">

                </ul>
            </div>
        </div>
    </section>

    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="./js/slick.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/main.js"></script>
</body>

</html>