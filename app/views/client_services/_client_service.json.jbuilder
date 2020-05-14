json.extract! client_service, :id, :client_id, :service_id, :performer_id, :status,
              :review, :started_at, :finished_at

json.service do
  json.id client_service.service_id
  json.title client_service.service&.title
end

json.client do
  next if client_service.client.blank?

  json.fio [client_service.client.last_name, client_service.client.first_name,
            client_service.client.middle_name].join(' ')
end

json.performer do
  json.id client_service.performer_id
  json.fio [client_service.performer&.last_name, client_service.performer&.first_name,
            client_service.performer&.middle_name].join(' ')
end
