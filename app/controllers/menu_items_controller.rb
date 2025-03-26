class Admin::MenuItemsController < Admin::BaseController
  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to admin_root_path, notice: "Menu item added successfully."  # Updated redirect path
    else
      redirect_to admin_root_path, alert: "There was an error adding the menu item."
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])  # Find the menu item by ID
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.destroy
      redirect_to admin_root_path, notice: "Menu item deleted successfully."
    else
      redirect_to admin_root_path, alert: "There was an error deleting the menu item."
    end
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
