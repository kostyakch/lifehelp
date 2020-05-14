module Performer::Operation
  class Update < ::Abstract::Operation
    def call(actor, args)
      super
      return Failure(invalid) if validation.failure?

      maybe_performer.bind do |performer|
        return Try() { update_performer(performer) }.to_result
      end

      failure_404
    end

    private

    def maybe_performer
      Maybe(Performer.find_by(id: valid[:id]))
    end

    def update_performer(performer)
      performer.update!(valid)
      performer
    end
  end
end
