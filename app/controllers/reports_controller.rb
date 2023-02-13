class ReportsController < ApplicationController
  def index
    @pageTitle = 'Generate reports'


  end

  def report_by_category
    @pageTitle = 'Report by category'

    @array_of_category = Category.limit(10).pluck(:name)

  end

  def report_by_dates
    @pageTitle = 'Report by dates'

  end
end
