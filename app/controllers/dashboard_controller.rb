class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_role

  def index
    @menu_items = MenuItem.all
    @menu_item = MenuItem.new
    @users = User.all
  end

  private

  def ensure_admin_role
    unless current_user.role == "admin"
      redirect_to root_path, alert: "Seuls les administrateurs peuvent accéder à cette page."
    end
  end
end
