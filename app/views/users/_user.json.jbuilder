json.extract! user, :id, :first_name, :last_name, :middle_name, :phone, :email
json.fio [user.last_name, user.first_name, user.middle_name].join(' ')
