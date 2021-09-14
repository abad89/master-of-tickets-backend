class EventsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        if params[:user_id]
            user=User.find(params[:user_id])
            events=user.events
        else
            events = Event.all
        end
        render json: events
    end

    def show
        event = find_event
        render json: event
    end

    def create
        event = Event.create(event_params)
        render json: event, status: :created
    end

    def update
        event = find_event
        event.update(event_params)
        render json: event
    end

    def destroy
        event = find_event
        event.destroy
        render json: {}
    end

    #POST event/:id/buy
    def buy
        user = User.find_by(id: session[:user_id])
        event = find_event
        ticket = Ticket.create(user_id: user.id, event_id: event.id)
        render json: ticket, status: :created
    end

    private

    def event_params
        params.permit(:name, :date, :time, :hosted_by)
    end

    def find_event
        Event.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Event not found" }, status: :not_found
    end
end 
