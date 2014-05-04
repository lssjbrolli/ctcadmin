json.array!(@credit_invoices) do |credit_invoice|
	json.extract! credit_invoice, :id
	json.url credit_invoice_url(credit_invoice, format: :json)
end
