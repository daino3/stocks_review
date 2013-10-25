class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: { with: /\w+@\w+\.\w{2,}/, message: "incorrect email format" }
  
  has_many :trades, foreign_key: :shareholder_id # specify foreign key because otherwise AR will look for 'user_id' (model name) in trades table
  has_many :companies, through: :trades 

  has_secure_password
end
