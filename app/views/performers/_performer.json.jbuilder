json.extract! performer, :id, :first_name, :last_name, :middle_name,
              :performer_type, :phone, :email, :address, :description

json.fio [performer.last_name, performer.first_name, performer.middle_name].join(' ')
