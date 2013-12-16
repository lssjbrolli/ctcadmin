json.array!(@debit_invoices) do |debit_invoice|
  json.extract! debit_invoice, :id
  json.url debit_invoice_url(debit_invoice, format: :json)
end
