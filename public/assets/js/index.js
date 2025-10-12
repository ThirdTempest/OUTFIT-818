const slides = document.querySelectorAll('.hero-slide');
const nextBtn = document.getElementById('carousel-next');
const prevBtn = document.getElementById('carousel-prev');
let current = 0;
let slideInterval;
const featured_carousel = document.getElementById('new-arrivals-carousel');
const nextBtn2 = document.getElementById('new-arrivals-next');
const prevBtn2 = document.getElementById('new-arrivals-prev');


// Show slide by index
function showSlide(index) {
    slides.forEach(slide => slide.classList.remove('active'));
    slides[index].classList.add('active');
}

// Go to next/prev
function nextSlide() {
    current = (current + 1) % slides.length;
    showSlide(current);
}

function prevSlide() {
    current = (current - 1 + slides.length) % slides.length;
    showSlide(current);
}

// Start or restart the interval
function startAutoSlide() {
    clearInterval(slideInterval); // Clear old timer
    slideInterval = setInterval(nextSlide, 5000); // Start new timer
}

// Event listeners with timer reset
nextBtn.addEventListener('click', () => {
    nextSlide();
    startAutoSlide(); // Reset timer
});

prevBtn.addEventListener('click', () => {
    prevSlide();
    startAutoSlide(); // Reset timer
});

// Start auto sliding on load
startAutoSlide();

// Featured Carousel

const getScrollAmount = () => {
    const card = featured_carousel.querySelector('.product-card');
    const gap = 24; // 1.5rem
    return card.offsetWidth + gap;
};

let currentIndex = 0;
const cards = featured_carousel.querySelectorAll('.product-card');
const totalCards = cards.length;

const visibleCards = Math.floor(
    featured_carousel.offsetWidth / getScrollAmount()
);

nextBtn2.addEventListener('click', () => {
    const scrollAmount = getScrollAmount();
    currentIndex++;

    if (currentIndex >= totalCards - visibleCards + 1) {
        currentIndex = 0;
    }

    featured_carousel.scrollTo({
        left: scrollAmount * currentIndex,
        behavior: 'smooth',
    });
});

prevBtn2.addEventListener('click', () => {
    const scrollAmount = getScrollAmount();
    currentIndex--;

    if (currentIndex < 0) {
        currentIndex = totalCards - visibleCards;
    }

    featured_carousel.scrollTo({
        left: scrollAmount * currentIndex,
        behavior: 'smooth',
    });
});

let isDown = false;
let startX, scrollLeft;

featured_carousel.addEventListener('mousedown', (e) => {
    isDown = true;
    featured_carousel.classList.add('dragging');
    startX = e.pageX - featured_carousel.offsetLeft;
    scrollLeft = featured_carousel.scrollLeft;
});

featured_carousel.addEventListener('mouseleave', () => {
    isDown = false;
    featured_carousel.classList.remove('dragging');
});

featured_carousel.addEventListener('mouseup', () => {
    isDown = false;
    featured_carousel.classList.remove('dragging');
});

featured_carousel.addEventListener('mousemove', (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.pageX - featured_carousel.offsetLeft;
    const walk = (x - startX) * 1.2; // Adjust drag speed
    featured_carousel.scrollLeft = scrollLeft - walk;
});

featured_carousel.addEventListener('touchstart', (e) => {
    isDown = true;
    startX = e.touches[0].pageX - featured_carousel.offsetLeft;
    scrollLeft = featured_carousel.scrollLeft;
});

featured_carousel.addEventListener('touchend', () => {
    isDown = false;
});

featured_carousel.addEventListener('touchmove', (e) => {
    if (!isDown) return;
    const x = e.touches[0].pageX - featured_carousel.offsetLeft;
    const walk = (x - startX) * 1.2;
    featured_carousel.scrollLeft = scrollLeft - walk;
});

featured_carousel.addEventListener('selectstart', (e) => {
    if (isDown) e.preventDefault();
});
