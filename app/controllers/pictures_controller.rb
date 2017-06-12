class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @pictures_last_month = Picture.created_before(Time.utc(2017,"jun",07,20,01,1))
    @picture_year_of = Picture.created_in_year(2017)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
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

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to '/pictures'
  end

  def picture_params
   { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end

end
