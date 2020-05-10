module Client::Operation
  class Update < ::Abstract::Operation
    def call(actor, args)
      super
      return Failure(invalid) if validation.failure?

      maybe_client.bind do |client|
        return Try() { update_client(client) }.to_result
      end

      failure_404
    end

    private

    def maybe_client
      Maybe(Client.find_by(id: valid[:id]))
    end

    def update_client(client)
      client.update!(valid)
      client
    end
  end
end
