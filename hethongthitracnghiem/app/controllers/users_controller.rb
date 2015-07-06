class UsersController < ApplicationController


  def index
    @user = User.list(params[:page])
  end

  def edit#bat su kien edit hien thi thong tin tai cot can sua,sau khi ket thuc se nhay den update
    if current_user!=nil&&((params[:user_id].to_i==current_user.id)||(current_user.role_id==1))
      @user = User.edit(params[:user_id])
      if current_user.role_id == 2
        @role = Role.where(:id => 2)
      else
        @role = Role.all
      end
    else
      redirect_to users_path
    end
  end

  def update#ham de xu ly edit udate cac thong tin xuong db
    @user = params[:user]
    @rl = Role.edit_find(params[:role_name])
    User.xu_ly_edit(params[:id].to_i,@user[:name],@user[:email],params[:gioitinh],@rl.id)
    redirect_to users_path
  end

end