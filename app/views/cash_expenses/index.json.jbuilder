json.array!(@cash_expenses) do |cash_expense|
	json.extract! cash_expense, :id
	json.url cash_expense_url(cash_expense, format: :json)
end
