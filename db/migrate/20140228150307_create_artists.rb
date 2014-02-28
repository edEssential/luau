class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :website_url
      t.string :release_date
      t.text :press1
      t.text :press2
      t.text :press3
      t.timestamps
    end
  end
end
