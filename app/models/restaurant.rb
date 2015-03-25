class Restaurant < ActiveRecord::Base
attr_accessor :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

                    

  def s3_credentials
    {:bucket => "atalebagha-yelpdemo", :access_key_id => ENV["aws_access_key_id"], :secret_access_key => ENV["aws_secret_access_key"]}
  end

  has_many :reviews

  validates :name, :address, :phone, :website, :city, :country, :image, presence: true
  validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/, message: "must be in (XXX) XXX-XXXX format" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/, message: "must be a valid website" }
  validates :address, format: { with:  /\A\d+[^,]+\z/, message: "Must be a valid address"}
end
