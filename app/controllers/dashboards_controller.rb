class DashboardsController < ApplicationController
  def index
    if params[:from_date].present? && params[:to_date].present?
      if params[:to_date].to_date >  params[:from_date].to_date
        #        if (params[:to_date].to_date - params[:from_date].to_date).to_i > 90
        @data = (params[:from_date].to_datetime.beginning_of_day..params[:to_date].to_datetime.end_of_day).map { |date| current_user.invoices.total_on(date).to_f}.inspect
        @pointInterval = 1.day.to_i * 1000
        @pointStart = params[:from_date].to_datetime.beginning_of_day.to_i * 1000 
        #        else
        #          @days_def = ((params[:to_date].to_datetime - params[:from_date].to_datetime).to_i/30).to_i
        #          @data = (params[:from_date].to_datetime.beginning_of_day..params[:to_date].to_datetime.end_of_day).map { |date| current_user.invoices.total_on(date).to_f}.inspect
        #          @pointInterval = 1.day.to_i * 1000
        #          @pointStart = params[:from_date].to_datetime.beginning_of_day.to_i * 1000 
        #        end
      else
        @error = "To date must be greater than to From date."
      end
    else
      @data = (1.month.ago.to_datetime.beginning_of_day..Time.zone.now.end_of_day).map { |date| current_user.invoices.total_on(date).to_f}.inspect
      @pointInterval = 1.day * 1000
      @pointStart = 1.month.ago.at_midnight.to_i * 1000
    end
    @admins = User.where("role_type='admin'")
    @users = User.where("role_type='user'")
  end
end
