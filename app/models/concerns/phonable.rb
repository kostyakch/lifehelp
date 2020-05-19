# frozen_string_literal: true

module Phonable
  extend ActiveSupport::Concern

  included do
    def phone=(value)
      super value

      res = Phonelib.parse(value)
      super res.e164.to_i if res.valid?
    end
  end
end
