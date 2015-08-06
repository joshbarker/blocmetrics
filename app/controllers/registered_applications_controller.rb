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
     @events = @registered_application.events.group_by(&:name)
     @events = @registered_application.events.count(params[:id])
  end


  def edit
     @registered_application = RegisteredApplication.find(params[:id])
  end


  def update
      @registered_application = RegisteredApplication.find(params[:id])

      if @registered_application.update_attributes(params.require(:registered_application).permit(:name, :url))
        flash[:notice] = "Domain was updated."
        redirect_to registered_applications_path
      else
        flash[:error] = "There was an error saving the domain. Please try again."
        render :edit
      end
      
  end

  def destroy
     @registered_application = RegisteredApplication.find(params[:id])
     # @registered_application.user = current_user
     @registered_application.destroy
     #    flash[:notice] = "Registered Application was removed."
     # else
     #   flash[:error] = "Registered Application couldn't be deleted. Try again."
     # end
     # # redirect_to registered_applications_path

     respond_to do |format|
        format.html { redirect_to registered_applications_path, notice: 'Registered application was successfully destroyed.' }
        format.json { head :no_content }
     end
  end

end
