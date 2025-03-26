class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_role

  def home
    @menu_items = MenuItem.all
    @menu_item = MenuItem.new
    @users = User.all
  end

  private

  def ensure_admin_role
    unless current_user.role == "admin"
      redirect_to root_path, alert: "Only admins can access this page."
    end
  end
end
