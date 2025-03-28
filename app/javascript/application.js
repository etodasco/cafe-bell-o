// Import Rails UJS and Bootstrap
import Rails from "@rails/ujs";           // Import Rails UJS
import "bootstrap";                       // Import Bootstrap for styling

Rails.start();  // Initialize Rails UJS

// Import Turbo
import "@hotwired/turbo-rails";  // Import Turbo (this is enough for Turbo functionality)

// Log to confirm everything is working
document.addEventListener('DOMContentLoaded', function() {
  console.log('DOM fully loaded and Bootstrap initialized');
});

console.log("Turbo is loaded!");
