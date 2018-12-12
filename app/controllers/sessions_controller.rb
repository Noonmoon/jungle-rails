class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:session][:email])

     if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end

 # if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
 #      session[:user_id] = user.id
 #      redirect_to '/'
 #    else
 #      redirect_to '/login'
 #    end