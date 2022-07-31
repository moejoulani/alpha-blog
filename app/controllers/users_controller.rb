class UsersController < ApplicationController
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

private
def user_params
  params.require(:user).permit(:username,:email,:password)
end
end
