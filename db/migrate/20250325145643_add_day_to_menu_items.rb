class AddDayToMenuItems < ActiveRecord::Migration[7.2]
  def change
    add_column :menu_items, :day, :string
  end
end
