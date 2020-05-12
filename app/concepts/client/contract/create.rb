module Client::Contract
  class Create < ::Abstract::Contract
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)

      optional(:middle_name).maybe(:str?)
      optional(:phone)
      optional(:email)
      optional(:dob)
      optional(:city).maybe(:str?)
      optional(:address).maybe(:str?)
      optional(:area).maybe(:str?)
      optional(:description).maybe(:str?)
      optional(:code).maybe(:str?)

      optional(:client_type).value(:string)
      optional(:objectivity).value(:string)
      optional(:marital_status).value(:string)
      optional(:social_status).value(:string)
      optional(:source).value(:string)
    end

    rule(:phone).validate(:phone_format)
    rule(:email).validate(:email_format)
    rule(:dob).validate(:date_format)
  end
end
