class MenuItem < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true

  # Callback to translate the day to French before saving
  before_save :translate_day_to_french

  # Map English day names to French day names
  DAY_MAP = {
    "Monday" => "Lundi",
    "Tuesday" => "Mardi",
    "Wednesday" => "Mercredi",
    "Thursday" => "Jeudi",
    "Friday" => "Vendredi",
    "Saturday" => "Samedi",
    "Sunday" => "Dimanche"
  }

  private

  # Translate English day name to French, or keep original if not found
  def translate_day_to_french
    if self.day.present? && DAY_MAP.key?(self.day)
      self.day = DAY_MAP[self.day]
    end
  end
end
