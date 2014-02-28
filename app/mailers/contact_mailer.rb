class ContactMailer < ActionMailer::Base
  
  default from: "\"info@luaurecords.com\"<ed_hamilton@live.com>"
  
  def initiate_user(contact)
    @contact = contact
    mail(to: @contact.email, subject: "Thankyou for getting in touch!")
  end
  
  def initiate_admin(contact)
    @contact = contact
    mail(from: @contact.email, to: "ed_hamilton@live.com", bcc: "ed_hamilton@live.com", subject: "New message from the website!")
  end
  
  def contacts_xls(contacts, user)
    @contacts = contacts
    @user = User.find_by_id(user)
    @filename = "Contacts List.xls"
    attachments[@filename] = {:mime_type => 'text/xls', :content => render(:file => 'contacts/contacts_xls.xls.erb')}
    mail(:to => "#{@user.email}", :subject => "Website contacts list attached", :body => "")
  end
  
end