require 'rails_helper'

RSpec.describe ClientService::Operation::Update do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:client_service) { create(:client_service) }
    let(:review) { 'Super review' }
    let(:args) do
      { id: client_service.id, review: review,
        client_id: client_service.client_id,
        service_id: client_service.service_id,
        started_at: client_service.started_at.iso8601 }
    end

    it { is_expected.to be_success }
    it { is_expected.to hold(client_service.reload) }

    context 'when not found' do
      let(:args) do
        { id: 'none id',
          client_id: client_service.client_id,
          service_id: client_service.service_id,
          started_at: client_service.started_at.iso8601 }
      end

      it { is_expected.to be_failure }
      it { is_expected.to cause(code: 404, message: I18n.t(:not_found)) }
    end
  end
end
