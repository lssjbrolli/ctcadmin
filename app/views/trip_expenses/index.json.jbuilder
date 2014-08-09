json.array!(@trip_expenses) do |trip_expense|
	json.extract! trip_expense, :id
	json.url trip_expense_url(trip_expense, format: :json)
end
