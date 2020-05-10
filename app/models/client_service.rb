class ClientService < ApplicationRecord
  belongs_to :client
  belongs_to :service

  enum status: %i[started completed]
end

# == Schema Information
#
# Table name: client_services
#
#  id          :uuid             not null, primary key
#  client_id   :bigint(8)        not null
#  service_id  :uuid             not null
#  status      :integer          default("started"), not null
#  started_at  :datetime         not null
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_client_services_on_client_id   (client_id)
#  index_client_services_on_service_id  (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (service_id => services.id)
#
