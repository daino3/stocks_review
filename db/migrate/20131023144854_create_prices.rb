class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :company_id
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
