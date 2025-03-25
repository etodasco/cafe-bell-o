class PagesController < ApplicationController
  def menu
    # Find the menu item for the current day
    @menu_item_for_today = MenuItem.find_by(day: Time.current.strftime('%A'))
  end
end
