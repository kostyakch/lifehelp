json.id client.id
json.fio [client.last_name, client.first_name, client.middle_name].join(' ')
json.dob client.dob
json.phone client.phone
json.address [client.city, client.address].join(' ')
json.description client.description

json.url client_path(client)
json.edit_url edit_client_path(client)
json.new_url new_client_path(client)
