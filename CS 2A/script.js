document.addEventListener('DOMContentLoaded', () => {
  // Update footer year
  const yearSpan = document.getElementById('year');
  if (yearSpan) {
    yearSpan.textContent = new Date().getFullYear();
  }

  // Smooth scrolling for nav links
  document.querySelectorAll('.sky-nav a').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const targetId = this.getAttribute('href');
      const targetSection = document.querySelector(targetId);
      if (targetSection) {
        window.scrollTo({
          top: targetSection.offsetTop - 60,
          behavior: 'smooth'
        });
      }
    });
  });

  // Contact form handler
  const contactForm = document.getElementById('contact-form');
  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      alert('Thank you for reaching out. Your message has been received.');
      contactForm.reset();
    });
  }

  // Smooth animated background gradient (Starry Night tones, no yellow at bottom)
  document.addEventListener('scroll', () => {
    const scrollTop = window.scrollY;
    const docHeight = document.body.scrollHeight - window.innerHeight;
    const scrollPercent = scrollTop / docHeight;

    // Define Starry Night gradients (only blues/indigos)
    const topSky = ["#0b1d51", "#1e3a8a"];   // deep indigo → royal blue
    const midSky = ["#1e3a8a", "#3b82f6"];   // royal blue → cyan
    const bottomSky = ["#0b1d51", "#1e3a8a"]; // back to indigo/blue

    // Helper: interpolate between two colors
    function interpolateColor(color1, color2, factor) {
      const c1 = color1.match(/\w\w/g).map(c => parseInt(c, 16));
      const c2 = color2.match(/\w\w/g).map(c => parseInt(c, 16));
      const result = c1.map((v, i) => Math.round(v + factor * (c2[i] - v)));
      return `#${result.map(v => v.toString(16).padStart(2, '0')).join('')}`;
    }

    // Decide which gradient stage we’re in
    let startColors, endColors, stageFactor;
    if (scrollPercent < 0.5) {
      startColors = topSky;
      endColors = midSky;
      stageFactor = scrollPercent / 0.5;
    } else {
      startColors = midSky;
      endColors = bottomSky;
      stageFactor = (scrollPercent - 0.5) / 0.5;
    }

    // Interpolate both gradient stops
    const color1 = interpolateColor(startColors[0], endColors[0], stageFactor);
    const color2 = interpolateColor(startColors[1], endColors[1], stageFactor);

    // Apply gradient to body
    document.body.style.background = `linear-gradient(to bottom, ${color1}, ${color2})`;
  });
});
