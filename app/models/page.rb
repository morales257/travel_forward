class Page < ActiveRecord::Base
  before_save {self.name = name.downcase}
  validates :name, presence: true
  validates :background, presence: true
  has_attached_file :background,
                    :storage =>:s3,
                    :s3_host_name => 's3-us-west-2.amazonaws.com',
                    :s3_credentials => File.new('config/s3_info.yml'),
                    :s3_permissions => :public_read,
                    styles: { medium: "300x300>", resize: "50%"}
  validates_attachment_content_type :background, content_type: /\Aimage/

end
