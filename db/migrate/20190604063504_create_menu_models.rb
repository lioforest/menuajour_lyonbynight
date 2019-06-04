class CreateMenuModels < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_models do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
