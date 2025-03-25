class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  
  # Authenticate user only when accessing admin pages
  before_action :authenticate_user!, if: :admin_page?

  private

  # This method checks if the current page is an admin page (e.g., pages that require admin access)
  def admin_page?
    # Add the paths or conditions that correspond to admin pages
    request.path.start_with?('/admin')  # Example: /admin/* pages are for admin
  end
end
