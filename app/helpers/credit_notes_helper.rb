# frozen_string_literal: true

module CreditNotesHelper
  def truck(credit_note)
    credit_note.truck&.registration
  end

  def paid(credit_note)
    if credit_note.paid?
      '<i class="glyphicon glyphicon-ok"></i>'
    else
      '<i class="glyphicon glyphicon-remove"></i>'
    end
  end
end
