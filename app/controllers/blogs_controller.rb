class BlogsController < ApplicationController
  def index
    @blog = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    permitted_params = params.require(:blog).permit(:id, :title, :content)
    @blog = Blog.new (permitted_params)
    if @blog.save
      flash[:notice] = "新規登録しました！"
      redirect_to blogs_path
    else
      render 'new'
   end
  end

  def show
   @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
   if @blog.update(params.require(:blog).permit(:title, :content))
    flash[:notice] = "更新しました！"
    redirect_to blogs_path
   else 
     render 'edit'
   end
  end

  def destroy  
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to action: :index
  end
end
