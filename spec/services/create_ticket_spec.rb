require "rails_helper"

RSpec.describe CreateTicket do
  context 'when passed valid json' do
    let(:valid_json) do
      JSON.parse(File.open(Rails.root/'spec/sample_json.json').read)
    end

    it 'creates data' do
      result = nil
      expect { result = described_class.new(params: valid_json).call }
        .to change { Ticket.count }.by(1)
        .and change { Excavator.count }.by(1)
      expect(result).to be_success
    end
  end

  context 'when passed invalid json' do
    let(:invalid_json) do
      {
        foo: 'bar'
      }
    end

    it 'does not create data' do
      result = nil
      expect { result = described_class.new(params: invalid_json).call }
        .to change { Ticket.count }.by(0)
        .and change { Excavator.count }.by(0)
      expect(result).to be_failure
    end
  end
end