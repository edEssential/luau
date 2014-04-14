class AddPressSourceToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :presssource1, :string
    add_column :releases, :presssource2, :string
    add_column :releases, :presssource3, :string
  end
end
