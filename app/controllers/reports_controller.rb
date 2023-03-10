class ReportsController < ApplicationController
  def index
    @pageTitle = 'Generate reports'
  end

  def report_by_category
    @pageTitle = 'Report by category for a specified period'

    begin
      # check if it is a valid date
      DateTime.parse params[:start_odate]
      DateTime.parse params[:end_odate]

      @records_report_by_category = Operation.report_by_category_method(params[:start_odate], params[:end_odate])
    rescue
      redirect_to '/reports', notice: 'Dates are incorrect! Correct format is like: 2022-01-01'
    end

  end

  def report_by_dates
    @pageTitle = 'Report by dates'

    begin
      # check if it is a valid date
      DateTime.parse params[:start_odate]
      DateTime.parse params[:end_odate]

      @records_report_by_dates = Operation.report_by_dates_method(params[:start_odate], params[:end_odate], params[:datesReportType])
    rescue
      redirect_to '/reports', notice: 'Dates are incorrect! Correct format is like: 2022-01-01'
    end

  end
end
