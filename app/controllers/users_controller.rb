class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    @user = User.find(params[:id])
    @chatroom = Chatroom.create(engager_id: current_user.id, receiver_id: params[:id])

    redirect_to user_path
  end

  def dislike
    @chatroom = Chatroom.find_by(engager_id: current_user.id, receiver_id: params[:id])
    @chatroom.destroy

    redirect_to user_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      format.html { redirect_to edit_user_registration_path }
      if avatar_params.present?
        @user.update(avatar_params)
        format.text { render partial: 'devise/registrations/avatar_form', locals: { user: @user }, formats: [:html] }
      elsif owner_params.present?
        @user.update(owner_params)
        format.text { render partial: 'devise/registrations/owner_info_form', locals: { user: @user }, formats: [:html] }
      else
        @user.update(user_params)
        format.text { render partial: 'devise/registrations/cat_info_form', locals: { user: @user }, formats: [:html] }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :gender, :breed, :description, photos: [])
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end

  def owner_params
    params.require(:user).permit(:owner_name, :owner_description)
  end
end
