# frozen_string_literal: true

class MainpageController < ApplicationController
  before_action :signed_in_user
  before_action :user_activated

  def index
    today = Time.now.to_date
    search_params = 'expire BETWEEN ? AND ? OR expire < ?'
    @employees = Paper.where(document_type: "Employee")
    @trucks = Paper.where(document_type: "Truck").where(document: Truck.where(sold: false))
    @papers = @employees.or(@trucks).where.not(expire: nil).where(search_params, today, (today + 30.day), today).order('expire asc', 'document_type desc')
  end
end
