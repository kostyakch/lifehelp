module ClientService::Contract
  class Update < Create
    params do
      required(:id).filled(:string)
    end
  end
end
