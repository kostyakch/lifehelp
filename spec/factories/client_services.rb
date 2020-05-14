FactoryBot.define do
  factory :client_service do
    started_at { Faker::Date.between(from: 2.month.ago, to: Date.current) }
    sequence(:review) { |n| "Отзыв #{n}" }
    association :client
    association :service

    trait :started do
      before(:create) do |cs|
        cs.started_at = 1.day.ago
      end
    end

    trait :completed do
      before(:create) do |cs|
        cs.started_at = 1.day.ago
        cs.finished_at = 1.hour.ago
      end
    end
  end
end

# == Schema Information
#
# Table name: client_services
#
#  id           :uuid             not null, primary key
#  client_id    :bigint(8)        not null
#  service_id   :uuid             not null
#  status       :integer          default("started"), not null
#  started_at   :datetime         not null
#  finished_at  :datetime
#  review       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  performer_id :uuid
#
# Indexes
#
#  index_client_services_on_client_id     (client_id)
#  index_client_services_on_performer_id  (performer_id)
#  index_client_services_on_service_id    (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (performer_id => performers.id)
#  fk_rails_...  (service_id => services.id)
#
