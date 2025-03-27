module MenuItemsHelper
  # Map for English to French days of the week
  DAY_MAP_FRENCH = {
    "Monday" => "lundi",
    "Tuesday" => "mardi",
    "Wednesday" => "mercredi",
    "Thursday" => "jeudi",
    "Friday" => "vendredi",
    "Saturday" => "samedi",
    "Sunday" => "dimanche"
  }

  def translate_day_to_french(day_in_english)
    DAY_MAP_FRENCH[day_in_english] || day_in_english
  end
end
