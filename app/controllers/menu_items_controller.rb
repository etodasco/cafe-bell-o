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
      redirect_to menu_items_path, notice: "Élément de menu ajouté avec succès."
    else
      render 'admin/menu_items/new', alert: "Une erreur est survenue lors de l'ajout de l'élément de menu."
    end
  end

  def edit
    render 'admin/menu_items/edit'  # Explicitly render from the admin folder
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_items_path, notice: "Élément de menu mis à jour avec succès."
    else
      render 'admin/menu_items/edit', alert: "Une erreur est survenue lors de la mise à jour de l'élément de menu."
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to menu_items_path, notice: "Élément de menu supprimé avec succès."
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :day)
  end
end
