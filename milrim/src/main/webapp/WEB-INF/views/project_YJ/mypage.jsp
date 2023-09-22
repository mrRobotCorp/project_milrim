<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
    <link rel="stylesheet" href="./css/mypage.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
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
                        <a href="#">프로필 관리</a>
                    </li>
                    <li>
                        <a href="#">보관함</a>
                    </li>
                    <li>
                        <a href="#">설정</a>
                    </li>
                    <li>
                        <a href="/milrim/logout.do">로그아웃</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 메인페이지 -->
    <section>
        <div class="myInner">
            <div class="profile">
                <div class="profileInner">
                    <h3>프로필 정보</h3>
                    <div class="profileinInner">
                        <div class="semiInfo">
                            <img src="./source/none.png">
                            <div class="nameTag">
                                <div class="name" id="username">${userInfo.name}</div>
                                <input type="button" value="설정"  onclick="showCon2()">
                            </div>
                        </div>
                        <div class="textInfo">
                            <div class="threeInfo">
                                <h2 id="saveV">${fn:length(bookmarks)}</h2>
                                <p>즐겨찾기</p>
                            </div>
                            <div class="threeInfo">
                                <h2 id="saveP">${fn:length(posts)}</h2>
                                <p>게시물</p>
                            </div>
                            <div class="threeInfo">
                                <h2 id="nPay">09월 03일</h2>
                                <p>다음 결제일</p>
                            </div>
                        </div>
                        <button class="myBox"  onclick="showCon1()">
                            보관함
                        </button>
                    </div>
                </div>
            </div>
            <!-- -------보관함---------- -->
            <div class="content">
                <div class="contentInner con1">
                    <h3>보관함</h3>
                    <div class="cName">
                        <div class="myGnb">
                            <h4 class="videoBtn" onclick="showVideo()">즐겨찾기</h4>
                            <h4 class="writingBtn" onclick="showPost()">게시물</h4>
                        </div>
                        
                    </div>
                    
					<div class="showVideo">
					    <h4 class="sVideo">작품(${fn:length(bookmarks)})</h4>
					    <c:forEach var="bookmark" items="${bookmarks}" varStatus="loop">
					        <c:if test="${loop.index % 3 == 0}">
					            <div class="videoList">
					        </c:if>
							<div class="videoInfo">
							    <img src="./source/images/${bookmark.image}.jpg" alt="">
							    <p>${bookmark.title}</p>
							</div>
					        <c:if test="${loop.index % 3 == 2 || loop.index == fn:length(bookmarks)-1}">
					            </div>
					        </c:if>
					    </c:forEach>
					</div>

					<div class="showPost">
					    <h4 class="sVideo">게시물(${fn:length(posts)})</h4>
					    <c:forEach var="post" items="${posts}" varStatus="loop">
					        <c:if test="${loop.index % 4 == 0}">
					            <div class="postList">
					        </c:if>
					            <div class="postInfo">
					                <div class="postThumb">
					                <p class="postThumbInner">${post.content}</p>
					                </div>
					                <p>${post.title}</p>
					            </div>
					        <c:if test="${loop.index % 4 == 3 || loop.index == fn:length(posts)-1}">
					            </div>
					        </c:if>
					    </c:forEach>
					</div>

                </div>

                <!-- ---------설정화면------------- -->
                <div class="contentInner con2">
                    <h3>설정</h3>
                    <div class="cName"></div>
                    <div class="option">
                        <div class="account">
                            <h4>계정</h4>
                            <div class="ex">
                                <div class="ex2">
                                <ul>
                                    <li>아이디</li>
                                    <li>이름</li>
                                    <li>비밀번호</li>

                                </ul>
                                <ul>
                                    <li>이메일</li>
                                    <li>결제 정보</li>
                                    <li class="logout"> <input type="button" value="로그아웃" onclick="logout()"></li>
                                    <li class="idDelete"><input type="button" value="밀림 탈퇴하기" onclick="idDelete()"></li>
                                </ul>
                                </div>
                                <div class="ex3">
                                    <ul>
                                        <li>${userInfo.id}</li>
                                        <li>${userInfo.name}</li>
                                        <li class="pwCh">***********
                                            <input type="button" value="비밀번호 변경" onclick="chanPwd()">
                                        </li>
                                    </ul>
                                    <ul>
                                        <li>${userInfo.email}</li>
                                        <li>신용카드(1234-****-****-1234)</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="theme">
                            <h4>테마</h4>
                            <div class="themeSemi">
                                <div class="themeAlign" onclick="themeLight()">
                                    <div class="tLight"></div>
                                    <p>밝은 테마</p>
                                </div>
                                <div class="themeAlign" onclick="themeDark()">
                                    <div class="tDark"></div>
                                    <p>어두운 테마</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- --------모달창---------- -->
        <div class="modalWrap">
            <div class="modal mnic">
                <div class="modalInner">
                    <div class="modalTop">
                        <h2>닉네임 변경</h2>
                        <div class="cencel" onclick="cancel()">
                            <button></button>
                        </div>
                    </div>
                    <label>닉네임</label>
                    <input class="new" type="text" 
                    placeholder="새로운 닉네임을 입력하세요" maxlength="16">
                    <div class="modalBtn">
                        <input type="submit" value="확인" onclick="done()">
                    </div>

                </div>
            </div>
            <!-- ---비밀번호 변경---- -->
            <div class="modal mpwd">
                <div class="modalInner">
                    <div class="modalTop">
                        <h2>비밀번호 변경</h2>
                        <div class="cencel" onclick="cancel()">
                            <button></button>
                        </div>
                    </div>
            <form id="passch">
                    <input type="hidden" name="id" value="${userInfo.id}">
                    <label>현재 비밀번호</label>
                    <input class="new" type="password" name="pass" placeholder="현재 사용중인 비밀번호를 입력하세요." maxlength="16">
                    <label>새 비밀번호</label>
                    <input class="new" type="password" name="passchange" placeholder="영문, 숫자, 특수기호(@,!,#,$,?,/)포함 8글자 이상" maxlength="16">
                    <label>현재 비밀번호</label>
                    <input class="new" type="password" name="passchange1" placeholder="비밀번호를 다시 한 번 입력하세요." maxlength="16">
                    <div class="modalBtn">
                        <input type="button" value="확인" id="passChange">
                    </div>
                </div>
            </div>
            </form>
            
            <!-- --- 로그아웃 확인창 --- -->
            <div class="modal ckLogout">
                <div class="modalInner">
                    <div class="modalTop">
                        <h2>로그아웃</h2>
                        <div class="cencel" onclick="cancel()">
                            <button></button>
                        </div>
                    </div>
                    <p>현재 기기에서 로그아웃 하시겠습니까?</p>
                    <div class="modalBtn">
                        <input type="button" value="확인" id="logout">
                    </div>


                </div>
            </div>
        </div>

    </section>


    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>
</body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/mypage.js"></script>
	<script type="text/javascript">
            $(document).ready(function (){
            	$("#passChange").click(function (){
    				
    				 $.ajax({
    						type:"post",
    						url:"${path}/mypagepass.do",
    						data:$("#passch").serialize(),
    						dataType:"text",
    						success:function(msg){
    		        			if(msg=="Y"){
    		        				alert("수정성공")
    		        				cancel()
    		    				}else if(msg=="N"){
    		        				alert("비밀번호가 다릅니다!")
    		    				} 
    						},
    						error:function(err){
    							console.log(err)
    						}
    					}) 
            	})
    		
            	
            	$("#logout").click(function(){
        				location.href="${path}/logout.do";
            	})
            })
            </script>


</html>