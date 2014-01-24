class Expense < ActiveRecord::Base
   belongs_to :user
   validates :name, :towards, :amount, :presence => true
end
