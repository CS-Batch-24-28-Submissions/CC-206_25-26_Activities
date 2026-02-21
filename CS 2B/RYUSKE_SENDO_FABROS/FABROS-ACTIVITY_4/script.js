document.addEventListener('DOMContentLoaded', () => {
    // Update footer year
    document.getElementById('year').textContent = new Date().getFullYear();

    // Smooth scrolling for navigation links
    document.querySelectorAll('nav a').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetSector = document.querySelector(targetId);

            window.scrollTo({
                top: targetSector.offsetTop - 80,
                behavior: 'smooth'
            });
        });
    });

    // Reveal elements on scroll
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.glass').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'all 0.6s ease-out';
        observer.observe(card);
    });

    // Contact Form Submission Handling using mailto
    const contactForm = document.getElementById('contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const name = contactForm.querySelector('[name="name"]').value;
            const email = contactForm.querySelector('[name="email"]').value;
            const message = contactForm.querySelector('[name="message"]').value;
            
            const recipientEmail = 'ryuskesendo.fabros@edu.ph';
            
            const subject = encodeURIComponent(`Portfolio Message from ${name}`);
            const body = encodeURIComponent(
                `${message}`
            );
            
            window.location.href = `mailto:${recipientEmail}?subject=${subject}&body=${body}`;
            
            contactForm.reset();
        });
    }
});