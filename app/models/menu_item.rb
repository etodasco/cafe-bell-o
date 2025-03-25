class MenuItem < ApplicationRecord
  validates :day, presence: true, inclusion: { in: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday), message: "%{value} is not a valid day" }
end
