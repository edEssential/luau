class ChangeMessageToTextForContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :message_text, :text, :limit => nil
  end
end