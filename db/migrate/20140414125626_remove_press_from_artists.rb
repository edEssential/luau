class RemovePressFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :press1
    remove_column :artists, :press2
    remove_column :artists, :press3
  end
end
