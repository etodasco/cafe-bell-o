# app/controllers/admin/menu_items_controller.rb
class Admin::MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to admin_menu_items_path, notice: "Menu item created successfully."
    else
      render :new
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: "Menu item updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to admin_menu_items_path, notice: "Menu item deleted successfully."
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :day, :category, :image)
  end

  def check_admin
    # Ensure the user is an admin
    redirect_to root_path unless current_user.admin?
  end
end
