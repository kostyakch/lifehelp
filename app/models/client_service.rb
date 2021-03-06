class ClientService < ApplicationRecord
  belongs_to :client, foreign_key: 'client_id', with_deleted: true
  belongs_to :service
  belongs_to :performer, optional: true

  enum status: %i[01_started 02_in_work 03_completed]

  scope :sorted, lambda {
                   includes(:client, :service, :performer)
                     .with_deleted
                     .reorder('client_services.started_at desc', 'clients.last_name asc')
                 }
  scope :by_client, ->(client_id) { includes(:client).where(client_id: client_id) }
  scope :search_for, lambda { |query|
    includes(:client, :service, :performer)
      .references(:client, :service, :performer)
      .where("CONCAT_WS(' ', clients.last_name, clients.first_name,
      clients.middle_name) ILIKE :q OR services.title ILIKE :q OR
      CONCAT_WS(' ', performers.last_name, performers.first_name,
      performers.middle_name) ILIKE :q", q: "%#{query&.squish}%")
      .with_deleted
  }

  scope :started, ->(date) { where('started_at >= ?', date) }
  scope :finished, ->(date) { where('finished_at < ?', date) }
  scope :filter_by_start_finish, ->(started, finished) { started(started).finished(finished) }
end

# == Schema Information
#
# Table name: client_services
#
#  id           :uuid             not null, primary key
#  client_id    :bigint(8)        not null
#  service_id   :uuid             not null
#  status       :integer          default("01_started"), not null
#  started_at   :datetime         not null
#  finished_at  :datetime
#  review       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  performer_id :uuid
#  deleted_at   :datetime
#
# Indexes
#
#  index_client_services_on_client_id     (client_id)
#  index_client_services_on_deleted_at    (deleted_at)
#  index_client_services_on_performer_id  (performer_id)
#  index_client_services_on_service_id    (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (performer_id => performers.id)
#  fk_rails_...  (service_id => services.id)
#
