// js/main.js
document.getElementById("year").textContent = new Date().getFullYear();

const path = location.pathname.split("/").pop() || "index.html";
document.querySelectorAll(".nav__link").forEach(a => {
    const isActive = a.getAttribute("href") === path;
    a.classList.toggle("nav__link--active", isActive);
});
