json.array!(@expenses) do |expense|
  json.extract! expense, :id, :number, :date, :description, :value, :value_ron
  json.url expense_url(expense, format: :json)
end
