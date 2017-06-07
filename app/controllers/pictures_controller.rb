class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end
  end

  def picture_params
   { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end

end
