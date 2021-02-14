class PhotosController < ApplicationController

  def index
  
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params) 
    if @photo.save
     redirect_to root_path
    else
     render :new
    end
  end



end
