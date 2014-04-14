class ChangeArtistToArtistnameInReleases < ActiveRecord::Migration
  def up
    rename_column :releases, :artist, :artistname
  end

  def down
    rename_column :releases, :artistname, :artist
  end
end
