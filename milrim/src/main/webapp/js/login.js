const loginButton = document.getElementById('loginBtn');
const usernameInput = document.getElementById('id');
const passwordInput = document.getElementById('pass');

// 로그인 버튼의 배경색을 변경하는 함수
function changeButtonBackground() {
    const usernameValue = usernameInput.value.trim();
    const passwordValue = passwordInput.value.trim();

    // 입력된 아이디와 비밀번호가 둘 다 비어있지 않을 때
    if (usernameValue !== '' && passwordValue !== '') {
        loginButton.style.backgroundColor = '#00539C';
        loginButton.style.color='white';
    } else {
        loginButton.style.backgroundColor = '#d9d9d9';
        loginButton.style.color='black';
    }
}

// 아이디와 비밀번호 입력창에 값이 변경될 때마다 이벤트를 감지하여 changeButtonBackground 함수 호출
usernameInput.addEventListener('input', changeButtonBackground);
passwordInput.addEventListener('input', changeButtonBackground);

/*
//=================회원가입=================

// 필수 정보 입력 여부 확인 함수
function checkAllFields() {
    var allFieldsFilled = true;
    // 각 input 필드의 값을 확인
    $('.joinForm input').each(function() {
        if ($(this).val() === '') {
            allFieldsFilled = false;
            return false; // 루프 중단
        }
        
    });

    // 필수 정보가 모두 입력되었는지에 따라 버튼 상태 변경
    if (allFieldsFilled) {
        $('#join').addClass('active').prop('disabled', false);
    } else {
        $('#join').removeClass('active').prop('disabled', true);
    }
}

// input 필드 값 변경 감지
$('.joinForm input').on('input', function() {
    checkAllFields();
});

// 페이지 로드 시 버튼 상태 초기화
checkAllFields();

// 전체동의
const agreeChkAll = document.querySelector('input[name=check_all]');
agreeChkAll.addEventListener('change', (e) => {
let agreeChk = document.querySelectorAll('input[name=agree]');
for(let i = 0; i < agreeChk.length; i++){
    agreeChk[i].checked = e.target.checked;
}
});
*/

