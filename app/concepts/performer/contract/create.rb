module Performer::Contract
  class Create < ::Abstract::Contract
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      optional(:middle_name).maybe(:str?)
      required(:phone)
      optional(:email)

      optional(:performer_type).maybe(:str?)
      optional(:address).maybe(:str?)
      optional(:description).maybe(:str?)
    end

    rule(:phone).validate(:phone_format)
    rule(:email).validate(:email_format)
  end
end
