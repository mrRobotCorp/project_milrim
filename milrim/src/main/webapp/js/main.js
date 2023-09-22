// ------------------- 요일 별 백그라운드 변경 ----------------
let date = new Date();
let day = date.getDay();

const dayList = document.querySelectorAll(".dayList");

for(let i=0; i<7; i++) {
    if (day == i+1) {
        dayList[i].style.background = "#fff4bb";
        dayList[i].style.border = "none";
    } else if (day == 0) {
        dayList[6].style.background = "#fff4bb";
        dayList[6].style.border = "none";
    }
};

AOS.init({
    once: true,
});
$(window).on('load', function () {
    AOS.refresh();
});


$(document).ready(function(){
	// ----- slider ------
    $('.slider').slick({
        dots: true, 
        arrow: true,
        infinite: true, 
        autoplay: true,
        autoplaySpeed : 1800,
        slidesToShow: 1,
        slidesToScroll: 1, 
    });
});
var tagVal = '';
$(document).ready(function() {
	// 메인 리스트 조회  + 검색 
	videoList();
	$("#schBtn").on('click', function () {
	    videoList();
	});
	$("#title").keyup(function(){
		tagVal = '';
		$("input[name='tag']").prop('checked', false);
		videoList();
	});
	// 선택한 태그 벨류값 할당
    $("input[name='tag']").on('change', function() {
        if ($(this).prop('checked')) {
            tagVal = $(this).val();
            console.log("Selected tag:", tagVal);
            videoList()
        }
    });
});
function videoList() {
    var title = $('#title').val() || '';
	var tagName = tagVal || '';
	// AJAX 처리
    $.ajax({
        type: "post",
        url: "schVideos.do",
        data: { title: title, tagName: tagName },
        dataType: "json",
        success: function(data) {
            const days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
            days.forEach(day => {
                let add = "";
                data.forEach(function(list) {
                    if(list.dayOfWeek === day) {
                        add += "<li>";
                        add += "<a href='video.do?videoId=" + list.videoId + "'>";
                        add += "<img class='thumbnail' src='./source/images/" + list.image + ".jpg'>";
                        add += "</a>";
                        add += "<span>" + list.title + "</span>";
                        add += "</li>";
                    }
                });
                $('#list' + day).html(add);
            });
        }
    });
}