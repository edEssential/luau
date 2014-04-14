class ReleasesController < ApplicationController
  before_filter :authenticate_user!, except: [:release_show_via_ajax_call]

  def new
    @release = Release.new
  end
        
  def create
    @release = Release.create(params[:release])
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end
  
  def release_show_via_ajax_call
    release = Release.find(params[:id])
    press = release.press1.to_s
    if press == ""
      release_show = { :id => release.id, :artistname => release.artistname, :title => release.title, :description => release.description, :buy_link => release.buy_link }
      render :json => release_show
    else
      release_show = { :id => release.id, :artistname => release.artistname, :title => release.title, :description => release.description, :buy_link => release.buy_link, :press1 => release.press1, :presssource1 => release.presssource1 }
      render :json => release_show
    end
  end

  def index
    @release = Release.all
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def update   
    @release = Release.find(params[:id])
    if @release.update_attributes(params[:release])
      redirect_to :action => 'show', :id => @release
    else
      render :action => 'edit'
    end
  end
  
  def send_object_via_ajax
    @release = Release.find(params[:id])
    render :json => @release
  end
  
  
  def destroy
    @release = Release.find(params[:id])
    @release.destroy
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end
  
end