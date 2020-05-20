module Service::Contract
  class Create < ::Abstract::Contract
    params do
      required(:title).filled(:string)

      optional(:quantity).maybe(:int?)
      optional(:description).maybe(:str?)
    end
  end
end
