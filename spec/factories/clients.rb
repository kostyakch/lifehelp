FactoryBot.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    dob { Faker::Date.birthday }
    sequence(:phone) { |n| format('7915%<number>07d', number: n) }

    trait :with_service do
      after(:create) do |client|
        create(:client_service, client: client, service: create(:service))
      end
    end
  end
end

# == Schema Information
#
# Table name: clients
#
#  id             :bigint(8)        not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  middle_name    :string
#  phone          :bigint(8)
#  email          :string
#  dob            :date
#  city           :string
#  address        :string
#  area           :string
#  description    :string
#  client_type    :integer          default("01_person"), not null
#  code           :integer          default("A"), not null
#  objectivity    :integer          default("01_is_not_clear"), not null
#  marital_status :integer          default("01_no_ms"), not null
#  social_status  :integer          default("01_no_ss"), not null
#  source         :integer          default("01_no_source"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  deleted_at     :datetime
#
# Indexes
#
#  index_clients_on_deleted_at                        (deleted_at)
#  index_clients_on_first_name_and_last_name_and_dob  (first_name,last_name,dob) UNIQUE
#  index_clients_on_phone                             (phone) UNIQUE
#
