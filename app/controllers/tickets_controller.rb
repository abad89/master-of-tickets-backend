class TicketsController < ApplicationController

    def create
        ticket = Ticket.create(ticket_params)
        render json: ticket, status: :created
    end

    def index
        if params[:user_id]
            user=User.find(params[:user_id])
            tickets=user.tickets
            render json: tickets, include: :event
        else
            tickets = Ticket.all
            render json: tickets
        end
    end

    def show
        ticket = find_ticket
        render json: ticket
    end
    

    private

    def ticket_params
        params.permit(:user_id, :event_id)
    end

    def find_ticket
        Ticket.find(params[:id])
    end
end