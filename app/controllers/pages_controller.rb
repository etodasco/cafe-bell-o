class PagesController < ApplicationController
  before_action :set_locale  # Set locale before every action

  def home
    # Fetch today's special for the home page
    @menu_item_for_today = MenuItem.find_by(day: Time.current.strftime('%A'))
  end

  def menu
    # Fetch all menu items for the menu page
    @menu_items = MenuItem.all
  end

  private

  def set_locale
    I18n.locale = :'fr-CA'  # Explicitly set the French Canadian locale for the app
  end
end
