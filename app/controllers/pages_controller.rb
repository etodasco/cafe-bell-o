class PagesController < ApplicationController
  before_action :set_locale  # Set locale before every action

  def home
    french_days = {
      "Monday" => "Lundi",
      "Tuesday" => "Mardi",
      "Wednesday" => "Mercredi",
      "Thursday" => "Jeudi",
      "Friday" => "Vendredi",
      "Saturday" => "Samedi",
      "Sunday" => "Dimanche"
    }
  
    today_in_french = french_days[Time.current.strftime('%A')]
  
    @special_of_the_day = MenuItem.find_by(
      category: "Spéciale du Jour",
      day: today_in_french
    )
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
