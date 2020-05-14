require 'rails_helper'

RSpec.describe ClientService::Operation::Create do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:client) { create(:client) }
    let(:service) { create(:service) }
    let(:args) { { client_id: client.id, service_id: service.id, started_at: 1.hour.ago.iso8601 } }

    it { is_expected.to be_success }

    context 'with missing/wrong args' do
      let(:args) { {} }

      it { is_expected.to be_failure }

      it {
        is_expected.to cause(
          client_id: ['is missing'],
          service_id: ['is missing'],
          started_at: ['is missing']
        )
      }
    end
  end
end
