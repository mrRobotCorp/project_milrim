<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="./css/community.css">

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
                <li><a href="#">밀림의 숲</a></li>
            </ul>
            <div class="mypageAll">
					<a href='./writePost.do' class="wBtn">
					    <button type="button" class="writeBtn"></button>
					</a>
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
    <section class="postSection">
	<!-- 게시글 검색 -->
	<form action="community.do" method="get" class="postSchBox">
		    <input type="text" class="postSch" name="title" placeholder="게시글 제목으로 검색해보세요.">
		    <button type="submit"></button>
	</form>

        
        
        <c:forEach var="post" items="${postList}">
	        <article class="postAll" data-post-id="${post.postId}">
	            <div class="postTop">
	                <div class="postTitle">
	                    <h4>${post.title}</h4>
	                    <div class="postMore">
	                        <span></span>
	                        <span></span>
	                        <span></span>
	                    </div>
						<ul class="moreList">
						    <li class="copy">공유하기</li>
						    <li class="hide">숨기기</li>
						    <li>수정</li>
						    <li onclick="deletePost(this)">삭제</li>
						</ul>
	                </div>
	                <div class="postUserInfo">
	                    <img src="./source/none.png" class="postUserImg">
	                    <div class="postUserTxt">
	                        <span>${post.name}</span>
	                        <span class="puId">@${post.id}</span>
	                        <p>${post.fbDate}</p>
	                    </div>
	                </div>
	            </div>
	            <!-- 게시글 내용 -->
	            <div class="pContent">
	                <p>
	                   ${post.content}
	                </p>
	            </div>
	            <div class="postBottom">
	                <div class="postBtnAll">
	                    <button class="cmmtBtn" data-post-id="${post.postId}">
	                        <div>
	                            <img class="cmmtImg" src="./source/cmmtIco.png">
	                        </div>
	                    </button>
	                    <button class="likeBtn">
	                        <div class="like"></div>
	                    </button>
	                </div>
	            </div>
	            <!-- 게시글 상세 - 댓글 -->
	            <div class="disCommt">
	                
	            </div>
	        </article>
         </c:forEach>

        <button class="morePost">
            <span class="circle">
                <span class="icon arrow"></span>
            </span>
            <span class="moreTxt">더 불러오기</span>
        </button>
    </section>

    <footer>
        <div id="scrollTop">
            <span class="blind">맨 위로 가기</span>
            <div class="topTxt">Top</div>
        </div>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>

    <script src="./js/header.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="./js/community.js"></script>

</body>
</html>