json.array!(@card_expenses) do |card_expense|
	json.extract! card_expense, :id
	json.url card_expense_url(card_expense, format: :json)
end
