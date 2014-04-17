class ChangeUserMessageToTextForContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :user_message, :text, :limit => nil
  end
end