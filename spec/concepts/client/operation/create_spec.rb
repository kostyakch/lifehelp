require 'rails_helper'

RSpec.describe Client::Operation::Create do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:args) { attributes_for(:client) }

    it { is_expected.to be_success }

    context 'with missing/wrong args' do
      let(:args) { {} }

      it { is_expected.to be_failure }
      it { is_expected.to cause(first_name: ['is missing'], last_name: ['is missing']) }
    end
  end
end
