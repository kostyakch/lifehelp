FactoryBot.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    sequence(:phone) { |n| format('7915%<number>07d', number: n) }
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
#  phone          :string
#  email          :string
#  dob            :date
#  city           :string
#  address        :string
#  area           :string
#  description    :string
#  client_type    :integer          default("person"), not null
#  code           :integer          default("A"), not null
#  objectivity    :integer          default("is_not_clear"), not null
#  marital_status :integer          default("no_ms"), not null
#  social_status  :integer          default("no_ss"), not null
#  source         :integer          default("no_source"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
