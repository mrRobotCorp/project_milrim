document.addEventListener('DOMContentLoaded', () => { 
    
    const player = new Plyr('#player');
    window.player = player;

    const starBtn = document.querySelector(".starBtn");

    starBtn.onclick = function() {
        this.classList.toggle("active");
    }
  
    // ---------- 공유 버튼 (링크 복사) -------------

    const url = window.document.location.href;
    const sBtn = document.querySelector(".shareBtn");
    
    sBtn.onclick = function() {
        window.navigator.clipboard.writeText(url).then(() => {
            alert("복사되었습니다.");
        });
    };
    
  });

  //--------------------------------
  // 즐겨찾기 JS
$(document).ready(function() {
    var firstEp = $('.ep').first();
    loadVideo(firstEp);
    $('.ep').on('click', function() {
        loadVideo($(this));
    });
});

var videoId; // 현재 비디오의 ID를 저장하는 전역 변수
function loadVideo(element) {
    var title = element.data('title');
    var synopsis = element.data('synopsis');
    var video = element.data('video');
    var image = element.data('image');
    
    $('#player source').attr('src', './source/videos/' + video + '.mp4');
    $('#player').attr('poster', './source/images/' + image + '.jpg'); 
    $('#videoTitle').text(title);
    $('#videoSynopsis').text(synopsis);
    $('#player')[0].load();
}

document.addEventListener('DOMContentLoaded', () => { 
    const player = new Plyr('#player');
    window.player = player;
    // 쿼리스트링에서 videoId 값 추출
    function getVideoId() {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get('videoId');
    }
    // 현재 페이지의 videoId 값할당
    const videoId = getVideoId();
	console.log("Current Video ID:", videoId); 
    // 즐겨찾기 버튼
    const starBtn = document.querySelector(".starBtn");
        // 즐겨찾기 상태를 확인하고 버튼의 상태를 설정하는 함수
    function ckSetBookmark() {
        fetch(`/milrim/check.do?videoId=${videoId}`)
        .then(response => response.json())
        .then(data => {
            if (data.isBookmarked) {
                starBtn.classList.add("active");
            } else {
                starBtn.classList.remove("active");
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 페이지 로드 시 즐겨찾기 상태 확인
    ckSetBookmark();
    
	starBtn.onclick = function() {
	    // 즐겨찾기 상태 토글
	    fetch(`/milrim/toggle.do?videoId=${videoId}`)
	    .then(response => response.text())
	    .then(data => {
	        console.log(data);
	        this.classList.toggle("active");
	    })
	    .catch(error => {
	        console.error('Error:', error);
	    });
	}
});
  