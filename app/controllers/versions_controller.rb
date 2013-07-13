class VersionsController < ApplicationController
  layout 'version'
  load_and_authorize_resource
  
  def index
    @versions = Version.all
  end
  
  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}."
  end                       
             
end