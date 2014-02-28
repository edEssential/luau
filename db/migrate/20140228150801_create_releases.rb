class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :artist
      t.string :title
      t.text :description
      t.string :buy_link
      t.string :release_date
      t.timestamps
    end
  end
end
