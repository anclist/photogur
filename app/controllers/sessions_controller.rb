class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to pictures_url, notice: "You are logged in!"
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to pictures_url, notice: "Your have succesfully logged out!"
  end
end
