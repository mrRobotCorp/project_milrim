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
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
    <link href="./css/header.css" rel="stylesheet">
    <link href="./css/admin.css" rel="stylesheet">

</head>

<body>
    <header>
        <nav>
            <ul class="gnb">
                <li>
                    <a href="/milrim/main02.do"><img class="headLogo" src="./source/logo_noBg_b.png"></a>
                </li>
            </ul>
            <div class="mypageAll">
                <div class="myProfile">
                    <img class="profImg" src="./source/none.png">
                    <span>${userInfo.name}</span>
                </div>
                <div class="adminAll">
                    <img class="profImg" src="./source/apple-icon-180x180.png">
                    <span>밀림 관리자</span>
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
    <div class="sidebar">
        <ul class="nav">
            <li><a href="${path}/admin_mem.do"><img src="./source/memIco.png"> 회원 조회</a></li>
            <li><a href="${path}/admin_vid.do"><img src="./source/vidIco.png"> 영상 조회</a></li>
            <li><a href="${path}/admin_pst.do"><img src="./source/pstIco.png"> 게시물 조회</a></li>
        </ul>
    </div>

    <section class="pstSection" id="posts">
        <div class="memSchBox schBox search">
            <button type="button" id="schPostBtn"></button>
            <input name="adm_pstSch" placeholder="게시글 제목을 검색" value="" id="schPost">
        </div>

        <form method="post" class="listBox" id="test-list">
<!--        <span>
                <input type="checkbox" name="pstOne" id="allCh">
                <label for="allCh">전체 선택</label>
            </span> -->
            <!-- 
                <button type="button" class="uptBtn">수정</button>
            -->
			<div class="dBtn">
                <button type="button" class="delBtn">삭제</button>
            </div>
            <ul class="listHead pst">
                <li>글 제목</li>
                <li>작성일</li>
                <li>회원 ID</li>
            </ul>

            <ul class="listAll list" v-for="(post, idx) in displayedPosts" :key="post.postid">
                <li>
                    <ul class="listRow">
                        <span class="pstCheck">
                            <input type="checkbox" name="pstOne" :id="'pst' + (idx + 1)" :value="post.postid"
                            v-model="selectedItems" @change="handleCheckboxChange">
                            <label :for="'pst' + (idx + 1)"></label>
                        </span>
                        <div class="pstInfo">
                            <li class="pstTitle">{{post.title}}</li>
                            <li class="pstDate">{{post.fbdate}}</li>
                            <li class="pstMem">{{post.id}}</li>
                        </div>
                    </ul>
                </li>

            </ul>
            <ul class="pagination"></ul>
        </form>
        <div class="pagination">
		    <button class="pBtn prevBtn" @click="prevPage"></button>
		    <span>{{ currentPage }}</span>
		    <button class="pBtn nextBtn" @click="nextPage"></button>
		</div>
        <!-- -------- 모달창 ------------ -->
        <!--

            <div id="modal1" class="modal">
                <div class="modalCon">
                    <button type="button" class="modal-close"></button>
    
                    <h4>게시물 정보 수정</h4>
                    <form method="post" class="uptFrm">
                        <div class="uptRow">
                            <span class="uptSub">글 제목</span>
                            <input type="text" name="uptTitle" placeholder="게시글의 제목 입력">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">작성일</span>
                            <input type="text" name="uptDate" placeholder="작성일 입력">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">회원 ID</span>
                            <input type="text" name="uptMem" placeholder="회원의 ID 입력">
                        </div>
                    </form>
                </div>
                <button type="button" class="modalUpt">수정</button>
            </div>
        -->
    </section>
    <script src="./js/header.js"></script>
    <script src="./js/materialize.js"></script>
    <script>
	 // -------------------- 사이드 탭 --------------------------
	    const tabs = document.querySelectorAll(".nav li");
	    const href = window.location.href;
	
	    if (href.includes("mem")) {
	        tabs[0].classList.add("active");
	        tabs[1].classList.remove("active");
	        tabs[2].classList.remove("active");
	    } else if (href.includes("vid")) {
	        tabs[0].classList.remove("active");
	        tabs[1].classList.add("active");
	        tabs[2].classList.remove("active");
	    } else {
	        tabs[0].classList.remove("active");
	        tabs[1].classList.remove("active");
	        tabs[2].classList.add("active");
	    }
    </script>
    <script>
        var vm = new Vue({
            el: ".pstSection",
            data: {
                jsonPost: [], // 초기 데이터 설정
                jsonPostNum: [], // 초기 데이터 설정
                selectedItems: [],
                currentPage: 1, // 현재 페이지 번호
                itemsPerPage: 9, // 한 페이지당 항목 수
            },
            computed: {
                // 현재 페이지에 해당하는 데이터만 계산하여 반환하는 computed 속성
                displayedPosts: function() {
                    var startIndex = (this.currentPage - 1) * this.itemsPerPage;
                    var endIndex = startIndex + this.itemsPerPage;
                    return this.jsonPost.slice(startIndex, endIndex);
                },
            },
            methods: {
                rePostJson: function() {
                    // AJAX 요청을 이용하여 데이터 가져오기
                    $.ajax({
                        url: "${path}/admin_pst_List.do",
                        type: "post",
                        data: "title=" + $("#schPost").val(),
                        dataType: "json",
                        success: function(plist) {
                            console.log(plist);
                            vm.jsonPost = plist; // jsonData 업데이트
                        },
                        error: function(err) {
                            console.log(err);
                        }
                    });
                },
                handleCheckboxChange: function() {
                    console.log('선택된 아이템 ID:', this.selectedItems);
                },
                prevPage: function() {
                    if (this.currentPage > 1) {
                        this.currentPage -= 1;
                    }
                },
                nextPage: function() {
                    var totalPages = Math.ceil(this.jsonPost.length / this.itemsPerPage);
                    if (this.currentPage < totalPages) {
                        this.currentPage += 1;
                    }
                },
            },
            created: function() {
                // 페이지가 로드되면 데이터를 가져오도록 초기 실행
                this.rePostJson();
            }
        });

        // 버튼 클릭 시 데이터를 다시 가져오도록 설정
        $("#schPostBtn").click(function() {
            vm.rePostJson();
        });
        $("#schPost").keyup(function(key){
        	if(key.keyCode ===13){
        		vm.rePostJson();
        	}
        })
        document.addEventListener('DOMContentLoaded', function() {
        $(".delBtn").click(function() {
            delOk(); // 먼저 삭제 함수 호출
            $.when(delOk())
                .done(function(ok) {
                    // 모든 AJAX 요청이 성공적으로 완료된 후 수행할 동작을 작성
                    vm.rePostJson();
                })
                .fail(function(err) {
                    // AJAX 요청 중 하나라도 실패한 경우에 수행할 동작을 작성
                    alert("하나 이상의 AJAX 요청이 실패했습니다.");
                });
        });
        function delOk() {
            for (var i = 0; i < vm.selectedItems.length; i++) {
                console.log(i + ": " + vm.selectedItems[i]);
                $.ajax({
                    url: "${path}/admin_pst_Del.do",
                    type: "post",
                    data: { postid: vm.selectedItems[i] }, // Pass data as an object
                    dataType: "text",
                    success: function(ok) {
                    	console.log(ok);
                    },
                    error: function(err) {
                        console.log(err);
                    }
                });
            }
        }
        });
    </script>

</body>

</html>