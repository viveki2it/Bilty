class LorryChallan < ActiveRecord::Base
  belongs_to :user
  
  def self.total_on(date)
    where("date(created_at) = ?",date).count
  end
end
