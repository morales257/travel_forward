class Page < ActiveRecord::Base
  before_save {self.name = name.downcase}
  validates :name, presence: true
  validates :background, presence: true
  has_attached_file :background,
                    :storage =>:s3,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_ACCESS_KEY'],
                      :secret_access_key => ENV['S3_SECRET_KEY'],
                      :bucket: ENV['S3_BUCKET'] },
                    :s3_permissions => :public_read,
                    styles: { medium: "300x300>", resize: "50%"}
  validates_attachment_content_type :background, content_type: /\Aimage/

end
