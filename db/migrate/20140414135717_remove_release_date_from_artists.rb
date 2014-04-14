class RemoveReleaseDateFromArtists < ActiveRecord::Migration
  def up
    remove_column :artists, :release_date, :string
  end

  def down
    add_column :artists, :release_date, :string
  end
end
