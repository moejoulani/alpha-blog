class UsersController < ApplicationController
  def new
    @user  = User.new
    render :template => 'Users/new'
  end


end
