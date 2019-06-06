class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.integer :order

      t.belongs_to :menu_category, index: true
      t.belongs_to :item_type, index: true
      t.timestamps
    end
  end
end
