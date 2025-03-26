class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # Authenticate user only when accessing admin pages
  before_action :authenticate_user!, if: :admin_page?

  # Skip the admin check during sign in and sign up processes
  before_action :check_admin_user, unless: -> { devise_controller? || !user_signed_in? }

  # Restrict sign-up for non-admins only for Devise's registration actions
  before_action :restrict_signup_for_non_admins, if: :devise_registration_controller?

  # Customize redirect path after sign out
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) && resource_or_scope.admin?
      root_path # Redirect to homepage for admin
    else
      super # Default behavior for non-admin users
    end
  end

  private

  # This method checks if the current page is an admin page (e.g., pages that require admin access)
  def admin_page?
    request.path.start_with?('/admin')  # Example: /admin/* pages are for admin
  end

  # Ensure only admins can sign in
  def check_admin_user
    if user_signed_in? && !current_user.admin?
      sign_out current_user
      redirect_to root_path, alert: "Only the admin can sign in."
    end
  end

  # Restrict sign-up to only admins
  def restrict_signup_for_non_admins
    if User.exists?(admin: true)
      redirect_to root_path, alert: "Only the admin can create an account."
    end
  end

  # Check if the current controller is Devise's registrations controller
  def devise_registration_controller?
    devise_controller? && controller_name == 'registrations'
  end
end
