class Invoice < ActiveRecord::Base
  belongs_to :user
  has_barcode :margin => 5, :height => 40   #, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "uploaded_files/photo/:id/:style/:basename.:extension", :bucket => S3_BUCKET_NAME
  has_many :custom_field_values, :dependent => :destroy
  before_create :bilty_no_generation
  
  validates :to_location, :from_location, :bilty_date, :presence => true
  def combo_no
    [self.bilty_no, self.to_location, self.from_location].join
  end
  
  def barcodable
    :combo_no
  end
  
  def self.total_on(date)
    where("date(created_at) = ?",date).count
  end
  
  protected
  def bilty_no_generation
    self.bilty_no = SecureRandom.random_number(1000000)
  end
  
end
