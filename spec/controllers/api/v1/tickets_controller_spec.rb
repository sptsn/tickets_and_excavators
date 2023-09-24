require "rails_helper"

RSpec.describe Api::V1::TicketsController do
  describe 'POST create' do
    context "when passed valid json" do
      let(:valid_json) do
        JSON.parse(File.open(Rails.root/'spec/sample_json.json').read)
      end

      it 'returns 201' do
        post :create, params: valid_json
        expect(response).to have_http_status 201
      end
    end

    context "when passed invalid json" do
      let(:invalid_json) do
        {
          foo: 'bar'
        }
      end

      it 'returns 422' do
        post :create, params: invalid_json
        expect(response).to have_http_status 422
      end
    end
  end
end