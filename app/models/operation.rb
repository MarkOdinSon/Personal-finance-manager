class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, :odate, :description, presence: true # validates_presence_of :amount, :odate, :description

  validates :amount, numericality: { greater_than: 0 }

  # Paginator [https://github.com/kaminari/kaminari]
  paginates_per 30 # default

  # search for operations for category name
  # LOWER(name) now working with SQLite when it is ukrainian / rus alphabet cause SQLite not using Unicode. But psql uses Unicode
  scope :search_by_category_name_scope, ->(name) { Operation.where(category_id: Category.where('LOWER(name) LIKE ?', "%#{name.gsub('+', ' ').downcase}%").ids) }

  private

  # report by category for a certain period of time
  # start_date = '2019-01-01' & end_date = '2020-01-01'
  def self.report_by_category_method(start_date, end_date)

    Operation.joins(:category).where('odate BETWEEN ? AND ?', start_date.to_s, end_date.to_s).group(:name).sum(:amount)

    # Others realizations of this method

    ## this case is not suitable because it returns ids instead of category names
    # Operation
    #  .where('odate BETWEEN ? AND ?', "#{start_date}", "#{end_date}")
    #    .group('category_id')
    #      .sum(:amount)

    ## using just WHERE
    # sql1 = "SELECT SUM(operations.amount) 'sum_amount', categories.name
    #      FROM operations, categories
    #      WHERE (operations.odate BETWEEN '#{start_date}' AND '#{end_date}') AND
    #      operations.category_id == categories.id
    #      GROUP BY categories.name"

    ## using INNER JOIN instead of just WHERE
    # sql2 = "SELECT SUM(operations.amount) 'sum', categories.name
    #       FROM operations
    #       INNER JOIN categories
    #         ON operations.category_id == categories.id
    #       WHERE operations.odate BETWEEN '#{start_date}' AND '#{start_date}'
    #       GROUP BY categories.name"

    ## ActiveRecord::Base.connection.execute(sql) - Command to run sql1 or sql2
  end

  # report by dates for a certain period of time
  # for example start_date = '2019-01-01' & end_date = '2019-01-06'
  def self.report_by_dates_method(start_date, end_date, datesReportType = 'perDay')

    operationsByDates = Operation.where('odate BETWEEN ? AND ?', start_date.to_s, end_date.to_s).order(:odate)

    resultHashByDates = Hash.new


    if datesReportType == 'perDay'
      # per day
      operationsByDates.each do |operation|
       onlyOdate = operation.odate.to_date.to_s

        if resultHashByDates[onlyOdate].nil?
          resultHashByDates[onlyOdate] = operation.amount
        else
          resultHashByDates[onlyOdate] = resultHashByDates[onlyOdate] + operation.amount
        end
      end
    else
      # per month
      operationsByDates.each do |operation|
        monthAndYear = operation.odate.to_date.strftime("%B %Y") # return only month and year

        if resultHashByDates[monthAndYear].nil?
          resultHashByDates[monthAndYear] = operation.amount
        else
          resultHashByDates[monthAndYear] = resultHashByDates[monthAndYear] + operation.amount
        end
      end
    end

    return resultHashByDates
  end
end
