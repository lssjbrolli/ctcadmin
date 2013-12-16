json.array!(@credit_notes) do |credit_note|
  json.extract! credit_note, :id
  json.url credit_note_url(credit_note, format: :json)
end
