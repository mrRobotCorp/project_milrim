document.querySelector('form[name="writePost"]').addEventListener('submit', function(event) {
    event.preventDefault();  // 폼의 기본 제출 막기

    const formData = new FormData(this);

    fetch('/milrim/insPost.do', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('게시글 등록 성공');
            window.location.href = '/milrim/community.do';
        } else {
            alert('게시글 등록 실패');
            console.log('원인'+data)
        }
    })
    .catch(error => {
        console.log('에러 :', error.message);
        alert('에러 발생!');
    });
});
