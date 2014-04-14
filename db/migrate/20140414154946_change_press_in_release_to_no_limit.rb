class ChangePressInReleaseToNoLimit < ActiveRecord::Migration
  def change
    change_column :releases, :press1, :text, :limit => nil
    change_column :releases, :press2, :text, :limit => nil
    change_column :releases, :press3, :text, :limit => nil
  end
end
