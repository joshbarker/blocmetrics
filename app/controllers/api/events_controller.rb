class API::EventsController < ApplicationController

   skip_before_action :verify_authenticity_token
   before_action :authenticate_user!

   before_filter :set_access_control_headers

   def set_access_control_headers
 # #1
     headers['Access-Control-Allow-Origin'] = '*'
 # #2
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 # #3
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end

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
      #params.require(:event).permit(:name)
      params.permit(:event_name)
   end
end