console.log("✅ reviews.js loaded");

document.addEventListener("DOMContentLoaded", function () {
    const reviews = document.querySelectorAll('.review');
    let current = 0;
  
    function cycleReviews() {
      reviews[current].classList.remove('active');
      current = (current + 1) % reviews.length;
      reviews[current].classList.add('active');
    }
  
    // Cycle every 4 seconds
    setInterval(cycleReviews, 8000);
  });
  