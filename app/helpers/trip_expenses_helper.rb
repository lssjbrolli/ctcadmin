module TripExpensesHelper
  def card(cn)
    if cn.card
      '<i class="glyphicon glyphicon-ok"></i>'
    else
      '<i class="glyphicon glyphicon-remove"></i>'
    end
  end
end
