class Organization < ActiveRecord::Base
  belongs_to :user
  #has_attached_file :cover_image, styles: { medium: "0x300>" }
  #validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\Z/
  attachment :company_logo

  before_save :guid_generate

  def guid_generate
    self.guid = SecureRandom.uuid()
  end
end
