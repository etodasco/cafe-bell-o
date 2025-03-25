class AddDayToMenuItems < ActiveRecord::Migration[8.0]
  def change
    add_column :menu_items, :day, :string
  end
end
