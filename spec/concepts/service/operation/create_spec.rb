require 'rails_helper'

RSpec.describe Service::Operation::Create do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:args) { attributes_for(:service) }

    it { is_expected.to be_success }

    context 'with missing/wrong args' do
      let(:args) { {} }

      it { is_expected.to be_failure }
      it { is_expected.to cause(title: ['is missing']) }
    end
  end
end
