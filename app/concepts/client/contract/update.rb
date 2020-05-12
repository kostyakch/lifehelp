module Client::Contract
  class Update < Create
    params do
      required(:id).filled(:integer)
      optional(:first_name).maybe(:str?)
      optional(:last_name).maybe(:str?)
    end
  end
end
