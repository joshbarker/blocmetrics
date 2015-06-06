class RegisteredApplicationsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
     @registered_applications = current_user.registered_applications
  end


  def new
    @user = current_user
    @registered_application = RegisteredApplication.new
  end
  
  def create
    @registered_application = RegisteredApplication.new(params.require(:registered_application).permit(:name,:url))
    @registered_application.user = current_user
      if @registered_application.save
        flash[:notice] = "Domain Was Saved" 
        redirect_to registered_applications_path
      else 
        flash[:error] = "There was an error saving the domain. Please try again."
        render :new
      end
  end

  def show
     @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
  end

  def destroy
     @registered_application = RegisteredApplication.find(params[:id])
     # @registered_application.user = current_user
     @registered_application.destroy
     redirect_to registered_applications_path

     # respond_to do |format|
     #   format.html
     #   format.js
     # end
  end
end
