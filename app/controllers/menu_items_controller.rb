class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
    render 'admin/menu_items/index'  # Explicitly render from the admin folder
  end

  def show
    render 'admin/menu_items/show'  # Explicitly render from the admin folder
  end

  def new
    @menu_item = MenuItem.new
    render 'admin/menu_items/new'  # Explicitly render from the admin folder
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to menu_items_path, notice: "Menu item added successfully."
    else
      render 'admin/menu_items/new', alert: "There was an error adding the menu item."
    end
  end

  def edit
    render 'admin/menu_items/edit'  # Explicitly render from the admin folder
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_items_path, notice: "Menu item updated successfully."
    else
      render 'admin/menu_items/edit', alert: "There was an error updating the menu item."
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to menu_items_path, notice: "Menu item deleted successfully."
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
