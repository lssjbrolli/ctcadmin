module TripExpensesHelper
  def card(trip_expense)
    if trip_expense.card
      '<i class="glyphicon glyphicon-ok"></i>'
    else
      '<i class="glyphicon glyphicon-remove"></i>'
    end
  end
end
