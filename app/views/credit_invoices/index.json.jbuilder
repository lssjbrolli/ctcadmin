json.array!(@cinvoices) do |credit_invoice|
	json.extract! credit_invoice, :id
	json.url credit_invoice_url(credit_invoice, format: :json)
end
