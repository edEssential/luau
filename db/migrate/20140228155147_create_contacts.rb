class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :user_message
      t.string :message_text
      t.string :thanks_text
      t.timestamps
    end
  end
end