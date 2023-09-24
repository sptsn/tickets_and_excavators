class TicketsController < ApplicationController
  def index
    @tickets = Ticket.preload(:excavator)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end