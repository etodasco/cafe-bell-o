class Admin::MenuItemsController < Admin::BaseController
  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to admin_menu_items_path, notice: "Menu item added successfully." # Updated redirect path
    else
      render :new, alert: "There was an error adding the menu item." # Render new action with alert
    end
  end

  def show
    @menu_item = MenuItem.find_by(id: params[:id])  # Safely find the menu item by ID

    if @menu_item.nil?
      redirect_to admin_menu_items_path, alert: "Menu item not found."
    end
  end

  def destroy
    @menu_item = MenuItem.find_by(id: params[:id])  # Safely find the menu item by ID

    if @menu_item&.destroy
      redirect_to admin_menu_items_path, notice: "Menu item deleted successfully."
    else
      redirect_to admin_menu_items_path, alert: "There was an error deleting the menu item."
    end
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
