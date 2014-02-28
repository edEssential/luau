class AddPackshotToReleases < ActiveRecord::Migration
  def self.up
    add_attachment :releases, :packshot
  end

  def self.down
    remove_attachment :releases, :packshot
  end
end
