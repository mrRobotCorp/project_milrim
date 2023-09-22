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
    <link rel="stylesheet" href="./css/login.css">
</head>
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>


<body>
    <header>
        <nav>
            <ul class="gnb">
                <li>
                    <a href="./startpage.do"><img class="headLogo" src="./source/logo_noBg_b.png"></a>
                </li>
                <li><a href="./startpage.do"></a></li>
            </ul>
        </nav>
    </header>

    <section>
    	<form method="post" id="login01">
	        <div class="logInner">
	            <div class="logForm">
	                <h3>밀림회원으로 로그인</h3>
		                <div  class="logInput">
		                    <label>아이디</label>
		                    <input type="text" id="id" name="id" maxlength="16" placeholder="아이디를 입력하세요"
		                    onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요.'">
		                </div>
		                <div class="logInput">
		                    <label>비밀번호</label>
		                    <input type="password" id="pass" name="pass" maxlength="16" placeholder="비밀번호를 입력하세요" 
		                    onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요.'">
		                </div>
	                <!-- 아이디 저장, 계정찾기 -->
	                <div class="logBottom">
	                    <div class="idSave">
	                        <input type="checkbox" id="saveId">
	                        <label for="saveId"></label>
	                        <p>아이디 저장하기</p>
	                    </div>
	                    <a href="/milrim/find.do">아이디/비밀번호 찾기</a>
	                </div>
	                <input type="button" id="loginBtn" class="logBtn" value="로그인" >
	            </div>
	        </div>
        </form>
    </section>

<footer>
    <img src="./source/logo_noBg.png">
    <p>© Milrim, Inc. 2023. No more dull moments!</p>
</footer>

<script src="./js/header.js"></script>
<script src="./js/login.js"></script>
<script type="text/javascript">
$(document).ready(function (){
	$("#loginBtn").click(function(){
		//console.log($("#formID").serialize())
		$.ajax({
			type:"post",
			url:"${path}/login01.do",
			data:$("#login01").serialize(),
			dataType:"text",
			success:function(ys){
						console.log(ys)
				if(ys=="Y[]"){
						location.href = "${path}/memberShip.do"
				}else if(ys=="N[]"){
					alert("아이디 비밀번호가 다릅니다.")
				}else{
						location.href = "${path}/main02.do"
				}
			},
			error:function(err){
				console.log(err)
			}
		}); 
	});
	
});

</script>
</body>
</html>
