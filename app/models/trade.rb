class Trade < ActiveRecord::Base
  belongs_to :shareholder, class_name: "User" # renaming user to shareholder, but making shareholder = user (model)
  belongs_to :company
end
