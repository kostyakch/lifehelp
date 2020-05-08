class Person < ApplicationRecord
  enum code: %i[A B C D]
  enum objectivity: %i[is_not_clear objectively subjectively]
  enum marital_status: %i[no_ms single_mother large]
  enum social_status: %i[no_ss disabled unemployed]
  enum source: %i[no_source direct_call call_center volunteers no_commercial_org commercial_org]
end

# == Schema Information
#
# Table name: people
#
#  id             :bigint(8)        not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  middle_name    :string
#  phone          :string
#  dob            :date
#  city           :string
#  address        :string
#  area           :string
#  description    :string
#  code           :integer          default("A"), not null
#  objectivity    :integer          default("is_not_clear"), not null
#  marital_status :integer          default("no_ms"), not null
#  social_status  :integer          default("no_ss"), not null
#  source         :integer          default("no_source"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
