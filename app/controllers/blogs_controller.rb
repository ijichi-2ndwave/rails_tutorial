class BlogsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:search].present?
      @blogs = Blog.search(params[:search])
    else
    #@blogs = Blog.all
    @blogs = Blog.paginate(page: params[:page],per_page: 10)
    end
  end

  def new
    @blog = Blog.new
    @user = current_user
  end

  def create
    permitted_params = params.require(:blog).permit(:id, :title, :content,:user_id)
    @blog = Blog.new (permitted_params)
    if @blog.save
      flash[:notice] = "新規登録しました！"
      redirect_to blog_path(@blog.id)
    else
      render 'new'
   end
  end

  def show
  end

  def edit
  end

  def update
   if @blog.update(params.require(:blog).permit(:title, :content))
    flash[:notice] = "更新しました！"
    redirect_to blogs_path
   else 
     render 'edit'
   end
  end

  def destroy  
    @blog.destroy
    redirect_to action: :index
  end

  def find_id
    @blog = Blog.find(params[:id])
    @user = current_user
  end

end
