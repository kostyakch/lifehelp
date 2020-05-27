FactoryBot.define do
  factory :performer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    address { Faker::Address.street_address }
    sequence(:phone) { |n| format('7915%<number>07d', number: n) }
    sequence(:email) { |n| "email#{n}@test.test" }
  end
end

# == Schema Information
#
# Table name: performers
#
#  id             :uuid             not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  middle_name    :string
#  performer_type :integer          default("person"), not null
#  phone          :bigint(8)        not null
#  email          :string
#  address        :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  deleted_at     :datetime
#
# Indexes
#
#  index_performers_on_deleted_at  (deleted_at)
#
