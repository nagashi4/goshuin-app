class StampsController < ApplicationController
  def index
    @stamps = Stamp.all
  end

  def new
    @stamp = Stamp.new
  end
   
  def create
    @stamp = Stamp.new(stamp_params)
    if @stamp.save
      redirect_to root_path

    else
      render :new
  end
end



  private  

  def stamp_params
    params.require(:stamp).permit(:title, :prefecture, :place, :image).merge(user_id: current_user.id)
  end
end

