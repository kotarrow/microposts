class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    #user_paramsは{"name"=>"TEST", "email"=>"kotarosun8@yahoo.co.jp", "password"=>"TES", "password_confirmation"=>"TES"}
    if @user.save #DBにインスタンスの保存が成功したら
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #redirect_to user_path(@user)と同義
      #user_path、URLは/users/:id
    else
      render 'new'
    end
  end
  
  def edit
    if current_user != User.find(params[:id])
      flash[:danger] = "can not access"
      redirect_to edit_user_path(current_user) and return
      #render 'edit'
    end
  end
  
  def update
    if current_user == User.find(params[:id])
      if @user.update(user_params) #DBにインスタンスの保存が成功したら
        flash[:success] = "success update"
        redirect_to @user
        #redirect_to user_path(@user)と同義
        #user_path、URLは/users/:id
      else
        render 'edit'
        #redirect_to edit_user_path(current_user) and return
      end
    else
      redirect_to edit_user_path(current_user) and return
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                :password_confirmation, :profile, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
