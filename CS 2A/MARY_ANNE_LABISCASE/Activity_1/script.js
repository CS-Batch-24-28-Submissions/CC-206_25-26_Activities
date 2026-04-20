/* ======================== STICKY NAVBAR ======================== */
let header = document.querySelector('.header');

window.onscroll = () => {
    // header background change on scroll
    header.classList.toggle('sticky', window.scrollY > 100);
};

/* ======================== SCROLL REVEAL ======================== */
const observerOptions = {
    threshold: 0.2
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('show-items');
        }
    });
}, observerOptions);

// Target all sections and skill boxes for the animation
const scrollElements = document.querySelectorAll('section, .skills-box, .contact-container');
scrollElements.forEach(el => {
    el.classList.add('hidden-items'); 
    observer.observe(el);
});

/* ======================== FORM SUBMISSION (MOCK) ======================== */
const contactForm = document.querySelector('form');
contactForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const btn = document.querySelector('.send-btn');
    const originalText = btn.innerHTML;
    
    // Change button text to show it's "sending"
    btn.innerHTML = "Sending... <i class='bx bx-loader-alt bx-spin'></i>";
    
    setTimeout(() => {
        alert('Thank you, Mary Anne received your message!');
        btn.innerHTML = originalText;
        contactForm.reset();
    }, 2000);
});
