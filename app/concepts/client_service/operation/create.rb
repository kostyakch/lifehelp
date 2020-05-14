module ClientService::Operation
  class Create < ::Abstract::Operation
    def call(actor, args)
      super
      return Failure(invalid) if validation.failure?

      Try() { ClientService.create!(valid) }.to_result
    end
  end
end
