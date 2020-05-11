json.array! clients do |client|
  json.partial! 'client.json', client: client
end
