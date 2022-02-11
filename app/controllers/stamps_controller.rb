class StampsController < ApplicationController

  before_action :authenticate_user!, only: [:edit,:new,:destroy]
  before_action :move_to_index, only: [:edit]
  
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

   def show
    @stamp = Stamp.find(params[:id])
    @comment = Comment.new
    @comments = @stamp.comments.includes(:user)
   end

   def edit
    @stamp = Stamp.find(params[:id])
   end

   def update
      @stamp = Stamp.find(params[:id])
      @stamp.update(stamp_params)
      if @stamp.save
        
        redirect_to action: :show
      else
        render :edit
      end
    end

    def destroy
      stamp = Stamp.find(params[:id])
      stamp.destroy
      redirect_to root_path
    end

   



  private  

  def stamp_params
    params.require(:stamp).permit(:title, :prefecture, :place, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    @stamp = Stamp.find(params[:id])
    unless   current_user.id == @stamp.user_id
      redirect_to action: :index
    end
  end
end

