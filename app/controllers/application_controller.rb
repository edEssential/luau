class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @releases = Release.order("id DESC")
    @artists = Artist.order("id ASC")
    @contact = Contact.new
    @contacts = Contact.all
    @admin = Contact.first
  end
  
end