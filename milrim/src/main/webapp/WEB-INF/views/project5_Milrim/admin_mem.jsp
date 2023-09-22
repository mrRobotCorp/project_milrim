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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
    <link href="./css/header.css" rel="stylesheet">
    <link href="./css/admin.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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
                    <span >${userInfo.name}</span>
                </div>
                <div class="adminAll">
                    <img class="profImg" src="./source/apple-icon-180x180.png">
                    <span>${userInfo.name}</span>
                </div>
                <ul class="mpList">
                    <li>
                        <img class="profImg" src="./source/none.png">
                        <span>유저 이름</span>
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

    <section class="memSection" id="users">
        <div class="memSchBox schBox search">
            <button type="button" id="schMemBtn"></button>
            <input type="text" placeholder="밀림의 회원 검색" id="schMem" value=""><!-- name="adm_memSch" -->
        </div>

        <form method="post" class="listBox" id="test-list">
<!--        <span>
                <input type="checkbox" name="memOne" id="allCh">
                <label for="allCh">전체 선택</label>
            </span> -->
            <!-- 
                <button type="button" class="uptBtn">수정</button>
            -->
            <div class="dBtn">
                <button type="button" class="delBtn">삭제</button>
            </div>

            <ul class="listHead mem">
                <li id="asdf">회원 ID</li>
                <li>비밀번호</li>
                <li>이름</li>
                <li>이메일</li>
                <li>전화번호</li>
                <li>권한</li>
            </ul>
<!--  
        var options = {
            valueNames: ['memCheck', 'memId', 'memPw', 'name', 'emailAdr', 'pNumber', 'author'],
            page: 9,
            pagination: true
        };
        var userList = new List('users', options);
-->
            <ul class="listAll list" v-for="(member,idx) in displayedMembers" :key="member.id">
                <li>
                    <ul class="listRow">
                        <span class="memCheck">
                        <input type="checkbox" name="memOne" :id="'mem' + (idx + 1)" :value="member.id" 
                        		v-model="selectedItems" @change="handleCheckboxChange">
        				<label :for="'mem' + (idx + 1)"></label>
                        </span>
                        <div class="memberInfo">
                            <li class="memId">{{member.id}}</li>
                            <li class="memPw">{{ member.pass}}</li>
                            <li class="name">{{ member.name}}</li>
                            <li class="emailAdr">{{ member.email }}</li>
                            <li class="pNumber">{{ member.phonenumber }}</li>
                            <li class="author">{{ member.auth }}</li>
                        </div>
                    </ul>
                </li>
            </ul>
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
    
                    <h4>회원 정보 수정</h4>
                    <form method="post" class="uptFrm">
                        <div class="uptRow">
                            <span class="uptSub">회원 ID</span>
                            <input type="text" name="uptId" placeholder="memId">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">비밀번호</span>
                            <input type="text" name="uptPw" placeholder="memPw">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">이름</span>
                            <input type="text" name="uptName" placeholder="name">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">이메일</span>
                            <input type="text" name="uptEmail" placeholder="emailAdr">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">전화번호</span>
                            <input type="text" name="uptNumber" placeholder="pNumber">
                        </div>
                        <div class="uptRow">
                            <span class="uptSub">권한</span>
                            <input type="text" name="uptAuth" placeholder="author">
                        </div>
                    </form>
                </div>
                <button type="button" class="modalUpt">수정</button>
                
            </div>
            
         -->

    </section>
    <script>
    
    const myProfile = document.querySelector(".myProfile");
    const mpList = document.querySelector(".mpList");


    myProfile.addEventListener("mouseover", function() {
        mpList.classList.add("active");
    });

    myProfile.addEventListener("mouseleave", function() {
        mpList.classList.remove("active");
    });

    mpList.addEventListener("mouseover", function() {
        mpList.classList.add("active");
    });

    mpList.addEventListener("mouseleave", function() {
        mpList.classList.remove("active");
    });

    // -------------------------------------
    const mypageAll = document.querySelector(".mypageAll");
    const adminAll = document.querySelector(".adminAll");
    const loc = window.location.href;

    if(loc.includes("home")) {
        mypageAll.style.display = "none";
    }

    if(loc.includes("admin")) {
        adminAll.style.display = "flex";
        myProfile.style.display = "none";
    }
    </script>
    <script src="${path}/js/materialize.js"></script>
    <script type="text/javascript">
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

    // --------------- 전체 선택 ----------------------
 /*    console.log("check1");
    function allCh() {
	    const allCh = document.querySelector("#allCh");
	    const memChBox = document.getElementsByName('memOne');
	
	    function selectAll(selectAll) {
	        memChBox.forEach((e) => {
	            e.checked = selectAll.checked;
	        });
	
	    }
	
	    allCh.onclick = function () {
	        selectAll(this);
	    }
	    console.log("allch");
    }
    
    
    function listJs() {
        var options = {
            valueNames: ['memCheck', 'memId', 'memPw', 'name', 'emailAdr', 'pNumber', 'author'],
            page: 9,
            pagination: true
        };

        var userList = new List('users', options);
    console.log("check2");
    	
    }  */
    </script>
