class Company < ActiveRecord::Base
  has_many :prices
  has_many :trades
  has_many :shareholders, through: :trades # will jump to trades table and check for shareholder. If you change shareholders to some other name, you would need to add a source
end
