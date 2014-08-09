json.array!(@national_expenses) do |national_expense|
	json.extract! national_expense, :id
	json.url national_expense_url(national_expense, format: :json)
end
