require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get page report by category" do
    get '/reports/report_by_category?start_odate=2022-01-01&end_odate=2023-01-01'
    assert_response :success
  end

  test "should get page report by dates perDay" do
    get '/reports/report_by_dates?start_odate=2022-01-01&end_odate=2023-01-01&datesReportType=perDay'
    assert_response :success
  end

  test "should get page report by dates perMonth" do
    get '/reports/report_by_dates?start_odate=2022-01-01&end_odate=2023-01-01&datesReportType=perMonth'
    assert_response :success
  end
end
