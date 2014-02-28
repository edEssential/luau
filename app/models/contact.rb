class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_message, :message_text, :thanks_text
end
