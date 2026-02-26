//Get elements
const contactBtn = document.getElementById("contactBtn");
const closeBtn = document.getElementById("closeBtn");
const sidebar = document.getElementById("contactSidebar");
const overlay = document.getElementById("overlay");

//Function to open sidebar
contactBtn.addEventListener("click", function(e) {
    e.preventDefault();
    sidebar.classList.add("active");
    overlay.classList.add("active");
});

//Function to close sidebar
closeBtn.addEventListener("click", function() {
    sidebar.classList.remove("active");
    overlay.classList.remove("active");
});

//Close the sidebar when click outside the sidebar
overlay.addEventListener("click", function() {
    sidebar.classList.remove("active");
    overlay.classList.remove("active");
});