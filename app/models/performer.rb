class Performer < ApplicationRecord
  enum performer_type: %i[person volontier organization]

  scope :sorted, -> { reorder(last_name: :asc, first_name: :asc) }
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
#  phone          :string           not null
#  email          :string
#  address        :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
