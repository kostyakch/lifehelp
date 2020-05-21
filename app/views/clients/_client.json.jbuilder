json.extract! client, :id, :first_name, :last_name, :middle_name, :phone, :email,
              :city, :address, :area, :description, :client_type, :code, :objectivity, 
              :marital_status, :social_status, :source

json.fio [client.last_name, client.first_name, client.middle_name].join(' ')
json.dob client.dob&.iso8601
json.updated_at client.updated_at&.iso8601
