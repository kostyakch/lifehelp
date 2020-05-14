module ClientService::Operation
  class Update < ::Abstract::Operation
    def call(actor, args)
      super
      return Failure(invalid) if validation.failure?

      maybe_service.bind do |service|
        return Try() { update_service(service) }.to_result
      end

      failure_404
    end

    private

    def maybe_service
      Maybe(ClientService.find_by(id: valid[:id]))
    end

    def update_service(service)
      service.update!(valid)
      service
    end
  end
end
