class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :name
      t.string :industry
    end
  end
end
