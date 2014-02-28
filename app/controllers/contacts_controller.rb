class ContactsController < ApplicationController
  before_filter :authenticate_user!, except: [:create]
  
  def create
    @contact = Contact.create(params[:contact])
    respond_to do |format|
      ContactMailer.initiate_user(@contact).deliver
      ContactMailer.initiate_admin(@contact).deliver
      format.html { redirect_to root_path }
    end
  end
  
  def index
    @contact = Contact.new
    @contacts = Contact.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv }
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def new
    @contact = Contact.new
  end

  def update   
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to cms_path
    else
      render :action => 'edit'
    end
  end
  
  def show
    redirect_to root_path
  end
  
  def update_contact_form_via_ajax
    @admin = Contact.first
    render :json => @admin
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end
  
end