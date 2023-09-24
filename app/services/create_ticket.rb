require 'dry/monads/all'

class CreateTicket
  include Dry::Monads::Do
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Maybe::Mixin
  extend Dry::Initializer

  option :params

  def call
    validated_params = yield validate
    ApplicationRecord.transaction do
      ticket = yield create_ticket(validated_params)
      yield create_excavator(ticket: ticket, params: validated_params[:excavator])
    end
    Success()
  end

  private

  def validate
    result = CreateTicketContract.new.call(params)
    if result.success?
      Success(result.to_h.deep_transform_keys { _1.to_s.underscore.to_sym })
    else
      Failure[:validation_error, result.errors.to_a]
    end
  end

  def create_ticket(params)
    ticket = Ticket.new(
      **params.slice(:request_number, :sequence_number, :request_type, :request_action),
      response_due_date_time: params.dig(:date_times, :response_due_date_time),
      primary_service_area_code_sa_code: params.dig(:service_area, :primary_service_area_code, :sa_code),
      additional_service_area_codes_sa_codes: params.dig(:service_area, :additional_service_area_codes, :sa_code),
      well_known_text: parse_polygon(params.dig(:excavation_info, :digsite_info, :well_known_text))
    )
    if ticket.save!
      Success(ticket)
    else
      Failure(ticket.errors.full_messages)
    end
  end

  def create_excavator(params:, ticket:)
    excavator = Excavator.new(
      **params.slice(:company_name, :address, :crew_on_site),
      ticket: ticket
    )
    if excavator.save!
      Success(excavator)
    else
      Failure(excavator.errors.full_messages)
    end
  end

  def parse_polygon(str)
    str.gsub(/[A-Z]|[a-z]|\(|\)/, '').split(',').map { _1.split(' ').map(&:to_f).reverse }
  end
end