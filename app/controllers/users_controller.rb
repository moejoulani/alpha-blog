class UsersController < ApplicationController

  def index
    @users = User.all
    render :template => 'Users/index'
  end

  def new
    @user  = User.new
    render :template => 'Users/new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]  = "Welcome To Alpha Blog #{@user.username} , You Have Successfully Signed Up"
      redirect_to articles_path
    else
      render 'Users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render :template => 'Users/edit'
  end

  def update
    @user  = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your Account Information was Successfully updated"
      redirect_to articles_path
    else
      render 'Users/edit'

    end
  end
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    render 'Users/show'
  end


private
def user_params
  params.require(:user).permit(:username,:email,:password)
end
end
