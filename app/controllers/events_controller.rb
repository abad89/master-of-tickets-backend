class EventsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        events = Event.all
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
