class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(cookies.delete(:return_path) || root_path)
    else
      flash.now[:alert] = 'Проверьте введённые данные и повторите попытку'
      render :new
    end
  end

   def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end