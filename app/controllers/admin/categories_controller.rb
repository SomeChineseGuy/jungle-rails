class Admin::CategoriesController < Admin::AdminController
  

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
      @category = Category.new(categories_params)

      if @category.save
        redirect_to [:admin, :categories], notice: 'Categories created!'
      else
        render :new
      end
    end

    def destroy
      @category = Category.find params[:id]
      @category.destroy
      redirect_to [:admin, :categories], notice: 'Category deleted!'
    end


    private

    def categories_params
      params.require(:category).permit(
        :name,
        :description,
        :category_id,
        :quantity,
        :image,
        :price
      )
    end

  end

