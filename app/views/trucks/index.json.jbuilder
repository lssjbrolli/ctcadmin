json.array!(@trucks) do |truck|
  json.extract! truck, :id, :registration
  json.url truck_url(truck, format: :json)
end
