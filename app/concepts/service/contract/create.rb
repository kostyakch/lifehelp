module Service::Contract
  class Create < ::Abstract::Contract
    params do
      required(:title).filled(:string)

      optional(:quantity).value(:integer)
      optional(:description).value(:string)
    end
  end
end
