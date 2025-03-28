// Select all the dots and reviews
const dots = document.querySelectorAll(".dot");
const reviews = document.querySelectorAll(".review");

// Set initial active dot
let activeIndex = 0;
dots[activeIndex].classList.add("active"); // Make the first dot active

// Function to update active dot
function updateActiveDot(index) {
  // Remove active class from all dots
  dots.forEach((dot) => dot.classList.remove("active"));
  // Add active class to the current dot
  dots[index].classList.add("active");
}

// Function to show the active review
function updateActiveReview(index) {
  // Hide all reviews
  reviews.forEach((review) => review.classList.remove("active"));
  // Show the active review
  reviews[index].classList.add("active");
}

// Event listener for dots
dots.forEach((dot, index) => {
  dot.addEventListener("click", () => {
    activeIndex = index; // Update active index
    updateActiveDot(activeIndex); // Update dot
    updateActiveReview(activeIndex); // Update review
  });
});

// Optional: Automatically cycle through the reviews every 5 seconds
setInterval(() => {
  activeIndex = (activeIndex + 1) % reviews.length; // Cycle through reviews
  updateActiveDot(activeIndex); // Update dot
  updateActiveReview(activeIndex); // Update review
}, 10000);
