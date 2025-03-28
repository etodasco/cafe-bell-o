// Import Rails UJS first for proper initialization
import Rails from "@rails/ujs";
Rails.start();  // Initialize Rails UJS

// Import Turbo for Turbo Drive (if you're using Turbo for page navigation)
import { Turbo } from "@hotwired/turbo-rails";

// Import Stimulus controllers
import "controllers";

// Import Bootstrap for styling (ensure Bootstrap JS works for dropdowns, modals, etc.)
import "bootstrap";
