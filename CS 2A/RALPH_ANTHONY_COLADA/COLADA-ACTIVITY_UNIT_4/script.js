// ========================================
// Ralph's Portfolio - Script
// ========================================

// ========================================
// Hero blackout on scroll down
// ========================================
(function () {
    const spacer = document.querySelector('.hero-scroll-spacer');
    const blackout = document.querySelector('.hero-blackout');
    if (!spacer || !blackout) return;

    window.addEventListener('scroll', function () {
        const scrollY = window.scrollY;
        const heroHeight = window.innerHeight;
        const fadeZone = spacer.offsetHeight - heroHeight;

        if (scrollY <= 0) {
            blackout.style.opacity = 0;
        } else if (scrollY < fadeZone) {
            const progress = scrollY / fadeZone;
            blackout.style.opacity = progress;
        } else {
            blackout.style.opacity = 1;
        }
    });
})();

// Smooth scroll for all anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            e.preventDefault();
            target.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
    });
});

// ========================================
// Active nav link on scroll (IntersectionObserver)
// ========================================
(function () {
    const navLinks = document.querySelectorAll('.nav-link[data-section]');
    const sections = document.querySelectorAll('section[id]');

    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                navLinks.forEach(link => link.classList.remove('active'));
                const activeLink = document.querySelector(
                    '.nav-link[data-section="' + entry.target.id + '"]'
                );
                if (activeLink) activeLink.classList.add('active');
            }
        });
    }, {
        rootMargin: '-40% 0px -55% 0px',
        threshold: 0
    });

    sections.forEach(section => observer.observe(section));
})();

// ========================================
// Navbar color change on dark sections
// ========================================
(function () {
    const navbar = document.querySelector('.navbar');
    const darkSections = document.querySelectorAll('.introduction, .work');
    const contactSection = document.querySelector('.contact');

    function checkNavbarPosition() {
        const navbarRect = navbar.getBoundingClientRect();
        const navbarMid = navbarRect.top + navbarRect.height / 2;
        let isOverDark = false;
        let isOverContact = false;

        darkSections.forEach(section => {
            const rect = section.getBoundingClientRect();
            if (navbarMid >= rect.top && navbarMid <= rect.bottom) {
                isOverDark = true;
            }
        });

        if (contactSection) {
            const contactRect = contactSection.getBoundingClientRect();
            if (navbarMid >= contactRect.top && navbarMid <= contactRect.bottom) {
                isOverContact = true;
            }
        }

        if (isOverDark) {
            navbar.classList.add('nav-light');
        } else {
            navbar.classList.remove('nav-light');
        }

        if (isOverContact) {
            navbar.classList.add('nav-contact');
        } else {
            navbar.classList.remove('nav-contact');
        }
    }

    window.addEventListener('scroll', checkNavbarPosition);
    checkNavbarPosition();
})();

// Contact form handler (placeholder)
const contactForm = document.getElementById('contactForm');
contactForm.addEventListener('submit', function (e) {
    e.preventDefault();
    alert('Thank you for your message! I will get back to you soon.');
    contactForm.reset();
});

// ========================================
// Typing animation for hero roles
// ========================================
(function () {
    const roles = [
        'Computer Scientist',
        'Video Editor',
        'Game Developer',
        'Music Producer',
        'Motion Designer',
        '3D Modeler',
        'Photo Editor'
    ];

    const el = document.getElementById('typed-role');
    const TYPE_SPEED = 80;   // ms per character typed
    const DELETE_SPEED = 45; // ms per character deleted
    const PAUSE_AFTER_TYPE = 2000; // pause before deleting
    const PAUSE_AFTER_DELETE = 400; // pause before typing next

    let roleIndex = 0;
    let charIndex = 0;
    let isDeleting = false;

    function tick() {
        const currentRole = roles[roleIndex];

        if (!isDeleting) {
            // Typing forward
            charIndex++;
            el.textContent = currentRole.slice(0, charIndex);

            if (charIndex === currentRole.length) {
                // Finished typing — pause, then start deleting
                isDeleting = true;
                setTimeout(tick, PAUSE_AFTER_TYPE);
                return;
            }
            setTimeout(tick, TYPE_SPEED);
        } else {
            // Deleting backward
            charIndex--;
            el.textContent = currentRole.slice(0, charIndex);

            if (charIndex === 0) {
                // Finished deleting — move to next role
                isDeleting = false;
                roleIndex = (roleIndex + 1) % roles.length;
                setTimeout(tick, PAUSE_AFTER_DELETE);
                return;
            }
            setTimeout(tick, DELETE_SPEED);
        }
    }

    // Start the animation
    setTimeout(tick, 500);
})();

// ========================================
// Intro text word hover bump
// ========================================
(function () {
    const introText = document.querySelector('.intro-text');
    const quoteText = document.querySelector('.intro-quote p');
    
    function wrapWords(el) {
        if (!el) return;
        const nodes = Array.from(el.childNodes);
        el.innerHTML = '';
        nodes.forEach(node => {
            if (node.nodeType === Node.TEXT_NODE) {
                const words = node.textContent.split(/( +)/);
                words.forEach(word => {
                    if (word.trim() === '') {
                        el.appendChild(document.createTextNode(word));
                    } else {
                        const span = document.createElement('span');
                        span.className = 'hover-word';
                        span.textContent = word;
                        el.appendChild(span);
                    }
                });
            } else if (node.nodeType === Node.ELEMENT_NODE) {
                const clone = node.cloneNode(false);
                const innerWords = node.textContent.split(/( +)/);
                innerWords.forEach(word => {
                    if (word.trim() === '') {
                        clone.appendChild(document.createTextNode(word));
                    } else {
                        const span = document.createElement('span');
                        span.className = 'hover-word';
                        span.textContent = word;
                        clone.appendChild(span);
                    }
                });
                el.appendChild(clone);
            }
        });
    }

    wrapWords(introText);
    wrapWords(quoteText);
})();
