module ClientService::Contract
  class Create < ::Abstract::Contract
    params do
      required(:client_id).filled(:integer)
      required(:service_id).filled(:string)
      optional(:performer_id).maybe(:str?)
      required(:started_at).filled(:string)

      optional(:status).maybe(:str?)
      optional(:review).maybe(:str?)
      optional(:finished_at)
    end
    rule(:started_at).validate(:date_time_format)
    rule(:finished_at).validate(:date_time_format)

    rule(:status) do
      next if value.blank?

      if values[:finished_at].blank? && values[:status] == '03_completed'
        values[:finished_at] = Time.current
      end
      values[:finished_at] = nil unless values[:status] == '03_completed'
    end
  end
end
