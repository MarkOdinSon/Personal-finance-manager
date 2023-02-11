class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]

  # GET /operations or /operations.json
  def index
    @pageTitle = 'Your operations'

    # array of category names for jQuery search field
    @array_of_category_names = Category.pluck(:name)

    idSort = params[:idSort]
    amountSort = params[:amountSort]
    odateSort = params[:odateSort]
    operationsByCategorySort = params[:operationsByCategorySort]

    filter_options = params[:filter_operations_by_category_name]

    if filter_options != '' && !filter_options.nil?
      return @operations = Operation.search_by_category_name_scope(filter_options).page(params[:page])
    end

    # 1 by ID
    case idSort
    when 'Ascending'
      return @operations = Operation.all.order(:id).page(params[:page])
    when 'Descending'
      return @operations = Operation.all.order(id: :desc).page(params[:page])
    end

    # 2 by Amount
    case amountSort
    when 'Ascending'
      return @operations = Operation.all.order(:amount).page(params[:page])
    when 'Descending'
      return @operations = Operation.all.order(amount: :desc).page(params[:page])
    end

    # 3 by OperationDate
    case odateSort
    when 'Ascending'
      return @operations = Operation.all.order(:odate).page(params[:page])
    when 'Descending'
      return @operations = Operation.all.order(odate: :desc).page(params[:page])
    end

    # 4 by Categories
    case operationsByCategorySort
    when 'Alphabetically'
      return @operations = Operation.all.order(:category_id).page(params[:page])
    when 'AlphabeticallyReversed'
      return @operations = Operation.all.order(category_id: :desc).page(params[:page])
    end

    @operations = Operation.all.order(odate: :desc).page(params[:page])
  end

  # GET /operations/1 or /operations/1.json
  def show
    @pageTitle = "Operation #{@operation.id}"
  end

  # GET /operations/new
  def new
    @pageTitle = 'New operation'

    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
    @pageTitle = "Edit operation #{@operation.id}"
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:otype, :amount, :odate, :description, :category_id)
    end
end
