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
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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

    <section class="vidSection" id="videos">
        <form method="post" class="memSchBox schBox search">
            <button type="button"></button>
            <input name="adm_vidSch" placeholder="작품의 제목을 검색">
        </form>

        <form method="post" class="listBox" id="test-list">
            <span>
                <input type="checkbox" name="vidOne" id="allCh">
                <label for="allCh">업로드</label>
            </span>
            <button type="button" class="uptBtn">수정</button>
            <button type="button" class="delBtn">삭제</button>

            <ul class="listHead vid">
                <li>영상 제목</li>
                <li>영상 ID</li>
                <li>업로드일</li>
            </ul>

            <ul class="listAll list" v-for="(post, idx) in displayedPosts" :key="post.postid">
                <li>
                    <ul class="listRow" ondblclick="listMd()">
						<span class="vidCheck">
						  <input type="checkbox" :id="'pst' + (idx + 1)" :value="post.postid" v-model="selectedItems" 
						  	@change="handleCheckboxChange(post.postid)">
						  <label :for="'pst' + (idx + 1)"></label>
						</span>
                        <div class="vidInfo">
                            <li class="vidTitle">
                                <img :src="'./source/images/' + post.image + '.jpg'"> 
                                <div class="vtTxt">
                                    <p>{{post.title}}</p>
                                    <p>{{post.voList.length}} 회차</p>
                                </div>
                            </li>
                            <li class="vidId">{{post.videoid}}</li>
                            <li class="upload">2023-08-03</li>
                        </div>
                     <button type="button" class="epShowBtn" @click="toggleEpList( idx )" ><!--  -->
                         <img src="./source/arrow_d.png">
                     </button>
                    </ul>
                    
                    <div class="epListAll" v-show="post.showEpList">
                        <ul class="epList" >
                            <li v-for="(list, i) in post.voList" :key="list.videoid" @click="showModal(list)"> 
                                <p>2023-08-03</p>
                                <p>{{list.title}}</p>
                            </li>
                            
                            <li>
                                <img class="addBtn" src="./source/addIco.png">
                            </li>
                        </ul>
                    </div>
                    
                </li>

            </ul>
            <ul class="pagination"></ul>
        </form>

        <!-- -------- 모달창 ------------ -->
        <div class="md">
            <div class="modalCon">
                <button type="button" class="mdClose"></button>
                
                <h4>영상 정보 수정</h4>
                <form method="post" class="uptFrm">
                    <div class="uptRow">
                        <span class="uptSub">영상 제목</span>
                        <input type="text" name="title" placeholder="영상의 제목 입력">
                    </div>
                    <div class="uptRow">
                        <span class="uptSub">썸네일</span>
                        <input type="file" name="image" placeholder="업로드일 입력">
                    </div>
                    <div class="uptRow">
                        <span class="uptSub">영상물</span>
                        <input type="file" name="video" placeholder="업로드일 입력">
                    </div>
                    <div class="uptRow">
                        <span class="uptSub">업로드일</span>
                        <input type="text" name="uploaddate" placeholder="업로드일 입력">
                    </div>
                    <div class="uptRow">
                        <span class="uptSub">Number</span>
                        <input type="text" name="parentnumber" placeholder="영상 ID 입력">
                    </div>
                    <div class="uptRow">
                        <span class="uptSub">Value</span>
                        <input type="text" name="value" placeholder="업로드일 입력">
                    </div>
                </form>
            </div>
            <button type="button" class="modalUpt">수정</button>
        </div>
        <div class="pagination">
		    <button class="pBtn prevBtn" @click="prevPage"></button>
		    <span>{{ currentPage }}</span>
		    <button class="pBtn nextBtn" @click="nextPage"></button>
		</div>
    </section>
    <script src="./js/header.js"></script>
    <script src="./js/admin.js"></script>
    <script>
    
 // ----------------------- modal ---------------------------------
      document.querySelector("body").insertAdjacentHTML("afterbegin", `
          <div class="darkBg"></div>`);
      var md = document.querySelector(".md");
      var bg = document.querySelector(".darkBg");
	/*  function listMd() {
            md.classList.add("active");
            bg.classList.add("active");
       } */
    document.addEventListener('DOMContentLoaded', function () {
        
        //const md = document.querySelector(".md");
        const bg = document.querySelector(".darkBg");
        const uptBtn = document.querySelector(".uptBtn");
        const closeBtn = document.querySelector(".mdClose");
        var listRow = document.querySelectorAll(".listRow");

        uptBtn.onclick = function() {
            md.classList.add("active");
            bg.classList.add("active");
        }
        
        closeBtn.onclick = function() {
            md.classList.remove("active");
            bg.classList.remove("active");
        }
        
        // ---- modal 영역 밖 클릭 시 닫기
        document.addEventListener('mouseup', function(e) {
            if(!md.contains(e.target)) {
                md.classList.remove("active");
                bg.classList.remove("active");
            }
        });

        const ep = document.querySelectorAll(".epList li");
        
    });
 
 
 
    	  $(document).ready(function () {
    	 
    		  
    		  
    		  
    	    
   		
        var vm = new Vue({
            el: ".vidSection",
            data: {
              jsonPost: [], // 제목 데이터 
              selectedItems: [], // 체크박스 배열에 저장
              currentPage: 1, // 현재 페이지 번호
              itemsPerPage: 5, // 한 페이지당 항목 수
              valLoad: "",
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
                var vm = this;
                // AJAX 요청을 이용하여 데이터 가져오기
                $.ajax({
                  url: "${path}/adminFindVide.do", // 수정
                  type: "post",
                  dataType: "json",
                  success: function(vlist) {
                    console.log(vlist);
                    vm.jsonPost = vlist; // jsonData 업데이트
                    console.log(vm.jsonPost);
                    console.log(vm.jsonPostNum);
                  },
                  error: function(err) {
                    console.log(err);
                  }
                });
              },
              showModal: function(list) {
                  this.showModal(list);//

                  md.classList.add("active");
                  bg.classList.add("active");
                },
              toggleEpList: function (idx) {
            	    // 해당 영상의 showEpList 값이 true일 때는 false로, false일 때는 true로 토글
            	    
            	    // Vue.set()을 사용하여 동적으로 showEpList 필드 추가
            	    Vue.set(this.jsonPost[idx], 'showEpList', !this.jsonPost[idx].showEpList);
            	},
              handleCheckboxChange: function(postid) {
            	    const idx = this.selectedItems.indexOf(postid);
            	    if (idx === -1) {
            	      // 선택되지 않은 경우 선택 배열에 추가
            	      this.selectedItems.push(postid);
            	    } else {
            	      // 선택된 경우 선택 배열에서 제거
            	      this.selectedItems.splice(idx, 1);
            	    }
            	    console.log('선택된 아이템 ID:', this.selectedItems);
            	  },
              prevPage: function() { // 페이지 Vue
                if (this.currentPage > 1) {
                  this.currentPage -= 1;
                }
              },
              nextPage: function() { // 페이지 Vue
                var totalPages = Math.ceil(this.jsonPost.length / this.itemsPerPage);
                if (this.currentPage < totalPages) {
                  this.currentPage += 1;
                }
              },
            },
            created: function() {
              // 페이지가 로드되면 데이터를 가져오도록 초기 실행
              this.rePostJson();
              this.jsonPost.forEach(function(post) {
            	    post.showEpList = false;
            	  });
            }
          });

          // 버튼 클릭 시 데이터를 다시 가져오도록 설정
          $("#schPostBtn").click(function() { //수정
            vm.rePostJson();
          });
          $("#schPost").keyup(function(key){ // 수정
            if(key.keyCode ===13){
              vm.rePostJson();
            }
          });

          $(".delBtn").click(function() { // 수정
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
                      success: function (ok) {
                          console.log(ok);
                      },
                      error: function (err) {
                          console.log(err);
                      }
                  });
              }
          }
      });


    </script>

</body>

</html>
