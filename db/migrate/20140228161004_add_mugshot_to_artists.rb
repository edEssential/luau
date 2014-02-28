class AddMugshotToArtists < ActiveRecord::Migration
  def self.up
    add_attachment :artists, :mugshot
  end

  def self.down
    remove_attachment :artists, :mugshot
  end
end
