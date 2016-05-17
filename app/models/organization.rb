class Organization < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  before_save :guid_generate

  def guid_generate
    self.guid = SecureRandom.uuid()
  end
end
