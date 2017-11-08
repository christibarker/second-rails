class UsersController < ApplicationController

  # # shows all users
# / get local host: 3000/users
  def index
     @user = User.all

  end

# # / get local host: 3000/users/new
# # show form to make a new user
  def new
    @user = User.new
  end


# post to local host: 3000/users
# handles for submission and makes new user
  def create
    p params
    @user = User.create(user_params)
    redirect_to @user
  end

# / get local host: 3000/users/:id
# shows the user detail page
  def show
    @user = User.find(params[:id])
  end

# / get local host: 3000/users/:id/edit
# shows the form for editing the user
  def edit
    @user = User.find(params[:id])
  end

# / patch or put to  local host: 3000/users/:id
# handles updating the user info
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end


# / delete request local host: 3000/users/:id
# destroys the user info
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end


