class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    #user_paramsは{"name"=>"TEST", "email"=>"kotarosun8@yahoo.co.jp", "password"=>"TES", "password_confirmation"=>"TES"}
    #binding.pry
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #redirect_to user_path(@user)と同義
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
