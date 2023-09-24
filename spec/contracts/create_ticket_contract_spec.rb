require "rails_helper"

RSpec.describe CreateTicketContract do
  context 'when passed valid json' do
    let(:valid_json) do
      JSON.parse(File.open(Rails.root/'spec/sample_json.json').read)
    end

    it 'success' do
      expect(described_class.new.call(valid_json)).to be_success
    end
  end

  context 'when passed invalid json' do
    let(:invalid_json) do
      {
        foo: 'bar'
      }
    end

    it 'failure' do
      expect(described_class.new.call(invalid_json)).to be_failure
    end
  end
end