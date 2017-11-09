class SessionsController < ApplicationController
  def index

  end

# show login form
  def new
    # nothing
  end

  def create
    @user = User.find_by(session_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end  
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end

   private

  def session_params
    params.require(:login).permit(:email, :password)
  end

end
