module CreditNotesHelper

  def truck(cn)
    unless cn.truck.nil?
      cn.truck.registration
    end
  end

  def paid(cn)
    if cn.paid?
      '<i class="glyphicon glyphicon-ok"></i>'
    else
      '<i class="glyphicon glyphicon-remove"></i>'
    end
  end

end
