# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def home
    # Admin dashboard home view (can display summary data, stats, etc.)
  end

  def edit
  end

  private

  def check_admin
    # Ensure the user is an admin
    redirect_to root_path unless current_user.admin?
  end
end
