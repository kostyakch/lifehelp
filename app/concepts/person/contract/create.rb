module Person::Contract
  class Create < ::Abstract::Contract
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)

      optional(:middle_name).value(:string)
      optional(:phone)
      optional(:dob)
      optional(:city).value(:string)
      optional(:address).value(:string)
      optional(:area).value(:string)
      optional(:code).value(:string)
      optional(:objectivity).value(:string)
      optional(:marital_status).value(:string)
      optional(:social_status).value(:string)
      optional(:source).value(:string)
    end

    rule(:phone).validate(:phone_format)
    rule(:dob).validate(:date_format)
  end
end
