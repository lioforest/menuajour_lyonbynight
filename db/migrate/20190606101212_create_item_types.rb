class CreateItemTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_types do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
