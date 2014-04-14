class RemovePressFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :press1, :string
    remove_column :artists, :press2, :string
    remove_column :artists, :press3, :string
  end
end
