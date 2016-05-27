class Credit < ActiveRecord::Base
  belongs_to :user
  validates :credit_balance, presence: true
end
