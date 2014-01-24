class Branch < ActiveRecord::Base
  belongs_to :user
  validates :name, :start_point, :end_point, :presence => true, :uniqueness => {:scope => [:user_id]}
end
