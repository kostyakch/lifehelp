require 'rails_helper'

RSpec.describe Performer::Operation::Update do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:performer) { create(:performer) }
    let(:args) do
      { id: performer.id, first_name: 'First', last_name: 'Last',
        phone: performer.phone }
    end

    it { is_expected.to be_success }
    it { is_expected.to hold(performer.reload) }

    context 'when not found' do
      before { args[:id] = 'not found id' }

      it { is_expected.to be_failure }
      it { is_expected.to cause(code: 404, message: I18n.t(:not_found)) }
    end
  end
end
