class LrEntry < ActiveRecord::Base
  belongs_to :user
  has_barcode :margin => 5, :height => 40   #, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "uploaded_files/photo/:id/:style/:basename.:extension", :bucket => S3_BUCKET_NAME
  has_many :custom_field_values, :dependent => :destroy
  
  validates :to_station, :from_station, :lr_date, :lr_no, :presence => true
  has_attached_file :pod, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :pod, :content_type => /\Aimage\/.*\Z/
  def combo_no
    [self.lr_no, self.to_station, self.from_station].join
  end
  
  def barcodable
    :combo_no
  end
  
  def self.total_on(date)
    where("date(created_at) = ?",date).count
  end
  
end
