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
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/findId.css">
</head>
<script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function (){
	
		$("#findBtnID").click(function(){
		//console.log($("#formID").serialize())
		 $.ajax({
			type:"post",
			url:"${path}/findID.do",
			data:$("#formID").serialize(),
			dataType:"text",
			success:function(id){
				if(id==null || id==""){
					alert("없는 회원 입니다.")
				}else{
					if(confirm("아이디: "+id+"\n로그인화면으로 이동하시겠습니까?")){
					location.href = "${path}/login.do"
					}
				}
			},
			error:function(err){
				console.log(err)
			}
		}) 
		})
		$("#findBtnPASS").click(function(){
		 $.ajax({
			type:"post",
			url:"${path}/findPASS.do",
			data:$("#formPASS").serialize(),
			dataType:"text",
			success:function(pass){
				if(pass==null || pass==""){
					alert("없는 아이디 입니다.")
				}else{
					if(confirm("비밀번호: "+pass+"\n로그인화면으로 이동하시겠습니까?")){
					location.href = "${path}/login.do"
					}
				}
			},
			error:function(err){
				console.log(err)
			}
		}) 
	})
	
	
})
</script>
<body>
    <header>
        <nav>
            <ul class="gnb">
                <li>
                    <a href="./startpage.do"><img class="headLogo" src="./source/logo_noBg_b.png"></a>
                </li>
                <li><a href="/milrim/community.do">밀림의 숲</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <div class="find">
        <form method="post" id="formID">
            <div class="findInner">
                <div class="findForm">
                    <h3>아이디 찾기</h3>
                    <div  class="findInput">
                        <label>이름</label>
                        <input type="text" id="name" class="fnick" name="name" maxlength="16" placeholder="아이디를 입력하세요" 
                        onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요.'">
                    </div>
                    <div class="findInput">
                        <label>휴대폰 번호</label>
                        <input type="number" id="phonenumber" name="phonenumber" maxlength="11" placeholder="비밀번호를 입력하세요" 
                        onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요.'">
                    </div>
                    <input type="button" id="findBtnID" class="findBtn" value="아이디 찾기">
                </div>
            </div>
        </form>
        <form method="post" id="formPASS">
            <div class="findInner">
                <div class="findForm">
                    <h3>비밀번호 찾기</h3>
                    <div  class="findInput">
                        <label>아이디</label>
                        <input type="text" id="id" name="id" maxlength="16" placeholder="아이디를 입력하세요" 
                        onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요.'">
                    </div>
                    <div class="findInput">
                        <label>휴대폰 번호</label>
                        <input type="number" id="phonenumber" name="phonenumber" maxlength="16" placeholder="휴대번호를 입력하세요" 
                        onfocus="this.placeholder=''" onblur="this.placeholder='휴대번호를 입력하세요.'">
                    </div>
                    <input type="button" id="findBtnPASS" class="findBtn" value="비밀번호 찾기">
                </div>
            </div>
        </form>
        </div>
        
    </section>

    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
   <!--  <script src="./js/header.js"></script>
    <script src="./js/main.js"></script> -->

</body>

</html>