class HomesController < ApplicationController
  def index
    @homes = Home.all
    @home = Home.new
  end

  def new
    @home = Home.new
  end

  def create
    Home.create(home_params)
    redirect_to homes_path
  end

  def show
    @home = Home.find(params[:id])
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
     redirect_to home_path(@home), notice: "編集しました"
    else
     render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_path, notice: "削除しました"
  end

  private
  def home_params
    params.require(:home).permit(:title, :content, :start_time)
  end

end
