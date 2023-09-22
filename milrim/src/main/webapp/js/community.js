
document.addEventListener("DOMContentLoaded", function () {
    
    const postAll = document.querySelectorAll(".postAll");
    const morePost = document.querySelector(".morePost");
    const section = document.querySelector(".postSection");

    // -----------------------------------------------
    document.getElementById("scrollTop").onclick = function () {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    };

    // ---------------- post hide -------------------
    const hideBtn = document.querySelectorAll(".hide");

    hideBtn.forEach( (e, i) => {
        e.onclick = function() {
            const hideCh = confirm("해당 게시글을 숨기시겠습니까?");
            if(hideCh) {
                postAll[i].style.display = "none"; 
            }
        }
    });


    // --------------- copy ----------------
    const postObj = document.querySelectorAll(".pContent p");
    const copy = document.querySelectorAll(".copy");

    copy.forEach( (e, i) => {
        e.onclick = function() {
            const postTxt = postObj[i].innerText;
            window.navigator.clipboard.writeText(postTxt).then(() => {
                alert("복사되었습니다.");
            });
        };
    });

    // -------------- more list --------------
    const pMore = document.querySelectorAll(".postMore");
    const moreList = document.querySelectorAll(".moreList");
    const cmmtMore = document.querySelectorAll(".cmmtMore");
    const cmmtMoreList = document.querySelectorAll(".cmmtMoreList");
    
    document.addEventListener('mouseup', function(e) {
        for(let i=0; i<moreList.length; i++) {
            if(!moreList[i].contains(e.target)) {
                moreList[i].classList.remove("active");
            }
        }
    });
    
    pMore.forEach( (e, i) => {
        e.onclick = function() {
            moreList[i].classList.toggle("active");
        };
    });
    
    cmmtMore.forEach( (e, i) => {
        e.onclick = function() {
            cmmtMoreList[i].classList.toggle("active");
        };
    });


    // -------------- like, comment btn --------------
    const like = document.querySelectorAll(".like");
    like.forEach( (e) => {
        e.onclick = function() {
            this.classList.toggle("active");
        };
    });
    
    const disCommt = document.querySelectorAll(".disCommt");
    const cmmtBtn = document.querySelectorAll(".cmmtBtn");
    cmmtBtn.forEach( (e, i) => {
        e.onclick = function() {
            if( disCommt[i] != null) {
                disCommt[i].classList.toggle("active");
            }

        }
    });


})

