// Scroll reveal animation

const reveals = document.querySelectorAll(".reveal");

window.addEventListener("scroll", () => {

  reveals.forEach(reveal => {

    const windowHeight = window.innerHeight;
    const revealTop = reveal.getBoundingClientRect().top;

    if(revealTop < windowHeight - 100){
      reveal.classList.add("active");
    }

  });

});