class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