$(document).ready(function () {

    // --------------- post more -------------------
    load('.postSection', '3');

    $(".morePost").on("click", function () {
        load('.postSection', '3', $(".morePost"));
    })
    
    function load(id, cnt, btn) {
        let plist = id + " .postAll:not(.active)";
        let plength = $(plist).length;
        let postTotal;
        if (cnt < plength) {
            postTotal = cnt;
        } else {
            postTotal = plength;
            $(btn).hide();
        }
        $(plist + ":lt(" + postTotal + ")").addClass("active");
    }
    
    
    
    // ---------------------- scrollTop ------------------------------
    const Height = $("#scrollTop").height();
    $("#scrollTop").hide();

    $(window).scroll(function () {
        var rolling = $(this).scrollTop() >= Height;
        if (rolling) {
            $("#scrollTop").fadeIn(500).css({ "position": "fixed" });
        }
        else {
            $("#scrollTop").fadeOut(300);
        }

    });



})
$(document).on('click', '.cmmtBtn', function() {
    var postId = $(this).data('post-id');
    if(postId) {
        commentList(postId);
        console.log(postId) /////////////
    } else {
        console.error("postId가 없습니다.");
    }
});
// 댓글 출력 JS
document.querySelectorAll(".cmmtBtn").forEach(button => {
    button.addEventListener("click", function() {
        let postId = this.closest(".postAll").dataset.postId; // postId를 data-post-id 속성에서 가져옴
        commentList(postId); // postId를 사용하여 댓글 출력
    });
});
// 댓글 로드 ajax
function commentList(postId) {
    $.ajax({
        url: "/milrim/commentList.do",
        type: "GET",
        data: {
            postId: postId
        },
        success: function(data) {
            renderComments(data, postId);
        },
        error: function(error) {
            console.error("댓글을 가져오는데 실패했습니다.", error);
        }
    });
}
// 댓글 출력 JS
function renderComments(comments, postId) {
    // 해당 게시글의 댓글 선택
    const show = document.querySelector(`[data-post-id="${postId}"] .disCommt`);

    let commentHTML = `
        <span>댓글</span>
        <span>(${comments.length})</span>
        <form action="" method="">
            <textarea type="text" name="addCmmt" placeholder="댓글을 남겨주세요."></textarea>
            <button type="button" class="addCmmtBtn">등록</button>
        </form>
    `;

	comments.forEach(comment => {
	    commentHTML += `
	        <div class="cmmtUser" data-comment-id="${comment.commentId}">
	            <img src="./source/none.png" class="cmmtUserImg">
	            <div class="cmmtUserTxt">
	                <span>${comment.name}</span>
	                <span>@${comment.id}</span>
	                <p class="cmmtCon">${comment.content}</p>
	            </div>
	            <div class="cmmtMore">
	                <span></span>
	                <span></span>
	                <span></span>
	            </div>
	            <ul class="cmmtMoreList">
	                <li>수정</li>
	                <li onclick="deleteComment(this)">삭제</li>
	            </ul>
	        </div>
	`;
	});
// 댓글 HTML 추가
show.innerHTML = commentHTML;
}
document.querySelectorAll(".cmmtBtn").forEach(button => {
    button.addEventListener("click", function() {
        let postId = this.closest(".postAll").dataset.postId; 
        commentList(postId); 
    });
});
// 댓글 등록 JS
document.body.addEventListener('click', function(event) {
    if (event.target.matches('.addCmmtBtn')) {
        // 댓글 등록 로직 시작
        const postId = event.target.closest(".postAll").dataset.postId;
        const commentContent = event.target.parentElement.querySelector
        											('textarea[name="addCmmt"]').value;
        // 세션에서 유저 ID
        const userId = sessionStorage.getItem('id'); 
        // 위의 값들로 FormData 객체 생성
        const formData = new FormData();
        formData.append('postId', postId);
        formData.append('content', commentContent);
        formData.append('id', userId);
        // 서버에 댓글 등록 요청
        fetch('/milrim/addComment.do', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.message === "Success") {
                alert('댓글 등록 성공!');
                // 댓글 로드
				commentList(postId);
            } else {
                alert('댓글 등록 실패!');
            }
        })
        .catch(error => {
            console.error('댓글 등록 중 오류 발생:', error.message);
        });
    }
});

// 게시글 삭제 JS
function deletePost(element) {
    const postId = $(element).closest('.postAll').data('postId');
    
    // Ajax 요청을 사용하여 게시글 삭제 로직 실행
    $.ajax({
        url: `/milrim/delPost.do?postId=${postId}`,
        method: 'GET',
        success: function(response) {
            // 성공적으로 삭제되었을 때의 처리
            if (response === "Success") {
	            alert("게시글이 성공적으로 삭제되었습니다.");
	            location.href = "/milrim/community.do"; // 게시판 주소로 리다이렉트
            } else {
	            alert('작성자만 삭제할 수 있습니다.');
            }
        },
        error: function() {
            // 삭제 실패 시 처리
            alert('게시글 삭제에 실패하였습니다.');
        }
    });
}

// 댓글 삭제 JS
function deleteComment(element) {
    const commentId = $(element).closest('.cmmtUser').data('comment-id');
    const postId = $(element).closest('.postAll').data('post-id'); // postId 가져오기
    // Ajax 요청을 사용하여 댓글 삭제 로직 실행
    $.ajax({
        url: `/milrim/delComment.do?commentId=${commentId}`,
        method: 'GET',
        success: function(response) {
            // 성공적으로 삭제되었을 때의 처리
            if (response === "Success") {
                alert("댓글이 성공적으로 삭제되었습니다.");
                commentList(postId);  // 댓글 삭제 성공 후 댓글 로드
            } else {
                alert('작성자만 삭제할 수 있습니다.');
            }
        },
        error: function() {
            // 삭제 실패 시 처리
            alert('댓글 삭제에 실패하였습니다.');
        }
    });
}





$(document).on('click', '.cmmtMore', function() {
    // 현재 클릭한 .cmmtMore 요소의 바로 다음 요소인 .cmmtMoreList를 선택
    const $cmmtMoreList = $(this).next('.cmmtMoreList');
    
    // .cmmtMoreList의 표시 상태를 토글
    $cmmtMoreList.toggle();
});
