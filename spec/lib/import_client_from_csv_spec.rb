require 'rails_helper'

RSpec.describe ImportClientFromCsv do
  subject(:import!) { described_class.new.import! }

  describe 'import!' do
    it { expect { import! }.to change(Client, :count).by(110) }
  end
end
