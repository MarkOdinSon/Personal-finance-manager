class ReportsController < ApplicationController
  def index
    @pageTitle = 'Generate reports'


  end

  def report_by_category
    @pageTitle = 'Report by category'

    Operation.report_by_category_method(params[:start_odate], params[:end_odate])

    Operation.report_by_category_method('2019-01-01', '2022-01-01')



  end

  def report_by_dates
    @pageTitle = 'Report by dates'

  end
end
