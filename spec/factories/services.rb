FactoryBot.define do
  factory :service do
    sequence(:title) { |n| "My service #{n}" }
    quantity { rand(1..999) }
    sequence(:description) { |n| "Description #{n}" }
  end
end

# == Schema Information
#
# Table name: services
#
#  id          :uuid             not null, primary key
#  title       :string           not null
#  quantity    :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
