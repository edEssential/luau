class AddPressToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :press1, :string
    add_column :releases, :press2, :string
    add_column :releases, :press3, :string
  end
end
