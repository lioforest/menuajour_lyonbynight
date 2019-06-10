class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
    	t.text :name
    	t.datetime :start_date
    	t.datetime :end_date
    	t.decimal :price
    	t.belongs_to :user, index: true
      t.timestamps

    end
  end
end
