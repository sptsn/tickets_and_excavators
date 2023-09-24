class Api::V1::TicketsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    result = CreateTicket.new(params: params.permit!.to_h).call

    case result
    in Success()
      render json: {
        success: true
      }, status: 201
    in Failure[:validation_error, errors]
      render json: {
        success: false,
        errors: errors
      }, status: 422
    in Failure(_)
      render json: {
        success: false
      }, status: 500
    end
  end
end