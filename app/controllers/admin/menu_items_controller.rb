class Admin::MenuItemsController < Admin::BaseController
  before_action :find_menu_item, only: [:edit, :update, :destroy, :show]

  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to admin_menu_items_path, notice: "Menu item added successfully."
    else
      render :new, alert: "There was an error adding the menu item."
    end
  end

  def edit
    # This action will render the edit form
  end

  def show
    # Automatically renders app/views/admin/menu_items/show.html.erb
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: "Menu item updated successfully."
    else
      render :edit, alert: "There was an error updating the menu item."
    end
  end

  def destroy
    if @menu_item.destroy
      redirect_to admin_menu_items_path, notice: "Menu item deleted successfully."
    else
      redirect_to admin_menu_items_path, alert: "There was an error deleting the menu item."
    end
  end

  private

  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
