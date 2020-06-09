class UsersController < ApplicationController
protect_from_forgery :except => [:update]
  def index
    @user = User.all
  end

  def show
  end

  def edit
    @user = User.getUserDetail(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    User.updateUserInfo(params[:id],params[:name],params[:age],params[:profile])
    redirect_to action: :index
  end

  def create
  end
 
 def store
    puts "Store!!"
    user = User.new(name:params[:name],age:params[:age],profile:params[:profile])
    user.save
    redirect_to :action => "index"
  end

  def user_params
    params.require(:user).permit(:name,:gender,:birthday,:hometown,:remarks)
  end

  def destroy
    User.deleteUserInfo(params[:id])
    redirect_to :action => "index"     
  end
end