<!-- 기존 코드 (일부 생략) -->

<script type="text/javascript">
    var vm = new Vue({
        el: ".memSection",
        data: {
            jsonData: [], // 초기 데이터 설정
            selectedItems: [],
            currentPage: 1, // 현재 페이지 번호
            itemsPerPage: 9, // 한 페이지당 항목 수
        },
        computed: {
            // 현재 페이지에 해당하는 데이터만 계산하여 반환하는 computed 속성
            displayedMembers: function() {
                var startIndex = (this.currentPage - 1) * this.itemsPerPage;
                var endIndex = startIndex + this.itemsPerPage;
                return this.jsonData.slice(startIndex, endIndex);
            },
        },
        methods: {
            reMemJson: function() {
                // AJAX 요청을 이용하여 데이터 가져오기
                $.ajax({
                    url: "${path}/admin_mem_List.do",
                    type: "post",
                    data: { id: $("#schMem").val() }, // Pass data as an object
                    dataType: "json",
                    success: function(mlist) {
                        console.log(mlist);
                        vm.jsonData = mlist; // jsonData 업데이트
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
                var totalPages = Math.ceil(this.jsonData.length / this.itemsPerPage);
                if (this.currentPage < totalPages) {
                    this.currentPage += 1;
                }
            },
        },
        created: function() {
            // 페이지가 로드되면 데이터를 가져오도록 초기 실행
            this.reMemJson();

        }
        
    });

    // 버튼 클릭 시 데이터를 다시 가져오도록 설정
    $("#schMemBtn").click(function() {
        vm.reMemJson();
    });
    $(".delBtn").click(function(){
    	delOk()
 	    $.when(delOk())
		    .done(function(ok) {
		        // response1과 response2는 각각 AJAX 요청의 결과를 나타냄
		        // 이곳에서 모든 AJAX 요청이 성공적으로 완료된 후 수행할 동작을 작성
		       	vm.reMemJson();
		    })
		    .fail(function(err) {
		        // AJAX 요청 중 하나라도 실패한 경우에 수행할 동작을 작성
		        alert("하나 이상의 AJAX 요청이 실패했습니다.");
		    });
 
    })
$("#schMem").keyup(function(event) {
    if (event.keyCode == 13) {
        vm.reMemJson();
    }
});
    function delOk(){
    	for(var i=0;i<vm.selectedItems.length;i++){
    		console.log(i+": "+vm.selectedItems[i])
    		$.ajax({
                url: "${path}/admin_mem_Del.do",
                type: "post",
                data: { id: vm.selectedItems[i] }, // Pass data as an object
                dataType:"text",
                success: function(ok) {
                	console.log(ok);
                },
                error: function(err) {
                    console.log(err);
              }
            });
    		}
    	}

</script>



</body>

</html>


