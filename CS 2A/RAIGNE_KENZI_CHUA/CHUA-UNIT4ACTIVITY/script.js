document.addEventListener('DOMContentLoaded', () => {

    // ── Footer year ──────────────────────────────────────────────────────────
    const yearEl = document.getElementById('year');
    if (yearEl) yearEl.textContent = new Date().getFullYear();

    // ── Typewriter effect ─────────────────────────────────────────────────────
    const phrases = [
        'Game Development',
        'Creative Coding',
        'Interactive Tech',
        'CS Projects',
    ];
    const twEl    = document.getElementById('typewriter');
    let pIdx      = 0;
    let cIdx      = 0;
    let deleting  = false;
    const TYPE_SPD   = 80;
    const DEL_SPD    = 35;
    const PAUSE_FULL = 1800;
    const PAUSE_EMPTY = 500;

    function typeLoop() {
        if (!twEl) return;
        const current = phrases[pIdx];

        if (deleting) {
            twEl.textContent = current.slice(0, --cIdx);
            if (cIdx === 0) {
                deleting = false;
                pIdx = (pIdx + 1) % phrases.length;
                setTimeout(typeLoop, PAUSE_EMPTY);
                return;
            }
            setTimeout(typeLoop, DEL_SPD);
        } else {
            twEl.textContent = current.slice(0, ++cIdx);
            if (cIdx === current.length) {
                deleting = true;
                setTimeout(typeLoop, PAUSE_FULL);
                return;
            }
            setTimeout(typeLoop, TYPE_SPD);
        }
    }
    typeLoop();

    // ── Mobile nav toggle ─────────────────────────────────────────────────────
    const navToggle  = document.getElementById('nav-toggle');
    const mobileMenu = document.getElementById('mobile-menu');

    if (navToggle && mobileMenu) {
        navToggle.addEventListener('click', () => {
            const open = mobileMenu.classList.toggle('open');
            navToggle.querySelector('i').className = open
                ? 'fa-solid fa-xmark'
                : 'fa-solid fa-bars';
        });

        // Close on mobile link click
        mobileMenu.querySelectorAll('.mobile-link').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.remove('open');
                navToggle.querySelector('i').className = 'fa-solid fa-bars';
            });
        });

        // Close if clicking outside
        document.addEventListener('click', (e) => {
            const navbar = document.getElementById('navbar');
            if (navbar && !navbar.contains(e.target)) {
                mobileMenu.classList.remove('open');
                navToggle.querySelector('i').className = 'fa-solid fa-bars';
            }
        });
    }

    // ── Smooth scroll for all in-page anchors ─────────────────────────────────
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            const target   = document.querySelector(targetId);
            if (!target) return;
            e.preventDefault();
            const navH = document.getElementById('navbar')?.offsetHeight || 70;
            const top  = target.getBoundingClientRect().top + window.scrollY - navH - 16;
            window.scrollTo({ top, behavior: 'smooth' });
        });
    });

    // ── Active nav link on scroll ─────────────────────────────────────────────
    const sections  = document.querySelectorAll('section[id], main section[id]');
    const navLinks  = document.querySelectorAll('.nav-link');

    function updateActiveLink() {
        const navH    = document.getElementById('navbar')?.offsetHeight || 70;
        const scrollY = window.scrollY + navH + 40;

        let current = '';
        sections.forEach(section => {
            if (section.offsetTop <= scrollY) current = section.id;
        });

        navLinks.forEach(link => {
            link.classList.toggle(
                'active',
                link.getAttribute('href') === `#${current}`
            );
        });
    }

    window.addEventListener('scroll', updateActiveLink, { passive: true });
    updateActiveLink();

    // ── Scroll reveal ─────────────────────────────────────────────────────────
    const revealEls = document.querySelectorAll('.reveal');
    const revealObs = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) entry.target.classList.add('visible');
            // uncomment below to re-hide on scroll back up:
            // else entry.target.classList.remove('visible');
        });
    }, { threshold: 0.12 });

    revealEls.forEach(el => revealObs.observe(el));

});
