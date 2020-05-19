class Client < ApplicationRecord
  include Phonable
  has_many :client_services, dependent: :destroy
  has_many :services, through: :client_services

  enum client_type: %i[01_person 02_organization]
  enum code: %i[A B C D]
  enum objectivity: %i[01_is_not_clear 02_objectively 03_subjectively]
  enum marital_status: %i[01_no_ms 02_small 03_middle 04_normal 05_good]
  enum social_status: %i[01_no_ss 02_single_mother 03_large 04_disabled 05_unemployed
                         06_bum 07_migrant 08_refugee 09_dependent 10_old 11_others]
  enum source: %i[01_no_source 02_direct_call 03_call_center 04_volunteers
                  05_no_commercial_org 06_commercial_org]

  scope :sorted, -> { reorder(last_name: :asc, first_name: :asc) }
  scope :search_for, lambda { |query|
    where("CONCAT_WS(' ', clients.last_name, clients.first_name,
      clients.middle_name) ILIKE :q OR clients.city ILIKE :q OR clients.phone ILIKE :q",
          q: "%#{query&.squish}%")
  }
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
#
