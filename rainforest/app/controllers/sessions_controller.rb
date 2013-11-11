class SessionsController < ApplicationController
  def new
  end

 def create
    user = User.find_by_email(params[:email]) 					#we find by e-mail
    if user && user.authenticate(params[:password]) 			# find user and the user has authenticated and responds to true
      session[:user_id] = user.id 								#sesssion behaves like a hash so we are setting the user_id = user.id
      redirect_to products_url, :notice => "Logged in!"			#better to put stuff in database of user infomration
      															
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, :notice => "Logged out!"
  end
end