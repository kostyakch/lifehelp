require 'csv'

class ImportClientFromCsv
  class FileError < StandardError; end

  HEADERS = %w[npp fio dob address phone description area help_date help_who].freeze

  def initialize
    @file = File.open('/usr/src/app/tmp/clients.csv', 'r')
  end

  def import!
    table = CSV.read(@file, headers: true, col_sep: ',', skip_blanks: true)
    raise FileError unless table.headers == HEADERS

    table.each do |row|
      next if row.fields.compact.empty?

      row = row.to_h.symbolize_keys
      fio_arr = row[:fio].split(' ')

      attrs = row.except(:fio, :npp, :help_date, :help_who)
                 .merge(first_name: fio_arr[1],
                        last_name: fio_arr[0],
                        middle_name: fio_arr[2],
                        phone: phone_normalization(row[:phone]))

      begin
        Client.create!(attrs)
      rescue StandardError => e
        p "Err: #{e} | #{attrs.except(:description)}"
        next
      end
    end
  end

  private

  def phone_normalization(phone)
    return phone if phone.blank?

    Phonelib.parse(phone).e164.to_i
  end
end
