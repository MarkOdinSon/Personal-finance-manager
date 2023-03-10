class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @pageTitle = 'Your categories'

    # array of category names for jQuery search field
    @array_of_category_names = Category.pluck(:name)

    nameSort = params[:nameSort]
    idSort = params[:idSort]

    category_name = params[:search_by_category_name]

    if category_name != '' && !category_name.nil?
      return @categories = Category.search_by_category_name_scope(category_name).page(params[:page])
    end

    return @categories = Category.all.order(:name).page(params[:page]) if nameSort == 'Alphabetically'

    return @categories = Category.all.order(name: :desc).page(params[:page]) if nameSort == 'AlphabeticallyReversed'

    return @categories = Category.all.order(:id).page(params[:page]) if idSort == 'Ascending'

    return @categories = Category.all.order(id: :desc).page(params[:page]) if idSort == 'Descending'

    # by Default ordered by name Alphabetically
    @categories = Category.all.order(:name).page(params[:page])
  end

  # GET /categories/1 or /categories/1.json
  def show
    @pageTitle = "Category #{@category.id}"
  end

  # GET /categories/new
  def new
    @pageTitle = 'New category'

    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @pageTitle = "Edit category #{@category.id}"
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    # If the user decides to delete a category, then all operations that belong to this category will also be deleted.
    Operation.delete(Operation.where(category_id: @category.id).ids)
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
