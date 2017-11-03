class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]

  def index
    @pictures =Picture.newest_first
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
      flash[:notice] = "You have succesfully uploaded your picture"
      redirect_to pictures_path
    else
      flash[:alert] = "Please fix errors before uploading your picture"
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.update(picture_params)


    if @picture.save
      flash[:notice] = "You have succesfully updated your picture"
      redirect_to picture(params[:id])
    else
      flash[:alert] = "Please fix errors before updating your picture"
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  private

  def picture_params
    return params.require(:picture).permit(:artist, :title, :image)
  end

end
