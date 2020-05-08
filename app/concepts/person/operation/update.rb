module Person::Operation
  class Update < ::Abstract::Operation
    def call(actor, args)
      super
      return Failure(invalid) if validation.failure?

      maybe_person.bind do |person|
        return Try() { update_person(person) }.to_result
      end

      failure_404
    end

    private

    def maybe_person
      Maybe(Person.find_by(id: valid[:id]))
    end

    def update_person(person)
      person.update!(valid)
      person
    end
  end
end
