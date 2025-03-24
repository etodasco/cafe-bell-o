class PagesController < ApplicationController
  def menu
    @menu_items = MenuItem.all
  end
end
