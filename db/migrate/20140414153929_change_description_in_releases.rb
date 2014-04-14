class ChangeDescriptionInReleases < ActiveRecord::Migration
  def change
    change_column :releases, :description, :text, :limit => nil
  end
end
