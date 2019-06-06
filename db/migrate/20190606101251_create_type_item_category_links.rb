class CreateTypeItemCategoryLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :type_item_category_links do |t|

      t.belongs_to :item_type, index: true
      t.belongs_to :category_type, index: true

      t.timestamps
    end
  end
end
