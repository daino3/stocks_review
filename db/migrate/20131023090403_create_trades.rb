class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :price_paid
      t.integer :shares
      t.timestamps
    end
  end
end
