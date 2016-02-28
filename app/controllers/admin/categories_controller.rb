class Admin::CategoriesController < Admin::AuthorizationController
  before_action :require_admin
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category '#{@category.name}' Created!"
      redirect_to current_user
    else
      flash.now[:error] = "Category must have a name"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
