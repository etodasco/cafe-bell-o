class MenuItem < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true

  # Callback to translate the day before saving
  before_save :translate_day_to_english

  # Define the DAY_MAP constant at the class level
  DAY_MAP = {
    "lundi" => "Monday",
    "mardi" => "Tuesday",
    "mercredi" => "Wednesday",
    "jeudi" => "Thursday",
    "vendredi" => "Friday",
    "samedi" => "Saturday",
    "dimanche" => "Sunday"
  }

  private

  # Method to translate day input from French to English
  def translate_day(day_in_french)
    DAY_MAP[day_in_french.downcase] || day_in_french
  end

  # Callback method that triggers translation before save
  def translate_day_to_english
    self.day = translate_day(self.day) if self.day.present?
  end
end
