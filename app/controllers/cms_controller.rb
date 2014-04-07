class CmsController < ApplicationController
  before_filter :authenticate_user! #:except => [:show, :index]
  
  def index
    bring_in_models
  end
  
  def contacts_xls
    contacts = Contact.all
    ContactMailer.contacts_xls(contacts, current_user.id).deliver
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end
  
end