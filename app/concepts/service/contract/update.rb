module Service::Contract
  class Update < Create
    params do
      required(:id).filled(:string)
      optional(:title).filled(:string)
    end
  end
end
