require 'pry'

class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    respond_to do |format|
      format.html { redirect_to edit_user_registration_path }
      if owner_params.present?
        format.text { render partial: 'devise/registrations/owner_info_form', locals: { user: @user }, formats: [:html] }
      else
        format.text { render partial: 'devise/registrations/cat_info_form', locals: { user: @user }, formats: [:html] }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :breed, :description, :owner_name, :owner_description, :avatar, photos: [])
  end

  def owner_params
    params.require(:user).permit(:owner_name, :owner_description)
  end

end
