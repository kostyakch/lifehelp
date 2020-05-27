class Service < ApplicationRecord
  has_many :client_services
  has_many :clients, through: :client_services

  validates :title, uniqueness: true

  scope :sorted, -> { reorder(title: :asc) }
  scope :search_for, ->(q) { where 'services.title ILIKE :q', q: "%#{q&.squish}%" }
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
#  deleted_at  :datetime
#
# Indexes
#
#  index_services_on_deleted_at  (deleted_at)
#
