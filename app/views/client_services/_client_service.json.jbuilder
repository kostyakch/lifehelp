json.extract! client_service, :id, :client_id, :service_id, :performer_id, :status,
              :review, :started_at, :finished_at

json.deleted client_service.deleted?

json.service do
  json.id client_service.service_id
  json.title client_service.service&.title
end

json.client do
  client = client_service.client
  next if client.blank?

  json.fio [client.last_name, client.first_name, client.middle_name].join(' ')
end

json.performer do
  json.id client_service.performer_id
  json.fio [client_service.performer&.last_name, client_service.performer&.first_name,
            client_service.performer&.middle_name].join(' ')
end
