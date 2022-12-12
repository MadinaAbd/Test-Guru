class SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  def create
    super
    flash[:notise] = "Hello, #{@user.name}!"
  end

end
