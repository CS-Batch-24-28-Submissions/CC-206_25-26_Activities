const body = document.body;
const themeToggle = document.querySelector(".theme-toggle");
const navLinks = document.querySelectorAll(".nav-links a");
const sections = document.querySelectorAll("main section[id]");
const filterButtons = document.querySelectorAll(".filter-button");
const projectCards = document.querySelectorAll(".project-card");
const copyEmailButton = document.querySelector(".copy-email");
const emailAddress = "karloantono.penaranda@wvsu.edu.ph";

themeToggle.addEventListener("click", () => {
  body.classList.toggle("dark");
});

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) {
        return;
      }

      navLinks.forEach((link) => {
        const isActive = link.getAttribute("href") === `#${entry.target.id}`;
        link.classList.toggle("active", isActive);
      });
    });
  },
  { rootMargin: "-35% 0px -55% 0px" }
);

sections.forEach((section) => observer.observe(section));

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    const filter = button.dataset.filter;

    filterButtons.forEach((item) => item.classList.remove("active"));
    button.classList.add("active");

    projectCards.forEach((card) => {
      const shouldShow = filter === "all" || card.dataset.category === filter;
      card.classList.toggle("is-hidden", !shouldShow);
    });
  });
});

copyEmailButton.addEventListener("click", async () => {
  try {
    await navigator.clipboard.writeText(emailAddress);
    copyEmailButton.textContent = "Copied";
    setTimeout(() => {
      copyEmailButton.textContent = "Copy Email";
    }, 1600);
  } catch {
    window.location.href = `mailto:${emailAddress}`;
  }
});
