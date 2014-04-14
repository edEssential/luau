class ChangeDescriptionInReleases < ActiveRecord::Migration
  def change
    change_column :releases, :description, :string, :limit => nil
  end
end
