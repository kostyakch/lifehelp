# frozen_string_literal: true

module TimeHelper
  def seconds(iso_period)
    ActiveSupport::Duration.parse(iso_period).to_i
  end

  def today_at(iso_period)
    Time.zone.now.beginning_of_day + seconds(iso_period)
  end

  def today_date
    Time.zone.now.to_date.to_s
  end
end
