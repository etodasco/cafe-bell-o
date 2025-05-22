// Import Rails UJS and Bootstrap
import Rails from "@rails/ujs";  // Import Rails UJS
import "bootstrap";              // Import Bootstrap for styling
import "@popperjs/core";         // Import Popper.js for Bootstrap's dropdowns, tooltips, etc.
import "reviews"


Rails.start();  // Initialize Rails UJS

// Import Turbo
import "@hotwired/turbo-rails";  // Import Turbo (this is enough for Turbo functionality)
