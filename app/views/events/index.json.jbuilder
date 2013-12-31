json.array!(@events) do |event|
  json.extract! event, :id, :date, :km, :comment
  json.url event_url(event, format: :json)
end
