class OwnersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_or_owner_role

  def dashboard
    @menu_items = MenuItem.all # Show all menu items on the dashboard
    @menu_item = MenuItem.new  # For the form to create a new menu item
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)  # Create a new menu item with user input

    if @menu_item.save
      redirect_to owner_dashboard_path, notice: "Menu item added successfully."
    else
      redirect_to owner_dashboard_path, alert: "There was an error adding the menu item."
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])  # Find the menu item to delete

    if @menu_item.destroy
      redirect_to owner_dashboard_path, notice: "Menu item deleted successfully."
    else
      redirect_to owner_dashboard_path, alert: "There was an error deleting the menu item."
    end
  end

  private

  def ensure_admin_or_owner_role
    unless current_user.role == "admin" || current_user.role == "owner"
      redirect_to root_path, alert: "Only admins or owners can access this page."
    end
  end

  def menu_item_params
    # Strong parameters to allow only specific fields to be used
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
