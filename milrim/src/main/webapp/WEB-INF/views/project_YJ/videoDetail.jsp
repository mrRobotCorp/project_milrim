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
    <link rel="stylesheet" href="./css/plyr.css" />
    <link rel="stylesheet" href="./css/videoDetail.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<script type="text/javascript">
console.log("${userInfo}")
console.log("${userInfo.id}")
console.log("${userInfo.name}")
console.log("${userInfo.auth}")
var id = "${userInfo.id}";
var name = "${userInfo.name}";
var auth = "${userInfo.auth}";
console.log(id)

if(id == ""){
	alert("로그인페이지로 이동합니다~")
	location.href="${path}/login.do";
}
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

    <main>
        <div class="playContent">
		<video controls crossorigin playsinline poster="" id="player"> 
		    <source src="" type="video/mp4">
		</video>
        </div>
        <div class="videoInfo inner">
            <div class="vidTitle">
                <span>
                    <span id="videoTitle">회차제목</span>
                    <span class="starBtn"></span>
                </span>
                <div>
                    <img class="shareBtn" src="./source/shareIco.png">
                </div>
            </div>
            <div class="vidBottom">
                <p class="plot" id="videoSynopsis">줄거리</p>
                
				<c:forEach var="tagList" items="${tagLists}">
	                <span class="tag"># ${tagList.tagName}</span>
				</c:forEach>
            </div>
        </div> 
    </main>

    <section class="episode inner">
        <h3 class="blind">회차 정보</h3>
        <h4>총 ${videoDetails.size()}개의 에피소드</h4>
        <div class="epAll">
		<c:forEach var="video" items="${videoDetails}">
		    <div class="ep" data-videoId="${video.videoId}" data-title="${video.title}" data-synopsis="${video.synopsis}" data-video="${video.video}" data-image="${video.image}">
		        <div class="epThumb">
		            <img src="./source/images/${video.image}.jpg">
		        </div>
		        <span>${video.title}</span>
		    </div>
		</c:forEach>
        </div>
    </section>

    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>

    <script src="./js/header.js"></script>
    <script src="https://cdn.plyr.io/3.7.8/plyr.js"></script>
    <script src="./js/videoDetail.js"></script>
</body>

</html>