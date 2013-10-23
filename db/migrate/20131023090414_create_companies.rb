class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :stock_id
      t.string :name
      t.integer :revenue
      t.integer :expenses
      t.string :industry
    end

  end
end
