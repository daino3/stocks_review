class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :shareholder_id
      t.integer :company_id
      t.integer :price_paid
      t.integer :shares
      t.timestamps
    end
  end
end
