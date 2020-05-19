class Performer < ApplicationRecord
  include Phonable
  enum performer_type: %i[person volontier organization]

  scope :sorted, -> { reorder(last_name: :asc, first_name: :asc) }
  scope :search_for, lambda { |query|
    where("CONCAT_WS(' ', performers.last_name, performers.first_name,
      performers.middle_name) ILIKE :q", q: "%#{query&.squish}%")
  }
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
#
