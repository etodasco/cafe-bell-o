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
      redirect_to owner_dashboard_path, notice: "L'élément de menu a été ajouté avec succès."
    else
      redirect_to owner_dashboard_path, alert: "Une erreur est survenue lors de l'ajout de l'élément de menu."
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])  # Find the menu item to delete

    if @menu_item.destroy
      redirect_to owner_dashboard_path, notice: "L'élément de menu a été supprimé avec succès."
    else
      redirect_to owner_dashboard_path, alert: "Une erreur est survenue lors de la suppression de l'élément de menu."
    end
  end

  private

  def ensure_admin_or_owner_role
    unless current_user.role == "admin" || current_user.role == "owner"
      redirect_to root_path, alert: "Seuls les administrateurs ou les propriétaires peuvent accéder à cette page."
    end
  end

  def menu_item_params
    # Strong parameters to allow only specific fields to be used
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
