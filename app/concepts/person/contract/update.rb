module Person::Contract
  class Update < Create
    params do
      required(:id).filled(:integer)
      optional(:first_name).filled(:string)
      optional(:last_name).filled(:string)
    end
  end
end
