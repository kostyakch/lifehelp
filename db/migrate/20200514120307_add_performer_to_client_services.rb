class AddPerformerToClientServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :client_services, :performer, foreign_key: true, type: :uuid
  end
end
