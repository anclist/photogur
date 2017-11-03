class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def index
    @pictures =Picture.newest_first
  end

  def show
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
  end

  def update
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
    @picture.destroy
    redirect_to pictures_path
  end

  private

  def picture_params
    return params.require(:picture).permit(:artist, :title, :image, :user)
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_user_owns_picture
    #code
  end

  def ensure_user_owns_picture
  unless current_user == @picture.user
    flash[:alert] = "You can't modify this picture"
    redirect_to pictures_path
  end
end

end
