const findButton = document.getElementById('findBtn');
const nicknameInput = document.getElementById('nick');
const pnumInput = document.getElementById('pnum');
const idInput = document.getElementById('id');



// 로그인 버튼의 배경색을 변경하는 함수
function changeButtonBackground() {
    const nicknameValue = nicknameInput.value.trim();
    const pnumValue = pnumInput.value.trim();


    // 입력된 아이디와 비밀번호가 둘 다 비어있지 않을 때
    if (nicknameValue !== '' && pnumValue !== '') {
        findButton.style.backgroundColor = '#00539C';
        findButton.style.color='white';
    } else {
        findButton.style.backgroundColor = '#d9d9d9';
        findButton.style.color='black';
    }
}
function changeButtonBackground2() {
    const idValue = idInput.value.trim();
    const pnumValue = pnumInput.value.trim();

    // 입력된 아이디와 비밀번호가 둘 다 비어있지 않을 때
    if (idValue !== '' && pnumValue !== '') {
        findButton.style.backgroundColor = '#00539C';
        findButton.style.color='white';
    } else {
        findButton.style.backgroundColor = '#d9d9d9';
        findButton.style.color='black';
    }
}



// 아이디와 비밀번호 입력창에 값이 변경될 때마다 이벤트를 감지하여 changeButtonBackground 함수 호출
nicknameInput.addEventListener('input', changeButtonBackground);
pnumInput.addEventListener('input', changeButtonBackground);

idInput.addEventListener('input', changeButtonBackground2);
pnumInput.addEventListener('input', changeButtonBackground2);



