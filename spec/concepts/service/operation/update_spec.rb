require 'rails_helper'

RSpec.describe Service::Operation::Update do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:service) { create(:service) }
    let(:title) { 'Super title' }
    let(:args) { { id: service.id, title: title } }

    it { is_expected.to be_success }
    it { is_expected.to hold(service.reload) }

    context 'when not found' do
      let(:args) { { id: 'none id' } }

      it { is_expected.to be_failure }
      it { is_expected.to cause(code: 404, message: I18n.t(:not_found)) }
    end
  end
end
