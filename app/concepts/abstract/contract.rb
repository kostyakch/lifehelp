# frozen_string_literal: true

module Abstract
  class Contract < Dry::Validation::Contract
    register_macro(:email_format) do
      next if value.blank?

      unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        key.failure(I18n.t('errors.contract.abstract.not_valid_email'))
      end
    end

    register_macro(:date_format) do
      next if value.nil?

      Date.parse(value)
    rescue StandardError => e
      key.failure e.message
    end

    register_macro(:date_time_format) do
      next if value.nil?

      DateTime.parse(value)
    rescue StandardError => e
      key.failure e.message
    end

    register_macro(:iso8601_format) do
      next if value.blank?

      ActiveSupport::Duration.parse(value)
    rescue StandardError => e
      key.failure e.message
    end

    register_macro(:phone_format) do
      next if value.nil? || Phonelib.parse(value).valid?

      key.failure(I18n.t('errors.contract.abstract.valid_phone'))
    end
  end
end
