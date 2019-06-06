class CreateMenuCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_categories do |t|
      t.integer :order

      t.belongs_to :menu, index: true
      t.belongs_to :category_type, index: true

      t.timestamps
    end
  end
end
