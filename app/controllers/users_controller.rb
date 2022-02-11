class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @stamps = @user.stamps
  end

end
