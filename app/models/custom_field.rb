class CustomField < ActiveRecord::Base
  #Associations
  belongs_to :user
  has_many :custom_field_values, :dependent => :destroy
  validates :label, :uniqueness => {:scope => [:user_id], :message => "Custom field is already created"}, :presence => true
end
