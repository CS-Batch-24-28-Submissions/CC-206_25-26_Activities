// Get modal elements
const modal = document.getElementById("modal");
const modalImg = document.getElementById("modalImg");

// Open image viewer
function openModal(src) {
    modal.style.display = "flex";
    modalImg.src = src;
}

// Close viewer
function closeModal() {
    modal.style.display = "none";
}