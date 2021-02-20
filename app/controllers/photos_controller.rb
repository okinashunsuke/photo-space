class PhotosController < ApplicationController

  protect_from_forgery :except => [:destroy]
  before_action :move_to_index, only: [:edit,:destroy]
  

  def index
    @photos = Photo.group(:user_id)
  
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params) 
    if @photo.save
     redirect_to root_path
    else
     render :new
    end
  end


  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end
 
  def edit
    @photo = Photo.find(params[:id])
  end
 
  def update
    @photo = Photo.find(params[:id])
     if @photo.update(photo_params)
       redirect_to photo_path
     else
       render :edit  
     end
  end
 
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
     redirect_to root_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :describe).merge(user_id: current_user.id)
  end

  def move_to_index
    @photo = Photo.find(params[:id])
    unless user_signed_in? && current_user.id == @photo.user_id
      redirect_to action: :index
    end
  end



end
