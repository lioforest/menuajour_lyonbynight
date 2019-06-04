class CreateModelCategoryLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :model_category_links do |t|
      t.belongs_to :menu_category, index: true
      t.belongs_to :menu_model, index: true
      t.timestamps
    end
  end
end
