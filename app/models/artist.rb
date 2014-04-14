class Artist < ActiveRecord::Base
  attr_accessible :name, :bio, :website_url, :mugshot
  has_many :releases
  
  has_attached_file :mugshot, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '545x545>'
    }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :mugshot, :content_type => /\Aimage\/.*\Z/

end