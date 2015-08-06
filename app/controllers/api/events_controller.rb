class API::EventsController < ApplicationController

   skip_before_action :verify_authenticity_token
   before_action :authenticate_user!

   def create
      registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

      Event.create(params[:event])
    @event = registered_application.new(params.require(:registered_application).permit(:name,:url))

   
      # if registered_application
      # # @event = Event.new(event_params)
      #   name = params[:event][:name]
      #   # seed = params[:event][:event]
      #   @event = registered_application.events.new(name: name)

      #   if @event.save
      #     render json: @event, status: :created
      #   else
      #     render @event.errors, status: :unprocessable_entity
      #   end
      # else
      #   render json: "Unregistered application", status: :unprocessable_entity
      # end
   end
 
   def show
     @events = @registered_application.events.group_by(&:name)
   end

  private
   def event_params
      params.require(:event).permit(:name)
   end
end