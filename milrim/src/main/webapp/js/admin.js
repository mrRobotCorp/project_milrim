// -------------------- 사이드 탭 --------------------------
const tabs = document.querySelectorAll(".nav li");
const href = window.location.href;

if (href.includes("mem")) {
    tabs[0].classList.add("active");
    tabs[1].classList.remove("active");
    tabs[2].classList.remove("active");
} else if (href.includes("vid")) {
    tabs[0].classList.remove("active");
    tabs[1].classList.add("active");
    tabs[2].classList.remove("active");
} else {
    tabs[0].classList.remove("active");
    tabs[1].classList.remove("active");
    tabs[2].classList.add("active");
}



