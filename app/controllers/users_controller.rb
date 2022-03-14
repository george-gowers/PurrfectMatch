class UsersController < ApplicationController
  def index
    # if params[:location].present?
    #   @users = User.near(params[:location], 100)
    # else
    #   @users = User.where.not(id: current_user.id)
    # end
    if params[:query].present?
      @users = User.search_by_gender_location_and_breed(params[:query])
    else
      @users = User.all
    end
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

  def favorites
    fave_chats = Chatroom.where(engager_id: current_user.id)
    @favorites = []

    fave_chats.each do |chat|
      other_id = chat.receiver_id
      @favorites << User.find(other_id)
    end
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
      elsif photos_params.present?
        @user.update(photos_params)
        format.text { render partial: 'devise/registrations/carousel', locals: { user: @user }, formats: [:html] }
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
    params.require(:user).permit(:name, :gender, :breed, :description)
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end

  def owner_params
    params.require(:user).permit(:owner_name, :location, :owner_description)
  end

  def photos_params
    params.require(:user).permit(photos: [])
  end
end
