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
    <link rel="stylesheet" href="./css/login.css">
</head>

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
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
<script type="text/javascript">
var tryeCh = 0;
var idYN = "N";
function valPass(password) { //비밀번호
     const passPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!#$?/]).{8,}$/;
     return passPattern.test(password);
}
function valemail(email) { //이메일
     const emailPattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
     return emailPattern.test(email);
}
function valId(id) { //아이디
     const idPattern = /^[A-Za-z0-9]{8,}$/;
     return idPattern.test(id);
}
$(document).ready( function(){
   /* 아이디 정규식 */
  $("#id").keyup(function () {
    const idval = $(this).val();
    console.log("아이디" + idYN);
    if (!valId(idval) && idval != "") { // 정규식 혹은 "" 이 아닐때
      $("#idCheck").text("영문, 숫자로 8자이상 입력해 주세요.").addClass("nvalid-input");
      idYN == "N";
    } else if (valId(idval)) { // 사용이 가능한 아이디 출력
      $("#idCheck").text("사용 가능한 아이디 입니다.").removeClass("nvalid-input");
      idYN == "N";
    } else if (idval == "") { // ""이면 지우기
      $("#idCheck").text(" ").addClass("nvalid-input");
      idYN == "N";
    }
  });
   /* 아이디 정규식 */
   
   /* 아이디 중복 확인 */
   $("#id").keyup(function(){
      //alert($("#id").serialize())
      $.ajax({
         type:"post",
         url:"${path}/idc.do",
         data:$("#id").serialize(),
         dataType:"text",
         success:function(ys){
        	 console.log(ys)
               if(ys=="\"Y\""){
                  $("#idCheck").text("이미 사용중인 아이디입니다!").addClass("nvalid-input");
               }
         },
         error:function(err){
            console.log(err)
         }
      })
   })
   /* 아이디 중복 확인 */
   
   /* 비밀번호 정규식 */
   $("#pass").keyup(function() {
      const password = $(this).val();
      if (valPass(password)) {
        $("#pwdCheck").text("사용할 수 있는 비밀번호 입니다.").removeClass("nvalid-input");
      } else if($("#pass").val()==""){
         $("#pwdCheck").text(" ").addClass("nvalid-input");
      }else{
         $("#pwdCheck").text("영문, 숫자, 특수기호(@,!,#,$,?,/)포함 8글자 이상").addClass("nvalid-input");
      }
   });
   /* 비밀번호 정규식 */
   /* 비밀번호 두번째 체크 */
   $("#pass1").keyup(function() {
      if ($("#pass1").val()==$("#pass").val()) {
        $("#pwddbCheck").text("확인").removeClass("nvalid-input");
      } else if($("#pass1").val()==""){
         $("#pwddbCheck").text("비밀번호가 일치하지 않습니다.").addClass("nvalid-input");
      }else {
         $("#pwddbCheck").text("비밀번호가 일치하지 않습니다.").addClass("nvalid-input");
      }
   });
   /* 비밀번호 두번째 체크 */
   
   /* 이메일 정규식 */
   $("#email").keyup(function() {
      const email = $(this).val();
      if (valemail(email)) {
        $("#emailCheck").text("사용 가능한 이메일입니다.").removeClass("nvalid-input");
      } else if(email==""){
         $("#emailCheck").text(" ").addClass("nvalid-input");
      } else {
         $("#emailCheck").text("이메일이 정상적이지 않습니다.").addClass("nvalid-input");
      }
   });
   /* 이메일 정규식 */


   /* 인증번호 */
   $("#sendMsg").click(function(){
       $.ajax({
           type:"post",
           url:"${path}/mesgo.do",
           data:{ "phonenumber": $("#phonenumber").val() },
           success:function(ch){
               alert("잠시 후 메시지가 도착합니다!");
           },
           error:function(err){
               console.log(err);
           }
       });
   });
   /* 인증번호 */
   
   /* 인증번호 확인 */
   $("#checkNum").click(function(){
       $.ajax({
           type: "post",
           url: "${path}/checkMes.do",
           data: { "numberC": $("#numberC").val() },
           dataType:"text",
           success: function(ch){
               if(ch=="Y"){
                  $("#codeCheck").text("인증성공!!").removeClass("nvalid-input");
               }else{
                  $("#codeCheck").text("인증성공!!").removeClass("nvalid-input");
               }
           },
           error: function(err){
               console.log(err);
           }
       });
   });
   /* 인증번호 확인 */

   
   /* 회원가입 버튼 클릭시 */
   $("#join").click(function(){
      console.log($("form").serialize())
       $.ajax({
         type:"get",
         url:"${path}/idMem.do?",
         data:"id="+$("#id").val()+"&pass="+$("#pass").val()+"&name="+$("#name").val()+"&email="+$("#email").val()+"&phonenumber="+$("#phonenumber").val(),
         dataType:"text",
         success:function(ys){
            alert("회원가입 성공!!")
            location.href="${path}/login.do";
         },
         error:function(err){
            console.log(err)
         }
      }) 
   })
   /* 회원가입 버튼 클릭시 */
});
    </script>
    <section>
        <div class="joinInner">
            <div class="joinForm">
                <h3>회원가입</h3>
             <form method="post">
                <div  class="logInput">
                    <label>이름</label>
                    <input type="text" id="name" name="name" maxlength="16" placeholder="이름을 입력하세요" 
                    onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력하세요.'">
                </div>
                <div  class="logInput" >
                    <label>아이디</label>
                    <input type="text" id="id" name="id" maxlength="16" placeholder="아이디를 입력하세요" value=""
                    onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요.'" >
                    <p id="idCheck" class="valid-input nvalid-input"></p>
                </div>
                <div class="logInput">
                    <label>비밀번호</label>
                    <input type="password" id="pass" name="pass" maxlength="16" placeholder="영문, 숫자, 특수기호(@,!,#,$,?,/)포함 8글자 이상" 
                    onfocus="this.placeholder=''" onblur="this.placeholder='영문, 숫자, 특수기호(@,!,#,$,?,/)포함 8글자 이상'" >
                    <p id="pwdCheck" class="valid-input nvalid-input"></p>
                </div>
                <div class="logInput">
                    <label>비밀번호 확인</label>
                    <input type="password" id="pass1" name="pass1" maxlength="16" placeholder="비밀번호를 입력하세요" 
                    onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요'" ><!--  -->
                    <p id="pwddbCheck" class="valid-input nvalid-input"></p>
                </div>
                <div class="logInput">
                    <label>이메일</label>
                    <input type="text" id="email" name="email" maxlength="30" placeholder="이메일을 입력하세요" 
                    onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력하세요'">
                    <p id="emailCheck" class="valid-input nvalid-input"></p>
                </div>
                <div class="phoneInner">
                    <div class="phoneInput">
                        <label>휴대폰 번호</label>
                        <input type="number" placeholder="휴대폰 번호를 입력하세요" maxlength="11" id="phonenumber" name="phonenumber"
                        onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호를 입력하세요'">
                    </div>
                    <input type="button" class="codeBtn" value="인증번호 발송" id="sendMsg">
                </div>
                    <div class="phoneInner">
                        <div class="phoneInput">
                            <label>인증번호 확인</label>
                            <input type="number" placeholder="인증번호를 입력하세요" maxlength="6"
                            onfocus="this.placeholder=''" onblur="this.placeholder='인증번호를 입력하세요'" id="numberC" name="numberC">
                        </div>
                        <input type="button" class="codeBtn" value="인증번호 확인" id="checkNum">
                    </div>
                    <p id="codeCheck"class="valid-input"></p>


                <div class="agreeForm">
                    <div class="allAgree">
                        <p>다음 약관에 모두 동의</p>
                       <input type="checkbox" name="check_all" class="ckAgree" id="allAgree"> 
                       <label for="allAgree"></label>
                    </div>
                    <div class="agree">
                        <p>밀림 이용약관 동의 (필수)</p>
                        <input type="checkbox" name="agree"class="ckAgree" id="fAgree">
                        <label for="fAgree"></label>
                    </div>
                    <div class="agree">
                        <p>개인 정보 수집 및 이용에 대한 안내 (필수)</p>
                        <input type="checkbox" name="agree" class="ckAgree" id="sAgree">
                        <label for="sAgree"></label>
                    </div>
                    <div class="agree">
                        <p>맞춤 할인 및 이벤트 소식 메일 수신 (선택)</p>
                        <input type="checkbox" name="agree" class="ckAgree" id="tAgree">
                        <label for="tAgree"></label>
                    </div>
                   </div>
                <input type="button" value="회원가입" id="join" class="joinBtn" >
             </form>
                </div>
            </div>

    </section>

    <footer>
        <img src="./source/logo_noBg.png">
        <p>© Milrim, Inc. 2023. No more dull moments!</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/main.js"></script>
    <script>
     // 버튼 활성화?
    // 전체동의
       const agreeChkAll = document.querySelector('input[name=check_all]');
       agreeChkAll.addEventListener('change', (e) => {
       let agreeChk = document.querySelectorAll('input[name=agree]');
       for(let i = 0; i < agreeChk.length; i++){
           agreeChk[i].checked = e.target.checked;
       }
       });
   
       // 입력 수 제한
       const phonenumber = document.getElementById('phonenumber');
   
       phonenumber.addEventListener('input', () => {
         const maxLength = 11;
         const value = phonenumber.value;
   
         if (value.length > maxLength) {
            phonenumber.value = value.slice(0, maxLength);
         }
       });
   
       const numberC = document.getElementById('numberC');
   
       numberC.addEventListener('input', () => {
         const maxLength = 6;
         const value = numberC.value;
   
         if (value.length > maxLength) {
            numberC.value = value.slice(0, maxLength);
         }
       });
    </script>
</body>
</html>