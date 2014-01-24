class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
       
  validates :business_name, :contact_name, :phone, :location, :presence => true
  
  has_many :invoices, :dependent => :destroy
  has_many :custom_fields, :dependent => :destroy
  has_many :custom_field_values, :dependent => :destroy
  has_many :expenses, :dependent => :destroy
  has_many :branches, :dependent => :destroy
  has_many :lr_entries, :dependent => :destroy
  has_many :lorry_challans, :dependent => :destroy
  #scopes
  scope :users, ->(id) {where(:admin_id => id)}
end
