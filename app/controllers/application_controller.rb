class ApplicationController < ActionController::Base
  def home
    render :template => "home"
  end
end
