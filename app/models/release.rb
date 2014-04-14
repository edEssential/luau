class Release < ActiveRecord::Base
  attr_accessible :artistname, :title, :description, :buy_link, :release_date, :packshot, :artist_id, :press1, :press2, :press3, :presssource1, :presssource2, :presssource3
  belongs_to :artist
  
  has_attached_file :packshot, styles: {
     thumb: '100x100>',
     square: '200x200#',
     rect: '310X205>',
     show: '180X119>',
     medium: '545x545>'
   }
   
   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :packshot, :content_type => /\Aimage\/.*\Z/
   
end