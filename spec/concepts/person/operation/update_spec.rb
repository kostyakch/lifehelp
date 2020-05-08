require 'rails_helper'

RSpec.describe Person::Operation::Update do
  subject { described_class.new.call(nil, args) }

  describe 'call' do
    let(:person) { create(:person) }
    let(:first_name) { 'Super First' }
    let(:args) { { id: person.id, first_name: first_name, dob: 10.years.ago.to_s } }

    it { is_expected.to be_success }
    it { is_expected.to hold(person.reload) }

    context 'when not found' do
      let(:args) { { id: Person.last.to_i + 1 } }

      it { is_expected.to be_failure }
      it { is_expected.to cause(code: 404, message: I18n.t(:not_found)) }
    end
  end
end
