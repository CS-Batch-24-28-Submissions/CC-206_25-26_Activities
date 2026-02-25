// MOBILE MENU
const menuBtn = document.getElementById("menuBtn");
const navMenu = document.getElementById("navMenu");

menuBtn.onclick = () => {
    navMenu.classList.toggle("active");
};

// TYPING EFFECT
const roles = ["SOFTWARE DEVELOPER", "UI DESIGNER", "STUDENT"];
let i = 0;
let j = 0;
let currentRole = "";
let isDeleting = false;

function type(){
    currentRole = roles[i];

    if(!isDeleting){
        document.getElementById("typing").textContent =
        currentRole.substring(0,j++);
        if(j > currentRole.length){
            isDeleting = true;
            setTimeout(type,1000);
            return;
        }
    }else{
        document.getElementById("typing").textContent =
        currentRole.substring(0,j--);
        if(j==0){
            isDeleting=false;
            i=(i+1)%roles.length;
        }
    }
    setTimeout(type,100);
}
type();



document.getElementById("contactForm").addEventListener("submit", function(e){
    e.preventDefault();
    alert("Message Sent! (This is just a demo)");
});