class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # Authenticate user only when accessing admin pages
  before_action :authenticate_user!, if: :admin_page?

  # Customize redirect path after sign out
  def after_sign_out_path_for(resource_or_scope)
    # If the current user is an admin, redirect to the homepage after sign out
    if current_user&.admin?
      root_path # Redirect to homepage
    else
      super # Default behavior for non-admin users
    end
  end

  private

  # This method checks if the current page is an admin page (e.g., pages that require admin access)
  def admin_page?
    request.path.start_with?('/admin')  # Example: /admin/* pages are for admin
  end
end
