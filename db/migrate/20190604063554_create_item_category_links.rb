class CreateItemCategoryLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :item_category_links do |t|
      t.belongs_to :menu_item, index: true
      t.belongs_to :menu_category, index: true
      t.timestamps
    end
  end
end
