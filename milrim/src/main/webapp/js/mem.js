function cancel(){
    document.querySelector('.payModal').style.display='none';
    document.querySelector('.cardReg').style.display='none';
}
function openPay(){
    document.querySelector('.payModal').style.display='block';
}
function firstpay(){
    document.querySelector('.easyPay').style.display='flex';
    document.querySelector('.otherPay').style.display='none';
}
function secondpay(){
    document.querySelector('.easyPay').style.display='none';
    document.querySelector('.otherPay').style.display='flex';
}
function easyPay(){
    document.querySelector('.cardReg').style.display='block';
    document.querySelector('.payModal').style.display='none'
}
function cancel2(){
    document.querySelector('.cardReg').style.display='none';
}
function prev(){
    document.querySelector('.cardReg').style.display='none';
    document.querySelector('.payModal').style.display='block'
}


// ---- 날짜 / 적용
function formatDate() {
    const inputElement = document.getElementById("dateInput");
    const inputValue = inputElement.value;

    // 입력된 값에서 숫자만 추출
    const numbersOnly = inputValue.replace(/\D/g, "");

    // MM/YY 형식으로 자동으로 포맷팅
    if (numbersOnly.length >= 4) {
      const formattedDate = numbersOnly.replace(/(\d{2})(\d{0,2})/, "$1/$2");
      inputElement.value = formattedDate;
    }
  }

// 숫자 입력 제한
const birthInput = document.getElementById('birthInput');

birthInput.addEventListener('input', () => {
  const maxLength = 6;
  const value = birthInput.value;

  if (value.length > maxLength) {
    birthInput.value = value.slice(0, maxLength);
  }
});

// 모든 입력 필드에 값이 있는지 확인하는 함수
function checkInputValues() {
    const inputElements = document.querySelectorAll('.cardWrap input[type="text"], .cardWrap input[type="tel"], .cardWrap input[type="password"]');
    for (const inputElement of inputElements) {
      if (inputElement.value.trim() === '') {
        return false; // 하나 이상의 입력 필드가 비어있는 경우 false 반환
      }
    }
    return true; // 모든 입력 필드에 값이 있는 경우 true 반환
  }

  // "등록하기" 버튼을 활성화하고 배경색을 변경하는 함수
  function enableRegisterButton() {
    const registerButton = document.querySelector('.BbRMj');
    const lastCheckbox = document.querySelector('.cardAgree input[type="checkbox"]');
    
    // 모든 입력 필드에 값이 있고 마지막 체크박스가 체크된 경우
    if (checkInputValues() && lastCheckbox.checked) {
      registerButton.disabled = false;
      registerButton.style.backgroundColor = 'var(--color-sub)'; // 배경색을 녹색으로 변경
      registerButton.style.color='black';
    } else {
      registerButton.disabled = true;
      registerButton.style.backgroundColor = '#ccc'; // 배경색을 회색으로 변경
      registerButton.style.color='gray';
    }
  }

  // 결제 폼의 입력 요소들에 대한 이벤트 리스너 추가
  const inputElements = document.querySelectorAll('.cardWrap input[type="text"], .cardWrap input[type="tel"], .cardWrap input[type="password"]');
  for (const inputElement of inputElements) {
    inputElement.addEventListener('input', enableRegisterButton);
  }

  // 결제 폼의 마지막 체크박스에 대한 이벤트 리스너 추가
  const lastCheckbox = document.querySelector('.cardAgree input[type="checkbox"]');
  lastCheckbox.addEventListener('change', enableRegisterButton);

  // 초기에 enableRegisterButton() 함수 호출하여 "등록하기" 버튼의 초기 상태를 설정합니다.
  enableRegisterButton();

 // "등록하기" 버튼 클릭 시 실행되는 함수
 // "등록하기" 버튼 클릭 시 실행되는 함수



  // 모든 입력 필드에 값이 있는지 확인하는 함수
  function checkInputValues() {
    const inputElements = document.querySelectorAll('.cardWrap input[type="text"], .cardWrap input[type="tel"], .cardWrap input[type="password"]');
    for (const inputElement of inputElements) {
      if (inputElement.value.trim() === '') {
        return false; // 하나 이상의 입력 필드가 비어있는 경우 false 반환
      }
    }
    return true; // 모든 입력 필드에 값이 있는 경우 true 반환
  }

  // 멤버십 결제 모달창을 열기 위한 함수
  function openPayModal() {
    const payModal = document.querySelector('.payModal');
    payModal.style.display = 'block';

    const cardReg = document.querySelector('.cardReg');
    cardReg.style.display = 'none';
  }

  // 초기에 실행하여 이벤트 리스너 추가
  document.querySelector('.BbRMj').addEventListener('click', movePage);



  // 결제 하기 버튼 활성화

  