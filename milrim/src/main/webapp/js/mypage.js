// --------- 보관함/설정 -----------
function showCon1() {
    document.querySelector('.contentInner.con1').style.display = 'block';
    document.querySelector('.contentInner.con2').style.display = 'none';
  }

  // Function to show the "설정" content and hide the "보관함" content
  function showCon2() {
    document.querySelector('.contentInner.con1').style.display = 'none';
    document.querySelector('.contentInner.con2').style.display = 'block';
  }
  // Set the initial view to "보관함" when the page loads
  window.onload = showCon1;
  
// --------- 즐겨찾기/게시물---------
function showVideo(){
  document.querySelector('.showVideo').style.display='block';
  document.querySelector('.showPost').style.display='none';
}
function showPost(){
  document.querySelector('.showVideo').style.display='none';
  document.querySelector('.showPost').style.display='block';
}

function chanId(){
  document.querySelector('.modalWrap').style.display='block';
  document.querySelector('.mnic').style.display='block';
}
function chanPwd(){
  document.querySelector('.modalWrap').style.display='block';
  document.querySelector('.mpwd').style.display='block';
}
function logout(){
  document.querySelector('.modalWrap').style.display='block';
  document.querySelector('.ckLogout').style.display='block';
}

function cancel(){
  document.querySelector('.modalWrap').style.display='none';
  document.querySelector('.mnic').style.display='none';
  document.querySelector('.mpwd').style.display='none';
  document.querySelector('.ckLogout').style.display='none';
}