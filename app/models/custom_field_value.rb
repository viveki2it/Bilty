class CustomFieldValue < ActiveRecord::Base
  belongs_to :user
  belongs_to :invoce
  belongs_to :custom_field
end
