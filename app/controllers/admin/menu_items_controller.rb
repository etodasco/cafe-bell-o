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
      redirect_to admin_menu_items_path, notice: "Élément de menu ajouté avec succès."
    else
      render :new, alert: "Une erreur s'est produite lors de l'ajout de l'élément de menu."
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
      redirect_to admin_menu_items_path, notice: "Élément de menu mis à jour avec succès."
    else
      render :edit, alert: "Une erreur s’est produite lors de la mise à jour de l’élément de menu."
    end
  end

  def destroy
    if @menu_item.destroy
      redirect_to admin_menu_items_path, notice: "Élément de menu supprimé avec succès."
    else
      redirect_to admin_menu_items_path, alert: "Une erreur s’est produite lors de la suppression de l’élément de menu."
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
