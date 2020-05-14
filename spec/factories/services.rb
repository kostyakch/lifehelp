FactoryBot.define do
  factory :service do
    sequence(:title) { |n| "Нужно что-то сделать #{n}" }
    quantity { rand(1..999) }
    sequence(:description) { |n| "Описание услуги #{n}" }
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
